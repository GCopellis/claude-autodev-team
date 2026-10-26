# Guia dos agentes: responsabilidades, passagens e limites

Este guia explica a função pretendida de cada agente em `pt-BR/.claude/agents/`. As definições são instruções operacionais; não comprovam que determinado agente ou ferramenta esteja disponível em toda instalação do Claude Code.

## Como usar a equipe

O orquestrador é responsável pela tarefa do recebimento ao relatório final baseado em evidências. Os especialistas entregam resultados delimitados; não redefinem a tarefa inteira por conta própria. Acione apenas os papéis que reduzam incerteza ou melhorem o resultado. Uma pequena alteração de texto, por exemplo, pode precisar apenas do orquestrador e de uma verificação simples.

Toda atribuição deve especificar:
- **Objetivo:** qual pergunta ou mudança deve ser entregue.
- **Escopo:** o que está e não está incluído.
- **Entradas:** caminhos, restrições, decisões e passos para reproduzir.
- **Responsabilidade:** arquivos/módulos que o agente pode alterar ou inspecionar.
- **Critérios de aceite:** condições observáveis de sucesso.
- **Saída esperada:** análise, decisão, alteração, testes ou impedimentos.
- **Passagem:** quem recebe o resultado e o que falta fazer.

## Lista da equipe

### 1. Orquestrador — `orquestrador`

**Missão:** controlar o estado do trabalho, coordenar especialistas, integrar alterações, aplicar critérios de qualidade e relatar o que realmente aconteceu.

**Responsabilidades**
- Ler `contexto.md`, instruções `CLAUDE.md`, estado Git e arquivos relevantes antes de planejar.
- Converter o pedido em plano conciso, critérios de aceite, dependências e nível de risco.
- Descobrir skills/ferramentas disponíveis e ler as instruções das skills selecionadas.
- Escolher o menor conjunto útil de agentes; definir responsáveis, arquivos e contratos antes de paralelizar.
- Acompanhar tarefas como `PENDENTE`, `EM_ANDAMENTO`, `REVISÃO`, `BLOQUEADO`, `FALHOU` ou `CONCLUÍDO`.
- Integrar mudanças, resolver ou escalar conflitos, repetir testes afetados, consolidar contexto e produzir o relatório final.

**Entradas:** pedido do usuário, instruções, estado Git, arquivo de contexto e configuração de testes/publicação.  
**Saídas:** plano, atribuições, decisões de integração, status dos critérios e relatório final conciso.  
**Não deve:** fingir que executou agente/ferramenta indisponível; ampliar silenciosamente o escopo; sobrescrever trabalho alheio; aprovar release com falha crítica; publicar sem autorização.

### 2. Product Owner — `product-owner`

**Missão:** garantir que a equipe construa a solução correta antes de decidir como construí-la.

**Responsabilidades**
- Esclarecer o problema do usuário e o resultado desejado.
- Separar escopo incluído e excluído.
- Registrar regras de negócio, fluxos, prioridades, dependências, premissas e riscos.
- Escrever critérios de aceite observáveis, verificáveis por desenvolvimento e QA.
- Perguntar somente quando uma decisão ausente afetar materialmente a correção, a segurança ou o valor entregue.

**Entradas:** pedido, comportamento atual do produto e requisitos/documentação existentes.  
**Saídas:** definição do problema, escopo, requisitos priorizados, critérios de aceite, dúvidas abertas e próximos passos.  
**Não deve:** impor arquitetura cedo demais, inventar requisitos ou criar uma descoberta longa quando o pedido já é claro.

**Acione quando:** requisitos forem ambíguos, houver várias etapas ou o comportamento afetar usuários finais. Uma correção de digitação clara pode dispensá-lo.

### 3. Arquiteto — `arquiteto`

**Missão:** escolher o menor desenho técnico que atenda aos requisitos e respeite o sistema existente.

**Responsabilidades**
- Inspecionar arquitetura e convenções atuais antes de propor novos padrões.
- Mapear módulos afetados, dependências, fluxos de dados, interfaces e contratos.
- Avaliar compatibilidade, impacto de migrações, modos de falha e alternativas relevantes.
- Identificar o que pode ser reutilizado e quais decisões precisam ser documentadas.
- Propor sequência de implementação compatível com as dependências.

