@echo off
setlocal
set "PROJECT_DIR=%~dp0.."
set "LOCAL_JAVA=%PROJECT_DIR%\.tools\jdk21\jdk-21.0.12.1+1"
set "LOCAL_MAVEN=%PROJECT_DIR%\.tools\maven\apache-maven-3.9.11\bin\mvn.cmd"
if exist "%LOCAL_JAVA%\bin\java.exe" set "JAVA_HOME=%LOCAL_JAVA%"
if exist "%LOCAL_MAVEN%" (
  call "%LOCAL_MAVEN%" %*
  exit /b %ERRORLEVEL%
)
where mvn.cmd >nul 2>nul
if %ERRORLEVEL% EQU 0 (
  call mvn.cmd %*
  exit /b %ERRORLEVEL%
)
echo Maven was not found. Run from the project backend folder or install Maven. 1>&2
exit /b 1
