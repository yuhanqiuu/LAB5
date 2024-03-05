@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\qiuyu\OneDrive\Documents\GitHub\LAB5\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\qiuyu\OneDrive\Documents\GitHub\LAB5\Yuhan_Yuqian_lab5.c"
if not exist hex2mif.exe goto done
if exist Yuhan_Yuqian_lab5.ihx hex2mif Yuhan_Yuqian_lab5.ihx
if exist Yuhan_Yuqian_lab5.hex hex2mif Yuhan_Yuqian_lab5.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\qiuyu\OneDrive\Documents\GitHub\LAB5\Yuhan_Yuqian_lab5.hex
