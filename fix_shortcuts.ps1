# Fix Visual Studio 2026 Native Tools Command Prompt shortcuts
$shell = New-Object -ComObject WScript.Shell

$vcPath = "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build"
$shortcutFolder = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio 2026\Visual Studio Tools\VC"

# x64 Native Tools
$lnk = $shell.CreateShortcut("$shortcutFolder\x64 Native Tools Command Prompt for VS.lnk")
$lnk.TargetPath = "%comspec%"
$lnk.Arguments = "/k `"$vcPath\vcvars64.bat`""
$lnk.WorkingDirectory = "%USERPROFILE%"
$lnk.Description = "x64 Native Tools Command Prompt for VS 2026"
$lnk.Save()
Write-Host "Fixed: x64 Native Tools Command Prompt"

# x86 Native Tools
$lnk = $shell.CreateShortcut("$shortcutFolder\x86 Native Tools Command Prompt for VS.lnk")
$lnk.TargetPath = "%comspec%"
$lnk.Arguments = "/k `"$vcPath\vcvars32.bat`""
$lnk.WorkingDirectory = "%USERPROFILE%"
$lnk.Description = "x86 Native Tools Command Prompt for VS 2026"
$lnk.Save()
Write-Host "Fixed: x86 Native Tools Command Prompt"

# x64_x86 Cross Tools
$lnk = $shell.CreateShortcut("$shortcutFolder\x64_x86 Cross Tools Command Prompt for VS.lnk")
$lnk.TargetPath = "%comspec%"
$lnk.Arguments = "/k `"$vcPath\vcvarsamd64_x86.bat`""
$lnk.WorkingDirectory = "%USERPROFILE%"
$lnk.Description = "x64_x86 Cross Tools Command Prompt for VS 2026"
$lnk.Save()
Write-Host "Fixed: x64_x86 Cross Tools Command Prompt"

# x86_x64 Cross Tools
$lnk = $shell.CreateShortcut("$shortcutFolder\x86_x64 Cross Tools Command Prompt for VS.lnk")
$lnk.TargetPath = "%comspec%"
$lnk.Arguments = "/k `"$vcPath\vcvarsx86_amd64.bat`""
$lnk.WorkingDirectory = "%USERPROFILE%"
$lnk.Description = "x86_x64 Cross Tools Command Prompt for VS 2026"
$lnk.Save()
Write-Host "Fixed: x86_x64 Cross Tools Command Prompt"

Write-Host "`nAll shortcuts fixed!"
