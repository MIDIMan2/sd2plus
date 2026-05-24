del SDoom2R.pk3
"%ProgramFiles%\7-Zip\7z.exe" a SDoom2R.pk3 -tzip .\Src\* -r -x!sd2levelfull.txt -x!*.pk3 -x!*.bat -x!*.gitignore -x!*.gitattributes -x!"*git\"

::New thing I'm testing. Bare with me. -KrazeeTobi Sep6-23
call copy.bat