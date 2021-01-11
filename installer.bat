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
title DPvP Client 1.16.4 Installer
echo Are you ready to instal the DPvP Client for 1.16.4(Fabric)
echo Type Y to contiune with the instalation or Type N to cancel
set y=y
set N=N
SET /P rus1=
IF %rus1%==%n% exit
set n=n
if %rus1%==%n% exit
if %rus1%==%y% echo Thanks for choosing the DPvP client
set y=Y
if %rus1%==%y% echo Thanks for choosing the DPvP client
echo Installing is about to begin.
move Files c:\
cd %AppData%\.minecraft\config\
if  exist kronhud @RD /S /Q kronhud
if exist keystrokes.toml del keystrokes.toml
if exist pvpsettings.txt del pvpsettings.txt
cd \Files\Configs\
move kronhud %AppData%\.minecraft\config\
move keystrokes.toml %AppData%\.minecraft\config\
move pvpsettings.txt %AppData%\.minecraft\config\
cd %AppData%\.minecraft\mods
if exist aurorakeystrokes-fabric-1.2.4+1.16.2.jar (
	del aurorakeystrokes-fabric-1.2.4+1.16.2.jar
	)
if exist BetterPvPFairPlay_20.30.0_Fabric_1.16.4.jar (
	del BetterPvPFairPlay_20.30.0_Fabric_1.16.4.jar
	)
if exist KronHUD-1.1.1-beta-1.16.2+.jar (
	del KronHUD-1.1.1-beta-1.16.2+.jar
	)
if exist fabric-api-0.29.3+1.16.jar (
	del fabric-api-0.29.3+1.16.jar
	)
cd \Files\Mods\
move aurorakeystrokes-fabric-1.2.4+1.16.2.jar %AppData%\.minecraft\mods\
move BetterPvPFairPlay_20.30.0_Fabric_1.16.4.jar %AppData%\.minecraft\mods\
move KronHUD-1.1.1-beta-1.16.2+.jar %AppData%\.minecraft\mods\
move fabric-api-0.29.3+1.16.jar %AppData%\.minecraft\mods\
echo Installation Complete!
echo To use the client use the fabric profile if you do not have it please install fabric 
pause