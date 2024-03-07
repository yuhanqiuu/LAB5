@echo off
::This file was created automatically by CrossIDE to compile with C51.
D:
cd "\clone\LAB5\"
"D:\CrossIDE\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "D:\clone\LAB5\lab5v3.c"
if not exist hex2mif.exe goto done
if exist lab5v3.ihx hex2mif lab5v3.ihx
if exist lab5v3.hex hex2mif lab5v3.hex
:done
echo done
echo Crosside_Action Set_Hex_File D:\clone\LAB5\lab5v3.hex
