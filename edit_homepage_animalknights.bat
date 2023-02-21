@echo off
rem Bypass "Terminate Batch Job" prompt.
if "%~1"=="-FIXED_CTRL_C" (
   REM Remove the -FIXED_CTRL_C parameter
   SHIFT
) ELSE (
   REM Run the batch with <NUL and -FIXED_CTRL_C
   CALL <NUL %0 -FIXED_CTRL_C %*
   GOTO :GIT
)
echo animalhnights.at workflow...
echo 
echo pull from GitHub
cd Homepage
git pull origin master

.\hugo server
firefox http://localhost:1313

:GIT
git add *
echo 
set /p response=please commit changes:
echo %response%
git commit -m "%response%"
git push origin master
 
