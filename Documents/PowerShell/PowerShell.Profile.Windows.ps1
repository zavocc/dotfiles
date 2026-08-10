# --- Starship (optional) ---
$starship = Get-Command starship -ErrorAction SilentlyContinue
if ($starship) {
  (& $starship.Source init powershell --print-full-init) | Out-String | Invoke-Expression
}

# --- FNM (optional) ---
$fnm = Get-Command fnm -ErrorAction SilentlyContinue
if ($fnm) {
  # Force PowerShell init code and join lines before Invoke-Expression
  $fnmInit = & $fnm.Source env --use-on-cd --shell powershell
  if ($fnmInit) { Invoke-Expression ($fnmInit -join "`n") }

  # Completion
  fnm completions --shell powershell | Out-String | Invoke-Expression
}
