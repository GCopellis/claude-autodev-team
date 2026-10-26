---
name: autodev
description: Coordena uma tarefa de software desde requisitos até implementação, verificação, revisão e publicação autorizada, minimizando desperdício de contexto.
argument-hint: "<descrição da tarefa>"
---

# /autodev

Tarefa: $ARGUMENTS

## 1. Inspecionar e planejar
- Leia `contexto.md`, instruções do projeto, estado Git, código/testes relevantes e configuração de publicação.
- Inspecione logos, recursos, componentes, scripts e documentação antes de criar substitutos.
- Defina escopo e critérios de aceite; envolva Product Owner se houver ambiguidade e Arquiteto para mudanças arquiteturais relevantes.

## 2. Selecionar agentes e skills
- Use apenas os especialistas necessários.
- Confirme que cada agente/skill existe e leia suas instruções antes de usar.
- Exemplos: fullstack para implementação; especialista de banco para esquema; QA para testes; segurança para autenticação/dados/dependências; revisor para revisão independente; DevOps para CI/publicação; FinOps para tarefas grandes ou com vários agentes.
- Não acione todos por padrão.

## 3. Implementar
- Defina responsabilidade por arquivos/módulos e contratos antes de paralelizar.
- Paralelize apenas tarefas independentes; use worktrees quando suportadas e úteis.
- Preserve alterações do usuário.
- Reutilize código funcional e recursos oficiais.
- Adicione testes quando houver mudança de comportamento.

## 4. Verificar e revisar
- Execute testes e verificações estáticas pertinentes.
- Faça revisão independente em mudanças não triviais.
- Corrija achados e repita verificações afetadas.
- Registre PASSOU/FALHOU/BLOQUEADO com evidências exatas. Nunca declare testes não executados.

## 5. Critério de publicação
Bloqueie a publicação em produção se testes/build críticos falharem, houver vulnerabilidade crítica/alta sem tratamento autorizado, migração não validada, conflitos, critérios essenciais pendentes ou falta de autorização/configuração. Não invente provedores ou credenciais.

## 6. Compactar e relatar
- Atualize `contexto.md` sequencialmente pelo orquestrador.
- Guarde logs extensos em `docs/RELATORIOS/`; mantenha passagens de contexto concisas.
- Preserve requisitos, decisões, caminhos alterados, comandos/resultados, estado Git, riscos, bloqueios e próximos passos.
- Informe alterações, verificações, revisão/segurança, situação da publicação, skills realmente utilizadas e pendências.
