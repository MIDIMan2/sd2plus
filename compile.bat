@echo off
del SDOOM2.pk3
"%ProgramFiles%\7-Zip\7z.exe" a SDOOM2.pk3 -tzip .\dev\SDOOM2\* -r -x!*.pk3 -x!*.bat -x!*.gitignore -x!*.gitattributes -x!"*git\"
echo All done compiling! Enjoy your fully built Sonic Doom 2: Plus files!