@echo off
setlocal EnableDelayedExpansion

@if exist _objs del /f _objs

echo OBJSX = \> _objs

for /f "delims=" %%A in ('forfiles /s /p src /m *.java /c "cmd /c echo @relpath"') do (
	set "file=%%~A"
	setlocal enableDelayedExpansion
	set file=!file:~2!
	set file=!file:.java=.class \!
	set "tps=	$(OBJECT_DIR)/"
	set tps=!tps!!file!
	
	echo !tps!>> _objs
	endlocal
)
echo. >> _objs

setlocal enableDelayedExpansion
set sxn=
set lxn=
for /f "delims=" %%A in ('forfiles /s /p src /m *.java /c "cmd /c echo @relpath"') do (
	set "file=%%~A"
	set file=!file:~2!
	set "tps=$(SOURCE_DIR)/"
	set tps=!tps!!file!
	
	set sxn=!sxn! !tps!
	
	set tps=!tps:SOURCE_DIR=OBJECT_DIR!
	set tps=!tps:.java=.class!
	
	set lxn=!lxn! !tps!
)
echo build_objs: >> _objs

set "secondLine1=	@$(COMP_CLASS) $(CFLAGS) "
echo !secondLine1!!sxn! >> _objs

echo. >> _objs
endlocal

exit;

for /f "delims=" %%A in ('forfiles /s /p src /m *.java /c "cmd /c echo @relpath"') do (
setlocal enableDelayedExpansion
	set "dest2=$(OBJECT_DIR)/"
	set "dest=%%~A"
	set dest=!dest:~2!
	set dest=!dest:.java=.class!
	set dest=!dest2!!dest!
	
	set "source=%%~A"
	set source=!source:~2!

	set "firstLine=: $(SOURCE_DIR)/"
	
	set "secondLine1=	@$(COMP_CLASS) $(CFLAGS) $(SOURCE_DIR)/"
	
	echo !dest!!firstLine!!source! >> _objs
	echo !secondLine1!!source! >> _objs
endlocal
)
