$StartupModulePath = [System.IO.Path]::Combine($env:HOMEDRIVE, $env:HOMEPATH, '\Powershell\Modules\StartupModule\StartupModule.psm1')
Import-Module $StartupModulePath -ErrorAction SilentlyContinue
Import-Module PromptModule -ErrorAction SilentlyContinue
Import-Module PSReadline -ErrorAction SilentlyContinue
Import-Module posh-git -ErrorAction SilentlyContinue

# Aliases
Set-Alias grep 'C:\Program Files (x86)\Gow\bin\grep.exe'
Set-Alias ipy 'C:\Program Files (x86)\IronPython 2.7\ipy.exe'
Set-Alias msbuild 'C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe'
Set-Alias np 'C:\Program Files (x86)\Notepad++\notepad++.exe'
Set-Alias py 'C:\Python37\python.exe'
Set-Alias sublime 'C:\Program Files\Sublime Text 3\sublime_text.exe'
Set-Alias test 'C:\Program Files\NUnit-2.6.4\bin\nunit-console.exe'
Set-Alias test3 'C:\Program Files (x86)\NUnit.org\nunit-console\nunit3-console.exe'
Set-Alias v Open-GVim
Set-Alias w 'C:\Windows\explorer.exe'
Set-Alias nuget 'C:\ProgramData\chocolatey\bin\NuGet.exe'

# Common Paths
$bin = 'C:\Program Files (x86)\Gow\bin\'
$hostfile = '$env:windir\System32\drivers\etc\hosts'

$working = 'C:\Users\abilson\OneDrive - SPR Consulting\Working'
$inbox = 'C:\Users\abilson\OneDrive - SPR Consulting\Inbox'
$archive = 'C:\Users\abilson\OneDrive - SPR Consulting\Archive\2019'
$source = 'C:\Users\abilson\SourceCode'

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-Location '~\OneDrive - SPR Consulting'
