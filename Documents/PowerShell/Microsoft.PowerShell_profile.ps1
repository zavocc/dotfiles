$STARSHIP_PATH=(Get-Command -Name starship.exe  -CommandType Application).Source

if (Test-Path -Path $STARSHIP_PATH) {
    Invoke-Expression (& $STARSHIP_PATH init powershell --print-full-init | Out-String)
}
