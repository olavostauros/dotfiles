$venvPath=Get-ChildItem -Path ~\venvs -Directory | foreach { $_.FullName } |
fzf

if ($venvPath -eq $null) {
    Write-Host "No virtual env selected"
    return
}

& ($venvPath + "\Scripts\Activate.ps1")
