$ErrorActionPreference = "Stop"

$figDefs = foreach ($file in Get-ChildItem "$PSScriptRoot\manuscript\*.md") {
  $lineNo = 0
  foreach ($line in Get-Content $file.FullName -Encoding UTF8) {
    $lineNo++
    foreach ($m in [regex]::Matches($line, '#(fig:[^\s}]+)|\\label\{(fig:[^}]+)\}')) {
      [PSCustomObject]@{
        Label    = $m.Groups[1].Value + $m.Groups[2].Value
        Location = "$($file.Name):$lineNo"
      }
    }
  }
}
$duplicates = $figDefs | Group-Object Label | Where-Object Count -gt 1
if ($duplicates) {
  foreach ($d in $duplicates) {
    Write-Host "Duplicate figure label: $($d.Name)" -ForegroundColor Red
    $d.Group | ForEach-Object { Write-Host "  $($_.Location)" }
  }
  throw "Build aborted: duplicate figure labels found."
}

$OutputDir = Join-Path $PSScriptRoot "output"
New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

pandoc -d "$PSScriptRoot\pandoc.yaml" `
  "$PSScriptRoot\manuscript\00-frontmatter.md" `
  "$PSScriptRoot\manuscript\01-version.md" `
  "$PSScriptRoot\manuscript\02-toc.md" `
  "$PSScriptRoot\manuscript\09-mainmatter.md" `
  "$PSScriptRoot\manuscript\10-body.md" `
  "$PSScriptRoot\manuscript\11-body1.md" `
  "$PSScriptRoot\manuscript\80-appendix-marker.md" `
  "$PSScriptRoot\manuscript\90-appendix.md" `
  "$PSScriptRoot\manuscript\99-backmatter.md" `
  -o "$OutputDir\product.pdf"
