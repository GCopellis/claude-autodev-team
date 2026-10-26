[CmdletBinding()]
param(
    [string[]]$Roots = @(
        (Join-Path $HOME ".claude\skills"),
        (Join-Path (Get-Location).Path ".claude\skills"),
        (Join-Path (Get-Location).Path ".claude\agents")
    ),
    [string]$OutputPath = "docs/skills-inventory.local.md"
)
$ErrorActionPreference = "Stop"
$items = [System.Collections.Generic.List[object]]::new()
foreach ($root in $Roots) {
    if (-not (Test-Path -LiteralPath $root)) { continue }
    Get-ChildItem -LiteralPath $root -Recurse -File -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -eq "SKILL.md" -or $_.Extension -eq ".md" } |
        ForEach-Object {
            $name = if ($_.Name -eq "SKILL.md") { Split-Path -Leaf (Split-Path -Parent $_.FullName) } else { $_.BaseName }
            $items.Add([pscustomobject]@{ Name = $name; Path = $_.FullName })
        }
}
$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add("# Local Claude skill and agent inventory")
$lines.Add("")
$lines.Add("> Based on files visible to this script; this does not prove a skill is callable in the current session.")
$lines.Add("")
if ($items.Count -eq 0) { $lines.Add("No matching Markdown skill/agent files found.") }
else { foreach ($item in ($items | Sort-Object Name, Path)) { $lines.Add("- **$($item.Name)** — $($item.Path)") } }
$parent = Split-Path -Parent $OutputPath
if ($parent -and -not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
$lines | Set-Content -LiteralPath $OutputPath -Encoding utf8
Write-Host "Wrote $OutputPath with $($items.Count) discovered Markdown files."
