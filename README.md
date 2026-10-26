# Claude Autodev Team

**Idioma:** **Português (Brasil)** · [English](en/README.md)

Kit reutilizável de desenvolvimento com múltiplos agentes para Claude Code. Combina um orquestrador e nove especialistas, fluxo consciente das skills disponíveis, worktrees Git, critérios de qualidade, verificações de segurança, passagens de contexto compactas e controle de desperdício de tokens.

> Este repositório contém configurações e instruções — não é um serviço de desenvolvimento hospedado. O comportamento real depende da versão do Claude Code, agentes/skills instalados, ferramentas, configuração do projeto, permissões e aprovações humanas disponíveis em cada ambiente.

## Para que serve

Use o kit para coordenar tarefas de software que se beneficiem de responsabilidades definidas: esclarecer requisitos, planejar arquitetura, implementar mudanças, tratar dados, testar, revisar segurança, preparar publicação, fazer revisão independente e reduzir desperdício de contexto/tokens.

A regra central é conservadora: **inspecionar e reutilizar antes de criar; delegar apenas quando fizer sentido; verificar antes de declarar sucesso; nunca publicar sem autorização.**

## Equipe em resumo

| Agente | Responsabilidade principal | Quando costuma ser acionado |
|---|---|---|
| `orquestrador` | Coordena fluxo, delegação, critérios de qualidade, integração e relatório final | Toda tarefa relevante |
| `product-owner` | Transforma pedidos em escopo e critérios de aceite | Requisitos ambíguos ou tarefas com várias etapas |
| `arquiteto` | Analisa arquitetura, contratos, dependências e alternativas | Mudanças entre módulos, novas integrações e refatorações grandes |
| `fullstack-developer` | Implementa as mudanças atribuídas e testes direcionados | Alterações de código |
| `database-specialist` | Cuida de esquema, migrações, integridade e desempenho de consultas | Mudanças em banco ou persistência |
| `qa-engineer` | Reproduz falhas e executa testes com base nos critérios de aceite | Correções, mudanças arriscadas e validação de release |
| `security-engineer` | Analisa segredos, acessos, entradas, dependências e riscos de publicação | Autenticação, dados sensíveis, dependências ou release |
| `devops-engineer` | Trabalha em CI/CD, preparação de publicação, smoke tests e rollback | Pipeline, ambiente, release ou hospedagem |
| `reviewer-documentation` | Faz revisão independente de diffs e mantém a documentação alinhada | Antes da integração/publicação ou em mudanças documentais |
| `finops-context` | Reduz trabalho redundante e desperdício de contexto/tokens sem enfraquecer a qualidade | Tarefas grandes, paralelas, repetitivas ou longas |

Consulte o **[Guia detalhado dos agentes](pt-BR/docs/GUIA-DOS-AGENTES.md)** para responsabilidades, entradas e saídas, limites de decisão e passagens de trabalho. Veja também o [fluxo de agentes](pt-BR/docs/FLUXO-DE-AGENTES.md).

## Estrutura do repositório

- `.claude/agents/` — definições do orquestrador e dos nove especialistas.
- `.claude/skills/autodev/SKILL.md` — fluxo acionado por `/autodev`.
- `CLAUDE.md` — regras gerais de trabalho.
- `contexto.md` — modelo compacto para preservar o estado do projeto entre sessões.
- `pt-BR/docs/GUIA-DOS-AGENTES.md` — manual detalhado da equipe e limites de responsabilidade.
- `pt-BR/docs/` — instalação, catálogo de skills, reutilização de recursos, critérios de qualidade, custos/contexto, publicação e fluxo de trabalho em português.
- `scripts/` — instaladores e auxiliares PowerShell para instalar/inventariar skills.
- `config/skills-manifest.json` — manifesto das skills com fonte conhecida para instalação automatizada.
- `en/README.md` — versão em inglês deste README.

## Instalação rápida (Windows / PowerShell)

