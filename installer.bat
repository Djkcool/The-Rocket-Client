@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
title The Rocket Client 1.16.4 Installer v0.6
echo Are you ready to instal The Rocket Client for 1.16.4(Fabric) Version 0.6
echo Type Y to contiune with the instalation or Type N to cancel
set y=y
set N=N
SET /P rus1=
IF %rus1%==%n% exit
set n=n
if %rus1%==%n% exit
if %rus1%==%y% echo Thanks for choosing The Rocket client
set y=Y
if %rus1%==%y% echo Thanks for choosing The Rocket client
echo Is your .minecraft folder in the deafult position(%AppData%\.minecraft\)(Y/N)(If you dont know check before continuing the installation)
set y=y
set n=n
set /p mdp=
if %mdp%==%y% (
	set mf=%AppData%\.minecraft
	)
set y=Y
if %mdp%==%y% (
	set mf=%AppData%\.minecraft
	)
if %mdp%==%n% (
	echo Please state where your .minecraft folder is located
	set /p mf=
	)
set n=N
if %mdp%==%n% (
	echo Please state where your .minecraft folder is located
	set /p mf=
	)
echo Installing is about to begin.
move "Files" "c:\"
cd %mf%
powershell -EncodedCommand CgAgACAAIAAgACMAIABTAGUAdAAgAGYAaQBsAGUAIABuAGEAbQBlAAoAIAAgACAAIAAkAEYAaQBsAGUAIAA9ACAAJwBsAGEAdQBuAGMAaABlAHIAXwBwAHIAbwBmAGkAbABlAHMALgBqAHMAbwBuACcACgAgACAAIAAgAAoAIAAgACAAIAAjACAAUAByAG8AYwBlAHMAcwAgAGwAaQBuAGUAcwAgAG8AZgAgAHQAZQB4AHQAIABmAHIAbwBtACAAZgBpAGwAZQAgAGEAbgBkACAAYQBzAHMAaQBnAG4AIAByAGUAcwB1AGwAdAAgAHQAbwAgACQATgBlAHcAQwBvAG4AdABlAG4AdAAgAHYAYQByAGkAYQBiAGwAZQAKACAAIAAgACAAJABOAGUAdwBDAG8AbgB0AGUAbgB0ACAAPQAgAEcAZQB0AC0AQwBvAG4AdABlAG4AdAAgAC0AUABhAHQAaAAgACQARgBpAGwAZQAgAHwACgAgACAAIAAgACAAIAAgACAARgBvAHIARQBhAGMAaAAtAE8AYgBqAGUAYwB0ACAAewAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgACMAIABPAHUAdABwAHUAdAAgAHQAaABlACAAZQB4AGkAcwB0AGkAbgBnACAAbABpAG4AZQAgAHQAbwAgAHAAaQBwAGUAbABpAG4AZQAgAGkAbgAgAGEAbgB5ACAAYwBhAHMAZQAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgACQAXwAKACAAIAAgACAACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAAjACAASQBmACAAbABpAG4AZQAgAG0AYQB0AGMAaABlAHMAIAByAGUAZwBlAHgACgAgACAAIAAgACAAIAAgACAAIAAgACAAIABpAGYAKAAkAF8AIAAtAG0AYQB0AGMAaAAgACgAJwBeACcAIAArACAAWwByAGUAZwBlAHgAXQA6ADoARQBzAGMAYQBwAGUAKAAnACAAIAAiAHAAcgBvAGYAaQBsAGUAcwAiACAAOgAgAHsAJwApACkAKQAKACAAIAAgACAAIAAgACAAIAAgACAAIAAgAHsACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACMAIABBAGQAZAAgAG8AdQB0AHAAdQB0ACAAYQBkAGQAaQB0AGkAbwBuAGEAbAAgAGwAaQBuAGUACgAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACcAIAAgACAAIAAiADQAMwA4ADQANQAyAGMAOABiADQAMABlAGUAMwA3ADIAYwAwADAAZQAxADcANwAwADYANQA4AGIAZAAyADEAYgAiACAAOgAgAHsACgAgACAAIAAgACAAIAAiAGMAcgBlAGEAdABlAGQAIgAgADoAIAAiADIAMAAyADEALQAwADEALQAyADUAVAAwADUAOgA1ADgAOgA1ADMALgA0ADAAMgBaACIALAAKACAAIAAgACAAIAAgACIAZwBhAG0AZQBEAGkAcgAiACAAOgAgACIAQwA6AFwAXABQAHIAbwBnAHIAYQBtACAARgBpAGwAZQBzAFwAXABUAGgAZQAtAFIAbwBjAGsAZQB0AC0AQwBsAGkAZQBuAHQAXABcAFAAcgBvAGYAaQBsAGUAcwBcAFwAMQAuADEANgAuADQALQAwAC4ANgAiACwACgAgACAAIAAgACAAIAAiAGkAYwBvAG4AIgAgADoAIAAiAEUAbgBjAGgAYQBuAHQAaQBuAGcAXwBUAGEAYgBsAGUAIgAsAAoAIAAgACAAIAAgACAAIgBsAGEAcwB0AFUAcwBlAGQAIgAgADoAIAAiADIAMAAzADAALQAwADEALQAwADEAVAAwADAAOgAwADAAOgAwADAALgAwADAAMABaACIALAAKACAAIAAgACAAIAAgACIAbABhAHMAdABWAGUAcgBzAGkAbwBuAEkAZAAiACAAOgAgACIAZgBhAGIAcgBpAGMALQBsAG8AYQBkAGUAcgAtADAALgAxADAALgA4AC0AMQAuADEANgAuADQAIgAsAAoAIAAgACAAIAAgACAAIgBuAGEAbQBlACIAIAA6ACAAIgBUAGgAZQAgAFIAbwBjAGsAZQB0ACAAQwBsAGkAZQBuAHQAIAAxAC4AMQA2AC4ANAAgAC0AIAAwAC4ANgAiACwACgAgACAAIAAgACAAIAAiAHQAeQBwAGUAIgAgADoAIAAiAGMAdQBzAHQAbwBtACIACgAgACAAIAAgAH0ALAAnAAoAIAAgACAAIAAgACAAIAAgACAAIAAgACAAfQAKACAAIAAgACAAIAAgACAAIAB9AAoACgAgACAAIAAgACMAIABXAHIAaQB0AGUAIABjAG8AbgB0AGUAbgB0ACAAbwBmACAAJABOAGUAdwBDAG8AbgB0AGUAbgB0ACAAdgBhAHIAaQBiAGEAbABlACAAYgBhAGMAawAgAHQAbwAgAGYAaQBsAGUACgAgACAAIAAgACQATgBlAHcAQwBvAG4AdABlAG4AdAAgAHwAIABPAHUAdAAtAEYAaQBsAGUAIAAtAEYAaQBsAGUAUABhAHQAaAAgACQARgBpAGwAZQAgAC0ARQBuAGMAbwBkAGkAbgBnACAARABlAGYAYQB1AGwAdAAgAC0ARgBvAHIAYwBlAAoAIAAgACAAIAA=
cd %ProgramFiles%
if not exist The-Rocket-Client (
	md The-Rocket-Client
	)
