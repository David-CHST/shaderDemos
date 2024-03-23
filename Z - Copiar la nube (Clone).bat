@echo off
setlocal
chcp 65001 > nul
REM -----------------------------------------------------------
REM --------------------- DATOS MODIFICABLES ------------------
REM -----------------------------------------------------------
REM -----------------------------------------------------------
REM -----------------------------------------------------------
set linkRepositorio=git@github.com:Chestnut-David/experimentingGodot.git
set nombreDeNuevaCarpeta=Repositorio Godot (Uno)
REM -----------------------------------------------------------
REM -----------------------------------------------------------
REM -----------------------------------------------------------
REM -----------------------------------------------------------
REM -----------------------------------------------------------

echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
echo - - - Si procede se creará una nueva carpeta con los archivos del repositorio - - -
echo - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

REM PARTE 1: CONFIRMAR CLONE
set /p yes_no=Desea clonar los archivos de %linkRepositorio% a una nueva carpeta llamada %nombreDeNuevaCarpeta%? (y/n) 

if /i "%yes_no%"=="y" (
	goto :yes_script
) else (
	goto :no_script
    pause
)

:yes_script
echo - - - - - - - - - - - - - - - - - - - - -
echo - - - - Creando Carpeta - - - - - - - - -
echo - - - - - - - - - - - - - - - - - - - - -

REM PARTE 2: CREANDO CARPETA
set target_folder=%~dp0%nombreDeNuevaCarpeta%

if not exist "%target_folder%" (
	mkdir "%target_folder%"
)

REM PARTE 3: CAMBIANDO A CARPETA
cd /d "%target_folder%"

REM PARTE 4: CLONANDO ARCHIVOS A NUEVA CARPETA
echo.
echo - - - - - - - - - - - - - - - - - - - - -
echo - - - - Clonando archivos - - - - - - - -
echo - - - - - - - - - - - - - - - - - - - - -

@echo on
git clone "%linkRepositorio%"
@echo off

if %errorlevel% neq 0 (
	echo Hubo un error al realizar el clone.
	goto :no_script
) else (
	echo - - - - - - - - - - - - - - - - - - - - -
	echo - - - - Fin del Clone - - - - - - - - - -
	echo - - - - - - - - - - - - - - - - - - - - -
	REM -- FIN DEL CLONE --
)
pause

goto :end_script

:no_script
REM -- CANCELADO CLONE --
echo - - - - - - - - -  - - - - - - - - - -
echo - - - -  Clone fucking died  - - - - -
echo - - - - - - - - -  - - - - - - - - - -
echo.
echo.
echo Puede cambiar el enlace del repositorio
echo y el nombre de la carpeta al inicio del	
echo codigo de este archivo con notepad...
echo.
echo.
goto :end_script

:end_script
endlocal

cmd /k