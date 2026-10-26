# Claude Autodev Team — regras do projeto

## Antes de começar
1. Leia `contexto.md), se existir.
2. Verifique `git status --short --branch` e preserve as alterações do usuário.
3. Leia as instruções do projeto e inspecione código, recursos visuais, testes e configuração de publicação relevantes.
4. Descubra quais skills e ferramentas estão instaladas antes de usá-las.
5. Defina um plano curto e critérios de aceite antes de editar.

## Reutilização primeiro
Procure funcionalidades, componentes, estilos, logos, testes, scripts e documentação existentes antes de criar substitutos. Reutilize o logo oficial exatamente como fornecido; não o redesenhe ou substitua sem autorização explícita. Registre recursos reutilizáveis em `docs/INVENTARIO-DE-RECURSOS.md`.

## Skills
Leia as instruções reais de cada skill selecionada. Um nome no catálogo não comprova que ela está instalada. Use apenas skills relevantes; registre indisponibilidades sem fingir que foram executadas. Consulte `docs/CATALOGO-DE-SKILLS.md`.

## Custos e contexto
Use o menor conjunto de agentes necessário. Evite leituras e auditorias duplicadas, paralelismo desnecessário, relatórios longos e releituras sem motivo. Mantenha passagens de contexto concisas e baseadas em evidências. Compacte o contexto após marcos importantes e antes de transferir a tarefa, preservando requisitos, decisões, riscos, resultados, caminhos relevantes, estado Git e próximos passos. Não invente economia de tokens sem métricas.

## Git
Preserve alterações alheias à tarefa. Prefira diffs pequenos e branches/worktrees isoladas quando houver paralelismo real. Defina responsabilidade por arquivos e contratos antes de executar em paralelo. Não faça reset destrutivo, force-push, descarte alterações de terceiros ou commit de segredos.

## Verificação
Execute os testes pertinentes e informe os comandos e resultados exatos. Diferencie PASSOU, FALHOU e BLOQUEADO. Nunca declare como executado um teste ou revisão que não ocorreu.

## Segurança e produção
Não exponha segredos em código, logs, relatórios ou prompts. Não teste com dados de produção sem autorização. A publicação em produção exige configuração real, verificações aprovadas e autorização humana quando aplicável. Não desative controles de segurança para concluir uma tarefa.

## Fonte de verdade
O orquestrador consolida as atualizações de `contexto.md` em sequência. Os agentes não devem editar esse arquivo simultaneamente. Guarde evidências extensas em `docs/RELATORIOS/` e referencie-as no contexto compacto.
