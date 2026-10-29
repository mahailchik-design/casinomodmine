@echo off
setlocal
where java >nul 2>nul
if errorlevel 1 (
  echo Seychas nuzhen JDK 21: https://adoptium.net/ - ustanovi i zapusti snova
  pause
  exit /b 1
)
if not exist gradle-dist\gradle-9.2.1\bin\gradle.bat (
  echo Skachivayu Gradle...
  powershell -NoProfile -Command "Invoke-WebRequest https://services.gradle.org/distributions/gradle-9.2.1-bin.zip -OutFile gradle.zip; Expand-Archive gradle.zip gradle-dist -Force"
)
call gradle-dist\gradle-9.2.1\bin\gradle.bat build
echo.
echo Gotovo! Tvoj mod: build\libs\casinomod-1.0.0.jar
pause
