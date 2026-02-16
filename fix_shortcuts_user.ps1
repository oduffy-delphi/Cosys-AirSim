# Create Visual Studio 2026 Native Tools shortcuts in user's Start Menu
$shell = New-Object -ComObject WScript.Shell

$vcPath = "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build"
$shortcutFolder = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\VS 2026 Tools"

# Create folder if it doesn't exist
if (!(Test-Path $shortcutFolder)) {
    New-Item -ItemType Directory -Path $shortcutFolder | Out-Null
}

# x64 Native Tools
$lnk = $shell.CreateShortcut("$shortcutFolder\x64 Native Tools Command Prompt.lnk")
$lnk.TargetPath = "cmd.exe"
$lnk.Arguments = "/k `"$vcPath\vcvars64.bat`""
$lnk.WorkingDirectory = $env:USERPROFILE
$lnk.Description = "x64 Native Tools Command Prompt for VS 2026"
$lnk.Save()
Write-Host "Created: x64 Native Tools Command Prompt"

# x86 Native Tools
$lnk = $shell.CreateShortcut("$shortcutFolder\x86 Native Tools Command Prompt.lnk")
$lnk.TargetPath = "cmd.exe"
$lnk.Arguments = "/k `"$vcPath\vcvars32.bat`""
$lnk.WorkingDirectory = $env:USERPROFILE
$lnk.Description = "x86 Native Tools Command Prompt for VS 2026"
$lnk.Save()
Write-Host "Created: x86 Native Tools Command Prompt"

Write-Host "`nShortcuts created in: $shortcutFolder"
Write-Host "Search 'x64 Native Tools' in Start Menu to find them"
