$ErrorActionPreference = "Stop"
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
