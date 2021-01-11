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
if exist betterpingdisplay.json del betterpingdisplay.json
cd c:\Files\Configs\
move kronhud %AppData%\.minecraft\config\
move keystrokes.toml %AppData%\.minecraft\config\
move pvpsettings.txt %AppData%\.minecraft\config\
move betterpingdisplay.json %AppData%\.minecraft\config\
cd %AppData%\.minecraft\mods
if exist aurorakeystrokes-fabric-1.2.4+1.16.2.jar (
	del aurorakeystrokes-fabric-1.2.4+1.16.2.jar
	)
if exist BetterPvPFairPlay_20.30.0_Fabric_1.16.4.jar (
	del BetterPvPFairPlay_20.30.0_Fabric_1.16.4.jar
	)
if exist BetterPvPFairPlay_21.0.0_Fabric_1.16.4.jar (
	del BetterPvPFairPlay_21.0.0_Fabric_1.16.4.jar
	)
if exist KronHUD-1.1.1-beta-1.16.2+.jar (
	del KronHUD-1.1.1-beta-1.16.2+.jar
	)
if exist fabric-api-0.29.3+1.16.jar (
	del fabric-api-0.29.3+1.16.jar
	)
if exist BetterPingDisplay-Fabric-1.16.4-1.1.jar (
	del BetterPingDisplay-Fabric-1.16.4-1.1.jar
	)
cd c:\Files\Mods\
move aurorakeystrokes-fabric-1.2.4+1.16.2.jar %AppData%\.minecraft\mods\
move BetterPvPFairPlay_21.0.0_Fabric_1.16.4.jar %AppData%\.minecraft\mods\
move KronHUD-1.1.1-beta-1.16.2+.jar %AppData%\.minecraft\mods\
move fabric-api-0.29.3+1.16.jar %AppData%\.minecraft\mods\
move BetterPingDisplay-Fabric-1.16.4-1.1.jar %AppData%\.minecraft\mods\
echo Would You like to install so mods to improve preformance?(Y/N)
set y=Y
set n=N
SET /P pi1=
if %pi1%==%y% (
	cd %AppData%\.minecraft\mods\
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
	cd c:\Files\Mods\
	move sodium-fabric-mc1.16.3-0.1.0.jar %AppData%\.minecraft\mods\
	move phosphor-fabric-mc1.16.3-0.7.0+build.10.jar %AppData%\.minecraft\mods\
	move lithium-fabric-mc1.16.4-0.6.0.jar %AppData%\.minecraft\mods\
	move logical_zoom-0.0.7.jar %AppData%\.minecraft\mods\
	)
set y=y
if %pi1%==%y% (
	cd %AppData%\.minecraft\mods\
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
	cd c:\Files\Mods\
	move sodium-fabric-mc1.16.3-0.1.0.jar %AppData%\.minecraft\mods\
	move phosphor-fabric-mc1.16.3-0.7.0+build.10.jar %AppData%\.minecraft\mods\
	move lithium-fabric-mc1.16.4-0.6.0.jar %AppData%\.minecraft\mods\
	move logical_zoom-0.0.7.jar %AppData%\.minecraft\mods\
	)
echo Installation Complete!
echo To use the client use the fabric profile if you do not have it please install fabric 
pause