# Instalação — Português (Brasil)

## Pré-requisitos
- Instalação compatível do Claude Code.
- Git e PowerShell no Windows (ou shell compatível).
- Acesso ao repositório de destino e às ferramentas de execução/teste do projeto.

Os recursos do Claude Code, ferramentas de agentes, descoberta de skills e permissões variam conforme a versão. Confirme o suporte local.

## Instalar em um projeto existente
1. Clone este repositório separadamente e revise os arquivos.
2. No repositório de destino, confira `git status` e crie uma branch de trabalho.
3. Copie o conteúdo de `pt-BR/.claude/` para a pasta `.claude/` do projeto de destino.
4. Mescle as regras de `pt-BR/CLAUDE.md` com o `CLAUDE.md` existente; não sobrescreva instruções específicas sem revisão.
5. Crie ou atualize `contexto.md` com o estado real do projeto.
6. Abra Claude Code no repositório de destino e confirme que os agentes e a skill foram reconhecidos.
7. Teste primeiro uma tarefa pequena em uma branch de desenvolvimento.

Exemplo:
```powershell
git status --short --branch
git switch -c chore/instalar-autodev-ptbr
claude
```

Use `/autodev <descrição da tarefa>` se a versão instalada reconhecer a skill. Se ela não aparecer, confira o caminho e a versão do Claude Code.

## Skills
O catálogo é uma referência, não um instalador. Confirme nomes e caminhos reais e leia as instruções. Não altere skills globais de colegas sem consentimento.

## Produção
Configure separadamente provedor, segredos no armazenamento seguro do provedor, domínio, migrações, backups, verificações de saúde e reversão. Comece por homologação. Instalar este kit não autoriza publicação automática em produção.
