@echo off
:: Run this script as Administrator to fix VS 2026 shortcuts
:: Right-click -> Run as administrator

echo Fixing Visual Studio 2026 Native Tools shortcuts...
echo.

powershell -ExecutionPolicy Bypass -Command ^
$shell = New-Object -ComObject WScript.Shell; ^
$vcPath = 'C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build'; ^
$folder = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio 2026\Visual Studio Tools\VC'; ^
$lnk = $shell.CreateShortcut(\"$folder\x64 Native Tools Command Prompt for VS.lnk\"); ^
$lnk.TargetPath = 'cmd.exe'; ^
$lnk.Arguments = '/k \"' + $vcPath + '\vcvars64.bat\"'; ^
$lnk.WorkingDirectory = $env:USERPROFILE; ^
$lnk.Save(); ^
Write-Host 'Fixed: x64 Native Tools'; ^
$lnk = $shell.CreateShortcut(\"$folder\x86 Native Tools Command Prompt for VS.lnk\"); ^
$lnk.TargetPath = 'cmd.exe'; ^
$lnk.Arguments = '/k \"' + $vcPath + '\vcvars32.bat\"'; ^
$lnk.WorkingDirectory = $env:USERPROFILE; ^
$lnk.Save(); ^
Write-Host 'Fixed: x86 Native Tools'; ^
$lnk = $shell.CreateShortcut(\"$folder\x64_x86 Cross Tools Command Prompt for VS.lnk\"); ^
$lnk.TargetPath = 'cmd.exe'; ^
$lnk.Arguments = '/k \"' + $vcPath + '\vcvarsamd64_x86.bat\"'; ^
$lnk.WorkingDirectory = $env:USERPROFILE; ^
$lnk.Save(); ^
Write-Host 'Fixed: x64_x86 Cross Tools'; ^
$lnk = $shell.CreateShortcut(\"$folder\x86_x64 Cross Tools Command Prompt for VS.lnk\"); ^
$lnk.TargetPath = 'cmd.exe'; ^
$lnk.Arguments = '/k \"' + $vcPath + '\vcvarsx86_amd64.bat\"'; ^
$lnk.WorkingDirectory = $env:USERPROFILE; ^
$lnk.Save(); ^
Write-Host 'Fixed: x86_x64 Cross Tools'

echo.
echo All shortcuts fixed!
echo.
echo You can now search "x64 Native Tools" in Start Menu.
pause
