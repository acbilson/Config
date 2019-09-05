function Open-GVim { param([System.String]$Path)
$config = [System.IO.Path]::Combine($env:HOMEDRIVE, $env:HOMEPATH, 'Dropbox\.vim\.vimrc')
& 'C:\Program Files (x86)\Vim\vim80\gvim.exe' -u $config $Path
}

# Copies the entire contents of a file to the clipboard
function Copy-File { param([System.String]$Path) Get-Content $path | Out-Clipboard }

function Push-Module {
param (
    [Parameter(Mandatory=$true,Position=0)]
    [string]$OriginPath,

    [Parameter(Mandatory=$true,Position=1)]
    [string]$DestinationPath)

    Copy-Item -Force -Recurse $OriginPath $DestinationPath
}

# Pushes modules in my home directory to the $PROFILE directory
function Push-Modules {

    $origin = 'C:\Repositories\OneDrive - kCura\PowerShell\Modules'
    $destination = $path = [System.IO.Path]::Combine($env:USERPROFILE, 'Documents\WindowsPowerShell\Modules')
    $modulesToPush = @('AlexModule',
                       'BuildModule',
                       'EnvironmentModule',
                       'FileModule',
                       'ImportModule',
                       'KeplerModule',
                       'RsapiModule',
                       'RestModule',
					   'DevVMModule',
					   'PromptModule')

    foreach ($module in $modulesToPush) {
        $moduleName = [string]::Concat($module, '.psm1')
        $originPath = [System.IO.Path]::Combine($origin, $module, $moduleName)
        $destinationPath = [System.IO.Path]::Combine($destination, $module, $moduleName)
        Push-Module $originPath $destinationPath
    }
}
