$ErrorActionPreference = 'Stop'
$projectRoot = $PSScriptRoot
$toolsRoot = Join-Path $projectRoot '.tools'
$runtimeRoot = Join-Path $projectRoot '.runtime'
$mongoExe = Join-Path $toolsRoot 'mongodb-win32-x86_64-windows-7.0.43\bin\mongod.exe'
$javaHome = Join-Path $toolsRoot 'jdk-21.0.12.1+1'
$mongoData = Join-Path $runtimeRoot 'mongodb-data'
$mongoLog = Join-Path $runtimeRoot 'mongodb.log'

if (!(Test-Path -LiteralPath $mongoExe)) { throw "MongoDB is missing: $mongoExe" }
if (!(Test-Path -LiteralPath (Join-Path $javaHome 'bin\java.exe'))) { throw "Java 21 is missing: $javaHome" }
New-Item -ItemType Directory -Force -Path $mongoData,$runtimeRoot | Out-Null

$mongoConnection = Test-NetConnection 127.0.0.1 -Port 27017 -WarningAction SilentlyContinue
if (!$mongoConnection.TcpTestSucceeded) {
  Start-Process -FilePath $mongoExe -ArgumentList '--dbpath', $mongoData, '--bind_ip', '127.0.0.1', '--port', '27017', '--logpath', $mongoLog, '--logappend' -WindowStyle Hidden | Out-Null
}

$backendEnv = Join-Path $projectRoot 'backend\.env'
if (!(Test-Path -LiteralPath $backendEnv)) {
  Copy-Item -LiteralPath (Join-Path $projectRoot 'backend\.env.example') -Destination $backendEnv
}

$backendRunning = Test-NetConnection 127.0.0.1 -Port 8080 -WarningAction SilentlyContinue
if (!$backendRunning.TcpTestSucceeded) {
  $backendCommand = "`$env:JAVA_HOME='$javaHome'; Set-Location '$projectRoot\backend'; .\mvnw.cmd spring-boot:run -q"
  Start-Process powershell.exe -ArgumentList '-NoProfile', '-ExecutionPolicy', 'Bypass', '-Command', $backendCommand -WindowStyle Hidden | Out-Null
}

$frontendRunning = Test-NetConnection 127.0.0.1 -Port 5173 -WarningAction SilentlyContinue
if (!$frontendRunning.TcpTestSucceeded) {
  $frontendCommand = "Set-Location '$projectRoot\frontend'; npm.cmd run dev -- --host 127.0.0.1"
  Start-Process powershell.exe -ArgumentList '-NoProfile', '-ExecutionPolicy', 'Bypass', '-Command', $frontendCommand -WindowStyle Hidden | Out-Null
}

Write-Output 'Campus Recruitment Management System started.'
Write-Output 'Frontend: http://127.0.0.1:5173'
Write-Output 'Backend:  http://127.0.0.1:8080'
