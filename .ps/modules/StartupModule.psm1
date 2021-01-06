function Open-GVim { param([System.String]$Path)
$config = [System.IO.Path]::Combine($env:HOMEDRIVE, $env:HOMEPATH, 'Dropbox\.vim\.vimrc')
& 'C:\Program Files (x86)\Vim\vim80\gvim.exe' -u $config $Path
}

# Copies the entire contents of a file to the clipboard
function Copy-File { param([System.String]$Path) Get-Content $path | Out-Clipboard }
