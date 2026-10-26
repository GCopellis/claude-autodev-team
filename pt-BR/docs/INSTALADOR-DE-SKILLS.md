# Instalador automático de skills

O projeto inclui o script scripts/Install-ClaudeSkills.ps1 e o manifesto config/skills-manifest.json. O instalador usa a CLI pública skills para instalar skills selecionadas para Claude Code.

## Requisitos

- Windows PowerShell 5.1 ou PowerShell 7.
- Node.js/npm e acesso à internet.
- Git pode ser necessário conforme a origem.

## Instalar no projeto atual

Na raiz do projeto que receberá as skills, execute:

```powershell
& "C:\caminho\claude-autodev-team\scripts\Install-ClaudeSkills.ps1"
```

O script instala no escopo do projeto atual. Para aplicar ao PokerPro ou a outro projeto, execute o script com o diretório atual definido para a raiz desse projeto.

Para listar o que será instalado sem alterar arquivos:

```powershell
& "C:\caminho\claude-autodev-team\scripts\Install-ClaudeSkills.ps1" -ListOnly
```

Para mostrar também as skills do catálogo que ainda não têm fonte validada:

```powershell
& "C:\caminho\claude-autodev-team\scripts\Install-ClaudeSkills.ps1" -ListOnly -IncludeManual
```

Para instalar globalmente para o usuário, em vez de no projeto atual, use -Global.

## O que está automatizado hoje

O manifesto registra um conjunto inicial de skills da coleção obra/superpowers: brainstorming, planejamento, desenvolvimento orientado a testes, depuração, revisão, worktrees e verificação antes de concluir. O script instala cada skill individualmente, continua após falhas e retorna código de erro se alguma instalação falhar.

O catálogo também contém nomes candidatos cuja origem exata ainda precisa ser confirmada. Eles ficam em manualSourceRequired e não são baixados de repositórios adivinhados. Para automatizá-los, adicione ao manifesto o repositório e o nome exato da skill depois de conferir a origem e a licença.

context7-mcp é um servidor MCP, não uma skill, e requer configuração própria.

## Segurança e atualizações

- A instalação não concede automaticamente permissões extras ao Claude Code.
- Revise os arquivos SKILL.md e scripts de terceiros antes de utilizá-los.
- Para listar skills instaladas: npx skills list --agent claude-code.
- Para atualizar skills gerenciadas pela CLI: npx skills update -y.
- Faça commit/backup e revise o diff antes de executar novamente.

O instalador informa exatamente o conjunto configurado no manifesto e as falhas observadas; não afirma que todas as skills candidatas do catálogo foram instaladas.
