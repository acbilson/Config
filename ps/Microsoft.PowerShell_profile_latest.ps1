$StartupModulePath = "~\Documents\WindowsPowershell\Modules\StartupModule\StartupModule.psm1"
Import-Module $StartupModulePath -ErrorAction SilentlyContinue
Import-Module PromptModule -ErrorAction SilentlyContinue
Import-Module PSReadline -ErrorAction SilentlyContinue
Import-Module SetupModule -ErrorAction SilentlyContinue
Import-Module posh-git -ErrorAction SilentlyContinue

# Aliases
Set-Alias grep 'C:\Program Files (x86)\Gow\bin\grep.exe'
Set-Alias ipy 'C:\Program Files (x86)\IronPython 2.7\ipy.exe'
Set-Alias msbuild 'C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe'
Set-Alias np 'C:\Program Files (x86)\Notepad++\notepad++.exe'
Set-Alias nuget 'C:\ProgramData\chocolatey\bin\NuGet.exe'
Set-Alias py 'C:\Python37\python.exe'
Set-Alias sublime 'C:\Program Files\Sublime Text 3\sublime_text.exe'
Set-Alias test 'C:\Program Files\NUnit-2.6.4\bin\nunit-console.exe'
Set-Alias test3 'C:\Program Files (x86)\NUnit.org\nunit-console\nunit3-console.exe'
Set-Alias w 'C:\Windows\explorer.exe'
Set-Alias ledger  '~\Source\nledger\Source\NLedger.CLI\bin\Debug\NLedger-cli.exe'

# Docker Functions/Aliases
function Docker-Container { docker container $args }
function Docker-Logs { docker logs $args }
function Docker-Images { docker images $args }
function Docker-Shell { docker exec -it $args[0] /bin/bash }
function Docker-RootShell { docker exec -it --user root $args[0] /bin/bash }
function Docker-ID { docker ps -aqf ('name={0}' -f $args[0]) }
function Docker-Build { docker build . -t args[0] }

Set-Alias dk "docker"
Set-Alias dkcp "docker-compose"
Set-Alias dkc Docker-Container
Set-Alias dkl Docker-Logs
Set-Alias dki Docker-Images
Set-Alias dksh Docker-Shell
Set-Alias dkrsh Docker-RootShell
Set-Alias dkid Docker-ID
Set-Alias dkb Docker-Build

# Encrypted Journal and Memoir
$DEFAULT_JOURNAL="journal_2020.txt"
$DEFAULT_MEMOIR="memoir_2020.txt"

function Encrypt-File {
  $output=""
  if ($args[0]) {
    $safe = $args[0].TrimEnd(".txt") + "-safe.txt"
    $output = "{0}.gpg" -f $safe
    gpg --recipient "Alexander Christopher Bilson" `
      --output $output --encrypt $args[0]
    Write-Host ("Updated {0} encrypted file" -f $output)
  }
  else {
    Write-Host "Please enter a file name."
    }
  return $output
}

function Encrypt-Journal {
  pushd ~\Journal
  tar -cvzf journals.tar.gz *.txt
  gpg --recipient "Alexander Christopher Bilson" `
      --output journals-safe.tar.gz.gpg --encrypt journals.tar.gz
  mv -Force journals-safe.tar.gz.gpg ~\OneDrive\Documents\Journals\
  rm journals.tar.gz
  popd
}

function Decrypt-Journal {
  if ($args[0]) {
    gpg --decrypt-files $args[0]
  }
  else { Write-Host "Please enter a file name." }
}

Set-Alias ej Encrypt-Journal
Set-Alias dj Decrypt-Journal

# Common Paths
$bin = 'C:\Program Files (x86)\Gow\bin\'
$hostfile = '$env:windir\System32\drivers\etc\hosts'

$working = '~\OneDrive - SPR Consulting\Working'
$inbox = '~\OneDrive - SPR Consulting\Inbox'
$archive = '~\OneDrive - SPR Consulting\Archive\2020'
$source = '~\Source'
$od = '~\OneDrive'
$journal = '~\Journal'
$mba = '~\OneDrive\Education\MBA\ConsultingPracticum\Thesis'

# Blog helpers
$blog = '~\Source\alexbilson.dev'
$posts = ([System.IO.Path]::Combine($blog, 'hugo\src\content\posts'))
$theme = ([System.IO.Path]::Combine($blog, 'hugo\src\themes\aether'))

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-Location $journal
