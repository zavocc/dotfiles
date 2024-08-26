$STARSHIP_PATH=(Get-Command -Name starship.exe  -CommandType Application).Source

if (Test-Path -Path $STARSHIP_PATH) {
    Invoke-Expression (& $STARSHIP_PATH init powershell --print-full-init | Out-String)
}

# Check if we have FHM installed
$FHM_PATH=(Get-Command -Name fhm.exe  -CommandType Application).Source
if (Test-Path -Path $FHM_PATH) {
    Invoke-Expression (& $FHM_PATH env --use-on-cd | Out-String | Invoke-Expression)
}