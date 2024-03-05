@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\qiuyu\OneDrive\Documents\GitHub\LAB5\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\qiuyu\OneDrive\Documents\GitHub\LAB5\lab5_v2.c"
if not exist hex2mif.exe goto done
if exist lab5_v2.ihx hex2mif lab5_v2.ihx
if exist lab5_v2.hex hex2mif lab5_v2.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\qiuyu\OneDrive\Documents\GitHub\LAB5\lab5_v2.hex