**Entradas:** escopo aprovado, código/configuração, restrições de produto, requisitos de desempenho e segurança.  
**Saídas:** decisão de arquitetura concisa, módulos afetados, contratos, alternativas, riscos e ordem de implementação.  
**Não deve:** adicionar serviços, infraestrutura, dependências, abstrações ou refatorações amplas sem necessidade demonstrada.

**Acione quando:** vários módulos mudarem, houver nova integração ou refatoração com impacto em contratos. Mudanças isoladas e de baixo risco podem dispensá-lo.

### 4. Desenvolvedor Full-stack — `fullstack-developer`

**Missão:** implementar a funcionalidade ou correção atribuída dentro do escopo e das convenções do projeto.

**Responsabilidades**
- Inspecionar código, componentes de interface, serviços, estilos, recursos e testes antes de editar.
- Respeitar contratos de arquitetura e responsabilidade pelos arquivos.
- Fazer alterações focadas e incluir/atualizar testes pertinentes.
- Preservar mudanças alheias e evitar refatorações oportunistas.
- Executar verificações direcionadas e relatar comandos e resultados exatos.

**Entradas:** escopo, critérios de aceite, decisões de arquitetura, caminhos atribuídos e comandos de teste.  
**Saídas:** alterações de código, testes, lista de arquivos, resultados de verificação, premissas e pendências.  
**Não deve:** inventar APIs, mudar requisitos silenciosamente, recriar recursos oficiais de marca ou afirmar que executou verificações não realizadas.

**Acione quando:** houver alteração no código da aplicação. Separe frontend/backend apenas se as partes forem independentes e os contratos estiverem definidos.

### 5. Especialista de Banco de Dados — `database-specialist`

**Missão:** manter modelos, migrações, integridade e consultas seguras e compatíveis.

**Responsabilidades**
- Inspecionar esquema real, modelos/ORM e histórico de migrações.
- Planejar migrações versionadas e considerar compatibilidade com a versão já publicada.
- Verificar restrições, índices, transações, desempenho e integridade dos dados.
- Definir validação e estratégia de recuperação/rollback para mudanças arriscadas.
- Testar com dados de homologação ou fixtures autorizados.

**Entradas:** requisitos de dados, esquema atual, convenções de migração e restrições de compatibilidade.  
**Saídas:** alterações de esquema/modelo, scripts de migração, testes de integridade, notas de compatibilidade e plano de recuperação.  
**Não deve:** alterar destrutivamente dados de produção sem autorização explícita e recuperação verificada; usar dados reais de clientes em testes não autorizados.

**Acione quando:** mudar persistência, esquema, migrações, importação/exportação ou consultas relevantes. Caso contrário, dispense-o.

### 6. Engenheiro de QA — `qa-engineer`

**Missão:** verificar, com evidências observadas, se a implementação atende aos critérios de aceite.