```powershell
git clone https://github.com/GCopellis/claude-autodev-team.git
Set-Location .\claude-autodev-team
Get-Content .\pt-BR\docs\INSTALACAO.md
```

1. Leia o [guia de instalação](pt-BR/docs/INSTALACAO.md) e o [guia detalhado dos agentes](pt-BR/docs/GUIA-DOS-AGENTES.md).
2. Inspecione as instruções, testes, recursos visuais, configuração de publicação e estado Git do projeto-alvo.
3. Mescle a configuração relevante de `pt-BR/.claude/` com a pasta `.claude/` do projeto; **não sobrescreva arquivos específicos sem revisão**.
4. Confirme quais skills e ferramentas estão realmente instaladas. Um nome no catálogo não comprova disponibilidade.
5. Comece por uma branch de desenvolvimento e uma tarefa pequena e reversível. Revise o diff e execute os testes reais antes de ampliar o uso.

## Princípios operacionais

- **Delegação mínima:** o orquestrador escolhe o menor conjunto útil de agentes; tarefas simples podem não precisar de especialistas.
- **Responsabilidade clara:** paralelismo somente para tarefas independentes, com arquivos e interfaces definidos.
- **Status baseado em evidências:** use `PASSOU`, `FALHOU` ou `BLOQUEADO`; não declare testes, revisões ou publicações que não ocorreram.
- **Segurança Git:** preserve alterações do usuário; evite resets destrutivos, force-push, commits com segredos e conflitos sem resolução.
- **Reutilização de recursos:** procure componentes, scripts, estilos, testes, documentação e logos oficiais antes de criar substitutos.
- **Segurança primeiro:** nunca exponha credenciais ou dados privados; produção exige controles configurados e as aprovações aplicáveis.
- **Disciplina de contexto:** mantenha `contexto.md` conciso; guarde evidências longas em relatórios e referencie-as.
- **Honestidade de custos:** reduza trabalho evitável, mas não invente economia de tokens nem pule verificações obrigatórias.

## Critérios de qualidade e publicação

Os [critérios de qualidade](pt-BR/docs/CRITERIOS-DE-QUALIDADE.md) definem as verificações básicas. Uma tarefa só deve ser considerada concluída quando os critérios de aceite forem tratados, os testes relevantes tiverem sido executados (ou estiverem explicitamente bloqueados), o diff tiver sido revisado e os riscos/limitações estiverem registrados. Migrações, achados de segurança e autorização de produção exigem atenção especial. Preparar uma publicação não significa que ela foi executada.

## Limitações importantes

- Os agentes são arquivos de instrução; não garantem que modelo, ferramenta, plugin, skill ou subagente esteja disponível em toda instalação.
- O orquestrador deve descobrir as skills instaladas e ler suas instruções antes de utilizá-las.
- O repositório não contém o código da aplicação-alvo, credenciais, conta de hospedagem, logo oficial do projeto nem segredos de publicação.
- Publicações e ações externas dependem de configuração real, permissões, aprovações e verificação.
- Scripts auxiliares e CI verificam apenas o que foi configurado; não substituem testes da aplicação nem auditoria de segurança.

## Mapa da documentação

- [Guia detalhado dos agentes](pt-BR/docs/GUIA-DOS-AGENTES.md)
- [Instalação](pt-BR/docs/INSTALACAO.md)
- [Catálogo de skills](pt-BR/docs/CATALOGO-DE-SKILLS.md)
- [Reutilização de recursos](pt-BR/docs/REUTILIZACAO-DE-RECURSOS.md)
- [Critérios de qualidade](pt-BR/docs/CRITERIOS-DE-QUALIDADE.md)
- [Contexto e custos](pt-BR/docs/CONTEXTO-E-CUSTOS.md)
- [Publicação](pt-BR/docs/PUBLICACAO.md)
- [Fluxo de agentes](pt-BR/docs/FLUXO-DE-AGENTES.md)

## Licença

MIT. Consulte [LICENSE](LICENSE).
