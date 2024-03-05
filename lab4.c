// PeriodEFM8.c: Measure the period of a signal on pin P0.1.
//
// By:  Jesus Calvino-Fraga (c) 2008-2018
//
// The next line clears the "C51 command line options:" field when compiling with CrossIDE
//  ~C51~  

#include <EFM8LB1.h>
#include <stdio.h>
#include <math.h>

#define SYSCLK      72000000L  // SYSCLK frequency in Hz
#define BAUDRATE      115200L  // Baud rate of UART in bps

#define LCD_RS P1_7
// #define LCD_RW Px_x // Not used in this code.  Connect to GND
#define LCD_E  P2_0
#define LCD_D4 P1_3
#define LCD_D5 P1_2
#define LCD_D6 P1_1
#define LCD_D7 P1_0
#define CHARS_PER_LINE 16
#define LOCK 0
#define UNLOCK 1
unsigned int state=0;
unsigned char overflow_count;
unsigned int passcode=292,attempt=0,flag1=0,flag2=0;

char _c51_external_startup (void)
{
    // Disable Watchdog with key sequence
    SFRPAGE = 0x00;
    WDTCN = 0xDE; //First key
    WDTCN = 0xAD; //Second key
  
    VDM0CN |= 0x80;
    RSTSRC = 0x02;

    #if (SYSCLK == 48000000L)   
        SFRPAGE = 0x10;
        PFE0CN  = 0x10; // SYSCLK < 50 MHz.
        SFRPAGE = 0x00;
    #elif (SYSCLK == 72000000L)
        SFRPAGE = 0x10;
        PFE0CN  = 0x20; // SYSCLK < 75 MHz.
        SFRPAGE = 0x00;
    #endif
    
    #if (SYSCLK == 12250000L)
        CLKSEL = 0x10;
        CLKSEL = 0x10;
        while ((CLKSEL & 0x80) == 0);
    #elif (SYSCLK == 24500000L)
        CLKSEL = 0x00;
        CLKSEL = 0x00;
        while ((CLKSEL & 0x80) == 0);
    #elif (SYSCLK == 48000000L) 
        // Before setting clock to 48 MHz, must transition to 24.5 MHz first
        CLKSEL = 0x00;
        CLKSEL = 0x00;
        while ((CLKSEL & 0x80) == 0);
        CLKSEL = 0x07;
        CLKSEL = 0x07;
        while ((CLKSEL & 0x80) == 0);
    #elif (SYSCLK == 72000000L)
        // Before setting clock to 72 MHz, must transition to 24.5 MHz first
        CLKSEL = 0x00;
        CLKSEL = 0x00;
        while ((CLKSEL & 0x80) == 0);
        CLKSEL = 0x03;
        CLKSEL = 0x03;
        while ((CLKSEL & 0x80) == 0);
    #else
        #error SYSCLK must be either 12250000L, 24500000L, 48000000L, or 72000000L
    #endif
    
    P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
    XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
    XBR1     = 0X00;
    XBR2     = 0x40; // Enable crossbar and weak pull-ups

    #if (((SYSCLK/BAUDRATE)/(2L*12L))>0xFFL)
        #error Timer 0 reload value is incorrect because (SYSCLK/BAUDRATE)/(2L*12L) > 0xFF
    #endif
    // Configure Uart 0
    SCON0 = 0x10;
    CKCON0 |= 0b_0000_0000 ; // Timer 1 uses the system clock divided by 12.
    TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
    TL1 = TH1;      // Init Timer1
    TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
    TMOD |=  0x20;                       
    TR1 = 1; // START Timer1
    TI = 1;  // Indicate TX0 ready
    
    return 0;
}

// Uses Timer3 to delay <us> micro-seconds. 
void Timer3us(unsigned char us)
{
    unsigned char i;               // usec counter
    
    // The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON0:
    CKCON0|=0b_0100_0000;
    
    TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
    TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
    
    TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
    for (i = 0; i < us; i++)       // Count <us> overflows
    {
        while (!(TMR3CN0 & 0x80));  // Wait for overflow
        TMR3CN0 &= ~(0x80);         // Clear overflow indicator
    }
    TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
}

void waitms (unsigned int ms)
{
    unsigned int j;
    for(j=ms; j!=0; j--)
    {
        Timer3us(249);
        Timer3us(249);
        Timer3us(249);
        Timer3us(250);
    }
}

void TIMER0_Init(void)
{
    TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
    TMOD|=0b_0000_0001; // Timer/Counter 0 used as a 16-bit timer
    TR0=0; // Stop Timer/Counter 0
}

void LCD_pulse (void)
{
    LCD_E=1;
    Timer3us(40);
    LCD_E=0;
}

