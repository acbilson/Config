# Aliases
Set-Alias np 'C:\Program Files (x86)\Notepad++\notepad++.exe'
Set-Alias deploy 'C:\SourceCode\PersonalRepo\deploy.ps1'
Set-Alias test 'C:\Program Files\NUnit-2.6.4\bin\nunit-console.exe'
Set-Alias test3 'C:\Program Files (x86)\NUnit.org\nunit-console\nunit3-console.exe'
Set-Alias msbuild 'C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe'
Set-Alias linqPad 'C:\Program Files (x86)\LINQPad4\LINQPad.exe'
Set-Alias VBoxManage 'C:\Program Files\Oracle\VirtualBox\VBoxManage.exe'
Set-Alias grep 'C:\Program Files (x86)\Gow\bin\grep.exe'
Set-Alias sublime 'C:\Program Files\Sublime Text 2\sublime_text.exe'
Set-Alias py 'C:\Python34\python.exe'
Set-Alias ipy 'C:\Program Files (x86)\IronPython 2.7\ipy.exe'
Set-Alias UpdateConfig 'C:\SourceCode\CustomDev\tools\UpdateConfig\UpdateConfig\bin\Debug\UpdateConfig.exe'
Set-Alias v 'C:\Program Files (x86)\Vim\vim74\gvim.exe'
Set-Alias w 'C:\Windows\explorer.exe'
Set-Alias devenv 'C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe' 
# Functions

function publish { & 'C\SourceCode\CommonTools\DeveloperTools\PublishToRelativity\PublishToRelativity\bin\Debug\PublishToRelativity.exe' }

# Modules
Import-Module AlexModule -ErrorAction SilentlyContinue
#Import-Module BuildModule -ErrorAction SilentlyContinue
#Import-Module FileModule -ErrorAction SilentlyContinue
Import-Module PromptModule -ErrorAction SilentlyContinue
Import-Module MercurialModule -ErrorAction SilentlyContinue
Import-Module RsapiModule -ErrorAction SilentlyContinue
Import-Module KeplerModule -ErrorAction SilentlyContinue
Import-Module EnvironmentModule -ErrorAction SilentlyContinue
Import-Module PSCX -ErrorAction SilentlyContinue

# AutoHotKey
C:\SourceCode\PersonalRepo\AutoHotKey\AllAutos.ahk

#Clear-Host
#Set-Location C:\SourceCode\PersonalRepo
#Start-Transcript -Path '\\kcura\kusers$\Engineering\abilson\Documents\WindowsPowerShell\Transcripts\mytranscript.txt' -Append
