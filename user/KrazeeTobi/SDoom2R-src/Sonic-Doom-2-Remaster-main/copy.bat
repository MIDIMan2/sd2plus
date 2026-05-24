@echo off

TITLE Glaciest Test Build Copier
:: Truely more Glacierer. 
echo Now that you've compiled a build of Sonic Doom 2 Remastered, you now have a choice to continue or to not continue.

set /p _copyit=Would you like to copy to your Doom playtesting folder? (Y/N) 

if %_copyit% equ Y goto PERSON 
if %_copyit% equ N goto FASTFINISH

:PERSON
Echo Which person compiled this build? (We need to know in order to place your build into the correct Doom testing folder)
set /p _copyperson=SnakieJakie or KrazzTobi?: 

if %_copyperson% equ KrazeeTobi goto TOBIMUFFIN 
if %_copyperson% equ SnakieJakie goto JAKIEHATKID 
:: heh //Jakie

if %_copyperson% equ Tobi goto TOBIMUFFIN 
if %_copyperson% equ Jakie goto JAKIEHATKID 

:: SnakieJakie is too long for my liking. //Jakie

:: The thing about using strings and not values is that compared to strings, we have a lot more control over what happens when the user picks a wrong value. 
:: Strings are harder to do that with because a string can be anything.
:: Say, Jakie was 1 and Tobi was 2. If that was the case, we could say that if the value was less than 1 and more than 2, then throw out a error and send the user back.
:: This isn't really a deal breaker though, after all this BAT will be just used by us. If anyone wants to use TobiCompile, they should just use the one I'm about to put on Github.
:: Anyways thanks for joining my ted talk, join back in 2 weeks when I will talk about the horrors of using the Build engine.
:: //Jakie





:TOBIMUFFIN
echo Copying to KrazeeTobi's Doom directory...
copy SDoom2R.pk3 "C:\Users\alfic\Desktop\Sonic Doom 2 Remaster\Test Labs\SDoom2R.pk3"
goto SLOWFINISH

:JAKIEHATKID
echo Copying to SnakieJakie's Doom directory...
copy SDoom2R.pk3 "C:\Users\Third\Documents\Projects\Doom Projects\SD2\COMPILED\SDoom2R.pk3"
:: I should really change my Windows name. //Jakie

goto SLOWFINISH

:SLOWFINISH
echo Build copying finished. You can now start up your test build! Woohoo!
pause
exit

:FASTFINISH
echo The build was not copied to the Doom directory. Have a good day.
pause
exit