# Controle de contexto e custos

## Objetivo
Reduzir consumo evitável de tokens, chamadas de ferramentas, latência e retrabalho sem enfraquecer testes, segurança ou critérios de aceite.

## Regras operacionais
- Selecione o menor conjunto útil de agentes.
- Delegue apenas tarefas independentes com entregáveis e critérios de conclusão explícitos.
- Leia somente arquivos relevantes; não releia arquivos grandes e inalterados sem motivo.
- Guarde logs extensos em arquivos e referencie-os.
- Reaproveite evidências válidas quando código, dependências e ambiente não mudaram.
- Limite tentativas; cada repetição precisa trazer evidência nova ou uma hipótese diferente.
- Evite orquestradores aninhados e revisões redundantes.
- Use modelos mais econômicos em tarefas rotineiras quando houver suporte; reserve raciocínio mais forte para arquitetura complexa, falhas de alto impacto e segurança.
- Não afirme medições de tokens/custos sem fonte confiável.

## Contexto compacto
Mantenha `contexto.md` curto: objetivo/marco atual, branch e estado Git, decisões aceitas, arquivos/commits, testes/resultados, revisão/segurança, riscos, bloqueios, próximas ações e publicação somente se verificada.

Guarde resultados extensos em `docs/RELATORIOS/` ou documentos de decisão. Referencie-os em vez de repetir tudo nas passagens de contexto.

## Quando compactar
- Após uma tarefa ou marco importante.
- Antes de transferir o trabalho para outra sessão/agente.
- Quando o contexto estiver crescendo.
- Após depuração longa que tenha descartado hipóteses.

Não remova requisitos, decisões, falhas, riscos, caminhos relevantes, estado Git ou próxima ação. Se `caveman-compress` estiver instalada, siga as instruções reais dela.

## Métricas
Registre métricas reais quando disponíveis. Caso contrário, informe apenas indicadores observáveis, como número de agentes, tentativas e testes reaproveitados. Não invente economia de tokens.
