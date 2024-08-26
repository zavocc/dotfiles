$STARSHIP_PATH=(Get-Command -Name starship.exe  -CommandType Application).Source

if (Test-Path -Path $STARSHIP_PATH) {
    Invoke-Expression (& $STARSHIP_PATH init powershell --print-full-init | Out-String)
}

# Check if we have FHM installed
$FNM_PATH=(Get-Command -Name fnm.exe  -CommandType Application).Source
if (Test-Path -Path $FNM_PATH) {
    Invoke-Expression (& $FNM_PATH env --use-on-cd | Out-String | Invoke-Expression)
}