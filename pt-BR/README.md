# Claude Autodev Team — Português (Brasil)

**Idioma / Language:** [Português (Brasil)](README.md) · [English](../README.md)

Kit de desenvolvimento com múltiplos agentes para Claude Code: um orquestrador, nove agentes especialistas, seleção consciente de skills, worktrees Git, critérios de qualidade, compactação de contexto e controle de desperdício de tokens.

## Conteúdo
- `.claude/agents/`: orquestrador e nove agentes especialistas.
- `.claude/skills/autodev/SKILL.md`: fluxo acionado por `/autodev`.
- `CLAUDE.md`: regras gerais do projeto.
- `docs/`: instalação, catálogo de skills, reutilização de recursos, qualidade e publicação.

## Instalação rápida (Windows / PowerShell)
```powershell
git clone https://github.com/GCopellis/claude-autodev-team.git
Set-Location .\claude-autodev-team
Get-Content .\pt-BR\docs\INSTALACAO.md
```

Copie os arquivos de `pt-BR/.claude/` para a pasta `.claude/` do seu projeto e mescle as regras de `pt-BR/CLAUDE.md` com o `CLAUDE.md` existente. Não sobrescreva instruções específicas sem revisá-las. Teste primeiro em uma branch de desenvolvimento.

## Segurança e limitações
- A lista de skills é orientativa; cada instalação deve confirmar quais estão disponíveis.
- Nunca publique chaves, arquivos `.env`, dados privados ou credenciais.
- A publicação em produção depende das configurações, verificações e aprovações reais do projeto.
- Os agentes devem localizar e reutilizar os logos oficiais do projeto-alvo; este kit não contém logos de produtos.

## Voltar para inglês
Use o [README em inglês](../README.md).
