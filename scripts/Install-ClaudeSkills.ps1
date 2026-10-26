[CmdletBinding()]
param(
    [string]$ManifestPath = (Join-Path $PSScriptRoot "..\config\skills-manifest.json"),
    [switch]$Global,
    [switch]$ListOnly,
    [switch]$IncludeManual
)
$ErrorActionPreference = "Stop"
$manifestFullPath = [System.IO.Path]::GetFullPath($ManifestPath)
if (-not (Test-Path -LiteralPath $manifestFullPath)) { throw "Manifesto não encontrado: $manifestFullPath" }
if (-not (Get-Command node -ErrorAction SilentlyContinue) -or -not (Get-Command npx -ErrorAction SilentlyContinue)) {
    throw "Node.js/npm não encontrados. Instale uma versão compatível com a CLI skills e tente novamente."
}
$manifest = Get-Content -LiteralPath $manifestFullPath -Raw | ConvertFrom-Json
$skills = @($manifest.skills)
Write-Host ""
Write-Host "Claude Autodev Team - instalador de skills" -ForegroundColor Cyan
Write-Host "Agente de destino: $($manifest.targetAgent)"
Write-Host "Escopo: $(if ($Global) { 'global do usuário' } else { 'somente este projeto' })"
Write-Host "Skills automatizadas no manifesto: $($skills.Count)"
if ($ListOnly) {
    $skills | ForEach-Object { Write-Host (" - {0} ({1})" -f $_.name, $_.source) }
    if ($IncludeManual) {
        Write-Host ""
        Write-Host "Skills sem fonte automatizável registrada:"
        $manifest.manualSourceRequired | Sort-Object -Unique | ForEach-Object { Write-Host " - $_" }
    }
    exit 0
}
$failed = [System.Collections.Generic.List[string]]::new()
$installed = 0
$index = 0
foreach ($skill in $skills) {
    $index++
    $args = @("skills", "add", [string]$skill.source, "--skill", [string]$skill.name, "--agent", [string]$manifest.targetAgent, "--copy", "--yes")
    if ($Global) { $args += "--global" }
    Write-Host ""
    Write-Host ("[{0}/{1}] Instalando {2} de {3}" -f $index, $skills.Count, $skill.name, $skill.source) -ForegroundColor Yellow
    & npx @args
    if ($LASTEXITCODE -eq 0) {
        $installed++
        Write-Host "OK: $($skill.name)" -ForegroundColor Green
    } else {
        $failed.Add("$($skill.name) (exit code $LASTEXITCODE)")
        Write-Warning "Falha ao instalar $($skill.name). Continuando com as demais."
    }
}
Write-Host ""
Write-Host "Resumo: $installed instaladas; $($failed.Count) falharam."
if ($IncludeManual -and $manifest.manualSourceRequired.Count -gt 0) {
    Write-Host ""
    Write-Host "Estas skills do catálogo ainda precisam de uma fonte Git/URL validada:"
    $manifest.manualSourceRequired | Sort-Object -Unique | ForEach-Object { Write-Host " - $_" }
}
Write-Host ""
Write-Host "Confira o resultado com: npx skills list --agent claude-code"
Write-Host "Revise as instruções das skills antes de usá-las. Instalação não significa execução nem validação de segurança."
if ($failed.Count -gt 0) {
    Write-Host "Falhas:" -ForegroundColor Red
    $failed | ForEach-Object { Write-Host " - $_" }
    exit 1
}