void LCD_byte (unsigned char x)
{
    // The accumulator in the C8051Fxxx is bit addressable!
    ACC=x; //Send high nible
    LCD_D7=ACC_7;
    LCD_D6=ACC_6;
    LCD_D5=ACC_5;
    LCD_D4=ACC_4;
    LCD_pulse();
    Timer3us(40);
    ACC=x; //Send low nible
    LCD_D7=ACC_3;
    LCD_D6=ACC_2;
    LCD_D5=ACC_1;
    LCD_D4=ACC_0;
    LCD_pulse();
}

void WriteData (unsigned char x)
{
    LCD_RS=1;
    LCD_byte(x);
    waitms(2);
}

void WriteCommand (unsigned char x)
{
    LCD_RS=0;
    LCD_byte(x);
    waitms(5);
}

void LCD_4BIT (void)
{
    LCD_E=0; // Resting state of LCD's enable is zero
    // LCD_RW=0; // We are only writing to the LCD in this program
    waitms(20);
    // First make sure the LCD is in 8-bit mode and then change to 4-bit mode
    WriteCommand(0x33);
    WriteCommand(0x33);
    WriteCommand(0x32); // Change to 4-bit mode

    // Configure the LCD
    WriteCommand(0x28);
    WriteCommand(0x0c);
    WriteCommand(0x01); // Clear screen command (takes some time)
    waitms(20); // Wait for clear screen command to finsih.
}

void LCDprint(char * string, unsigned char line, bit clear)
{
    int j;

    WriteCommand(line==2?0xc0:0x80);
    waitms(5);
    for(j=0; string[j]!=0; j++) WriteData(string[j]);// Write the message
    if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
}

int getsn (char * buff, int len)
{
    int j;
    char c;
    
    for(j=0; j<(len-1); j++)
    {
        c=getchar();
        if ( (c=='\n') || (c=='\r') )
        {
            buff[j]=0;
            return j;
        }
        else
        {
            buff[j]=c;
        }
    }
    buff[j]=0;
    return len;
}


void main (void) 
{
    idata char buff[17];
    idata char buff0[17];
    int num;
    int num0;
    int num1;
    int num2;
    float period;
    float heart_beat;
    TIMER0_Init();
    // Configure the LCD
    LCD_4BIT();

// Display something in the LCD
	LCDprint("Enter passcode: ", 1, 1);
	LCDprint("                ", 2, 1);
	
	while(state==0)
	{
	    waitms(500); // Give PuTTY a chance to start.
		printf("Type what you want to display in line 2 (16 char max): ");
		getsn(buff0, sizeof(buff0));
		printf("\n");
		LCDprint(buff0, 2, 1);
		waitms(500); // Give PuTTY a chance to start.
		num0=buff0[0]-'0';
		num1=buff0[1]-'0';
		num2=buff0[2]-'0';
		num=num0*100+num1*10+num2*1;
		if(num==passcode)
		{
		  state= UNLOCK;
		  flag1=1;
		  attempt=0;
		}
		else
		{
		 LCDprint("Wrong Passcode", 1, 1); 
		 state= LOCK;  
		 attempt++;
		 if(attempt==3)
		 {
		  LCDprint("Attempts Over ", 1, 1);
		  LCDprint("System Hang", 2, 1);
		  flag2=1;
		  state= UNLOCK;
		  }
		 else
		 {
		  LCDprint("Try Again", 1, 1);
		  }
		  }
	}
	
    if(flag2==1) goto infinit;
    else goto heart_beat;
    
heart_beat:

    LCDprint("Heart Rate(BPM):", 1, 1);
    LCDprint("               ", 2, 1);

    waitms(500); // Give PuTTY a chance to start.
    printf("\x1b[2J"); // Clear screen using ANSI escape sequence.

    printf ("EFM8 Period measurement at pin P0.1 using Timer 0.\n"
            "File: %s\n"
            "Compiled: %s, %s\n\n",
            __FILE__, __DATE__, __TIME__);

    while (flag1)
    {
        // Reset the counter
        TL0=0; 
        TH0=0;
        TF0=0;
        overflow_count=0;
        
        while(P0_1!=0); // Wait for the signal to be zero
        while(P0_1!=1); // Wait for the signal to be one
        TR0=1; // Start the timer
        while(P0_1!=0) // Wait for the signal to be zero
        {
            if(TF0==1) // Did the 16-bit timer overflow?
            {
                TF0=0;
                overflow_count++;
            }
        }
        while(P0_1!=1) // Wait for the signal to be one
        {
            if(TF0==1) // Did the 16-bit timer overflow?
            {
                TF0=0;
                overflow_count++;
            }
        }
        TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
        period=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
        heart_beat=60/period;
        
        sprintf(buff,"%03.2f", (float)heart_beat);
        LCDprint(buff, 2, 1);
        printf("%s\r\n", buff);
   
        
    }
infinit:while(1); 
}