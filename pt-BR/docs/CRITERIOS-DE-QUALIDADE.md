# Critérios de qualidade

Cada etapa recebe o estado PASSOU, FALHOU ou BLOQUEADO, acompanhado de evidências. Nunca marque PASSOU sem executar ou conferir a verificação correspondente.

## A — Escopo
- Critérios de aceite definidos.
- Dependências e limites conhecidos.

## B — Projeto técnico
- Contratos e módulos afetados identificados para mudanças relevantes.
- Componentes e recursos existentes inspecionados.

## C — Implementação
- Código atende ao escopo.
- Testes pertinentes adicionados/atualizados.
- Nenhuma alteração destrutiva sem relação com a tarefa.

## D — Integração
- Diff revisado.
- Sem conflitos pendentes.
- Build, testes, lint e checagens de tipos disponíveis executados.
- Testes de integração/regressão pertinentes aprovados.

## E — Segurança
- Verificações relevantes executadas.
- Nenhuma falha crítica/alta pendente sem exceção documentada e autorizada.
- Nenhum segredo commitado.

## F — Homologação
- Fluxos críticos verificados em ambiente apropriado.
- Migrações e configurações validadas.

## G — Publicação
- Destino e armazenamento seguro de segredos configurados.
- Aprovações necessárias presentes.
- Estratégia de recuperação documentada quando aplicável.
- Reversão preparada.
- Testes rápidos executados após a publicação.

## H — Entrega
- Contexto e documentação atualizados.
- Commit/versão e evidências referenciados.
- Pendências e bloqueios informados.

Ferramenta, ambiente, credencial ou permissão ausente significa BLOQUEADO, não PASSOU. Não publique em produção apenas para provar que o fluxo funciona.
