$STARSHIP_PATH="C:\Users\zavoc\Starship\starship.exe"

if (Test-Path -Path $STARSHIP_PATH) {
    Invoke-Expression (& $STARSHIP_PATH init powershell --print-full-init | Out-String)
}