cd The-Rocket-client
if not exist Profiles (
	md Profiles
	)
cd Profiles
if exist 1.16.4-0.6 (
	cd 1.16.4-0.6
	move "saves" "%ProgramFiles%\The-Rocket-Client\Profiles"
	cd %ProgramFiles%\The-Rocket-Client\Profiles
	RD /S /Q 1.16.4-0.6
	)
cd c:\Files
move 1.16.4-0.6 "%ProgramFiles%\The-Rocket-Client\Profiles"
cd %ProgramFiles%\The-Rocket-Client\Profiles
if exist saves (
	move "saves" "%ProgramFiles%\The-Rocket-Client\Profiles\1.16.4-0.6"
	)
cd %mf%\versions
if not exist fabric-loader-0.10.8-1.16.4 (
	cd c:\Files
	move "fabric-loader-0.10.8-1.16.4" "%mf%\versions"
	)
echo Would You like to install so mods to improve preformance?(Y/N)
set y=Y
set n=N
SET /P pi1=
if %pi1%==%y% (
	cd %ProgramFiles%\The-Rocket-Client\Profiles\1.16.4-0.6\mods
	if exist lithium-fabric-mc1.16.4-0.6.0.jar (
		del lithium-fabric-mc1.16.4-0.6.0.jar
		)
	if exist phosphor-fabric-mc1.16.3-0.7.0+build.10.jar (
		del phosphor-fabric-mc1.16.3-0.7.0+build.10.jar
		)
	if exist sodium-fabric-mc1.16.3-0.1.0.jar (
		del sodium-fabric-mc1.16.3-0.1.0.jar
		)
	if exist logical_zoom-0.0.7.jar (
		del logical_zoom-0.0.7.jar
		)
	cd c:\Files\1.16.4-PIM-0.6\
	move "sodium-fabric-mc1.16.3-0.1.0.jar" "%ProgramFiles%\The-Rocket-Client\Profiles\1.16.4-0.6\mods"
	move "phosphor-fabric-mc1.16.3-0.7.0+build.10.jar" "%ProgramFiles%\The-Rocket-Client\Profiles\1.16.4-0.6\mods"
	move "lithium-fabric-mc1.16.4-0.6.0.jar" "%ProgramFiles%\The-Rocket-Client\Profiles\1.16.4-0.6\mods"
	move "logical_zoom-0.0.7.jar" "%ProgramFiles%\The-Rocket-Client\Profiles\1.16.4-0.6\mods"
	)
set y=y
if %pi1%==%y% (
	cd %ProgramFiles%\The-Rocket-Client\Profiles\1.16.4-0.6\mods
	if exist lithium-fabric-mc1.16.4-0.6.0.jar (
		del lithium-fabric-mc1.16.4-0.6.0.jar
		)
	if exist phosphor-fabric-mc1.16.3-0.7.0+build.10.jar (
		del phosphor-fabric-mc1.16.3-0.7.0+build.10.jar
		)
	if exist sodium-fabric-mc1.16.3-0.1.0.jar (
		del sodium-fabric-mc1.16.3-0.1.0.jar
		)
	if exist logical_zoom-0.0.7.jar (
		del logical_zoom-0.0.7.jar
		)
	cd c:\Files\1.16.4-PIM-0.6\
	move "sodium-fabric-mc1.16.3-0.1.0.jar" "%ProgramFiles%\The-Rocket-Client\Profiles\1.16.4-0.6\mods"
	move "phosphor-fabric-mc1.16.3-0.7.0+build.10.jar" "%ProgramFiles%\The-Rocket-Client\Profiles\1.16.4-0.6\mods"
	move "lithium-fabric-mc1.16.4-0.6.0.jar" "%ProgramFiles%\The-Rocket-Client\Profiles\1.16.4-0.6\mods"
	move "logical_zoom-0.0.7.jar" "%ProgramFiles%\The-Rocket-Client\Profiles\1.16.4-0.6\mods"
	)
if %pi1%==%n% (
	echo Not Installing Preformance improving mods
	)
set n=n
if %pi1%==%n% (
	echo Not Installing Preformance improving mods
	)
cd c:\
RD /S /Q Files
echo Installation Complete!
pause