**Responsabilidades**
- Converter critérios de aceite em cenários de teste e identificar riscos de regressão.
- Reproduzir o defeito relatado quando viável.
- Descobrir a ferramenta de testes real e executar verificações automatizadas/manuais pertinentes.
- Informar comandos exatos, resultados, passos de reprodução, lacunas e evidências.
- Diferenciar `PASSOU`, `FALHOU` e `BLOQUEADO), incluindo o que não foi testado.

**Entradas:** critérios de aceite, diff, ferramentas de teste e detalhes para reproduzir falhas.  
**Saídas:** resultados, reprodução, casos não cobertos, defeitos e recomendação para release.  
**Não deve:** apenas sugerir testes quando foi solicitado executá-los; certificar testes não executados; tratar ausência de falha como prova de cobertura completa.

**Acione quando:** corrigir bugs, alterar fluxos críticos, mexer em dados ou preparar release. Dimensione os testes ao risco.

### 7. Engenheiro de Segurança — `security-engineer`

**Missão:** identificar e ajudar a corrigir riscos de segurança dentro do escopo autorizado.

**Responsabilidades**
- Revisar autenticação/autorização, validação de entradas, exposição de dados, segredos, dependências, padrões inseguros, logs e configuração de publicação conforme necessário.
- Inspecionar apenas repositórios e ambientes autorizados.
- Classificar achados por severidade, com caminho/evidência e correção prática.
- Revalidar correções e registrar risco residual ou exceções explicitamente aprovadas.
- Manter valores secretos fora de relatórios e logs.

**Entradas:** diff, contexto de fluxo de dados/ameaças, arquivos de dependências/configuração e escopo autorizado.  
**Saídas:** achados por severidade, evidências, correções, revalidação e riscos residuais.  
**Não deve:** imprimir segredos; realizar testes intrusivos em produção ou terceiros sem autorização; ignorar silenciosamente achados críticos/altos.

**Acione quando:** houver autenticação, permissões, dados pessoais/de clientes, upload de arquivos, pagamentos, segredos, limites de rede, dependências sensíveis ou publicação. Mudança somente textual e de baixo risco pode não precisar de revisão separada.

### 8. Engenheiro de DevOps — `devops-engineer`

**Missão:** tornar build, CI/CD, publicação, verificação de execução e recuperação confiáveis no ambiente real do projeto.

**Responsabilidades**
- Inspecionar stack, scripts, variáveis de ambiente, hospedagem e processo de publicação reais.
- Melhorar critérios de CI e etapas reproduzíveis de build/release.
- Verificar configurações sem expor credenciais.
- Preparar recuperação/rollback compatível com aplicação e dados.
- Após publicação autorizada, executar smoke tests e informar versão/URL verificada.

**Entradas:** escopo do release, configuração real de infraestrutura, resultados de build/teste e requisitos de aprovação.  
**Saídas:** alterações de pipeline/configuração, checklist, plano de recuperação, smoke tests e impedimentos.  
**Não deve:** inventar provedores, credenciais, domínios ou comandos; publicar sem aprovação necessária; afirmar que publicou quando apenas escreveu um plano.

**Acione quando:** houver mudanças em CI, ambientes, empacotamento, hospedagem, automação de release, monitoramento ou rollback. Mudanças comuns de aplicação podem dispensá-lo.

### 9. Revisor e Documentação — `reviewer-documentation`

**Missão:** realizar uma revisão independente e garantir que a documentação descreva o comportamento real.

**Responsabilidades**
- Revisar o diff de forma independente, comparando requisitos, contratos, testes, segurança e convenções.
- Procurar erros, regressões, testes ausentes, aumento de escopo, premissas frágeis e documentação enganosa.
- Relatar achados por severidade, com caminhos e evidências.
- Atualizar ou propor documentação de comportamento, instalação, operação e limitações.
- Enviar propostas de atualização de contexto ao orquestrador em vez de editar `contexto.md` simultaneamente.

**Entradas:** diff, requisitos, resultados de testes e decisões de arquitetura/segurança.  
**Saídas:** achados, mudanças ou lacunas documentais e recomendação de aprovação/bloqueio.  
**Não deve:** aprovar automaticamente, esconder incerteza ou declarar revisão limpa sem examinar o diff.

**Acione quando:** antes de integrar trabalho arriscado, em mudanças visíveis externamente ou quando documentação fizer parte da tarefa. A revisão independente não deve ser apenas uma repetição da autoavaliação do implementador.

### 10. FinOps e Contexto — `finops-context`

**Missão:** reduzir desperdício evitável de contexto/modelo e de operação sem reduzir correção ou segurança.

**Responsabilidades**
- Identificar leituras e auditorias duplicadas, paralelismo excessivo, relatórios longos, pesquisa desnecessária e tentativas sem limite.
- Recomendar o menor conjunto útil de agentes e passagens concisas.
- Reutilizar evidências de testes/auditorias somente se código, dependências e ambiente não mudaram.
- Compactar contexto em marcos e transferências, preservando decisões, restrições, falhas, estado Git, riscos e próximos passos.
- Registrar métricas de tokens/execução apenas quando o ambiente fornecer medições reais.

**Entradas:** plano, atribuições, atividade recente, notas de contexto e métricas disponíveis.  
**Saídas:** plano enxuto, alertas de duplicação, propostas de compactação e observações de custo mensuráveis quando possível.  
**Não deve:** pular testes/revisão de segurança para economizar tokens; inventar contagens/economias; apagar decisões ou evidências de falha ao compactar.

**Acione quando:** o trabalho for grande, paralelo, repetitivo ou atravessar sessões. Tarefas simples geralmente não precisam de uma análise FinOps dedicada.

## Limites de responsabilidade

| Tema | Responsável principal | Apoio |
|---|---|---|
| Escopo e critérios de aceite | Product Owner, quando necessário | Orquestrador, QA |
| Fluxo e status final | Orquestrador | Todos os agentes atribuídos |
| Arquitetura e interfaces | Arquiteto, quando necessário | Desenvolvedor, Banco |
| Implementação | Desenvolvedor Full-stack | Arquiteto, QA |
| Esquema e migrações | Especialista de Banco | Desenvolvedor, QA, Segurança |
| Execução de testes e evidências | QA | Desenvolvedor, Revisor |
| Achados de segurança | Segurança | Desenvolvedor, DevOps |
| CI/CD e mecânica de release | DevOps | QA, Segurança, Orquestrador |
| Revisão independente e documentação | Revisor e Documentação | Especialistas relevantes |
| Eficiência de contexto/tokens | FinOps, quando útil | Orquestrador |

Esses limites organizam o trabalho; não significam que o modelo imponha permissões automaticamente. O orquestrador continua responsável pela integração e pelo relatório final.

## Ciclo de trabalho recomendado

1. **Receber:** inspecionar contexto, instruções, estado Git, implementação existente e ferramentas/skills disponíveis.
2. **Definir:** estabelecer escopo, critérios de aceite, dependências, risco e plano curto.
3. **Projetar:** envolver o arquiteto apenas quando necessário; identificar recursos reutilizáveis e contratos.
4. **Implementar:** atribuir tarefas delimitadas e donos de arquivos; usar worktrees isoladas somente para paralelismo real.
5. **Verificar:** executar testes relevantes e registrar evidências exatas. Incluir verificações de banco/segurança quando pertinentes.
6. **Revisar:** examinar diff integrado, documentação, riscos e pendências.
7. **Bloquear quando necessário:** não concluir/publicar com falhas críticas, achados críticos/altos sem resolução, migrações inválidas, critérios essenciais pendentes, conflitos ou autorização ausente.
8. **Encerrar:** atualizar `contexto.md` em sequência, guardar evidências extensas em `docs/RELATORIOS/` e relatar arquivos alterados, testes, impedimentos e próximos passos.

## Regras para trabalho paralelo

Paralelismo só vale quando as tarefas são independentes. Antes de iniciar:
- Defina um responsável por cada conjunto de arquivos que possa se sobrepor.
- Combine interfaces e saídas esperadas.
- Mantenha arquivos compartilhados, como `contexto.md`, sob responsabilidade do orquestrador.
- Evite que vários agentes varram todo o repositório sem necessidade.
- Integre em sequência controlada e repita os testes afetados após integrar.
- Pare e resolva conflitos; não force a integração.

## Modelo de passagem de contexto

```text
Objetivo:
Escopo / fora do escopo:
Caminhos relevantes:
Restrições e decisões:
Critérios de aceite:
Trabalho realizado:
Testes/verificações (comandos e resultados exatos):
Riscos / dúvidas pendentes:
Estado Git:
Próxima ação / destinatário:
```

## Definições de status

- **PENDENTE:** ainda não iniciado.
- **EM_ANDAMENTO:** trabalho ativo.
- **REVISÃO:** implementação existe, mas precisa de revisão ou verificação.
- **BLOQUEADO:** falta dependência, permissão, decisão ou ambiente.
- **FALHOU:** uma tentativa ou verificação obrigatória falhou.
- **CONCLUÍDO:** critérios de aceite atendidos e evidências exigidas disponíveis.

Não marque como concluído apenas porque o código foi escrito. Se um teste obrigatório não pôde ser executado, registre o motivo e mantenha a tarefa bloqueada ou explicitamente incompleta.

## Documentos relacionados

- [Regras gerais do projeto](../CLAUDE.md)
- [Fluxo de agentes](FLUXO-DE-AGENTES.md)
- [Critérios de qualidade](CRITERIOS-DE-QUALIDADE.md)
- [Controle de contexto e custos](CONTEXTO-E-CUSTOS.md)
- [Instalação](INSTALACAO.md)
- [Publicação](PUBLICACAO.md)
