# Modelo de orquestração

O orquestrador controla o ciclo da tarefa. As nove especialidades são: Product Owner/Requisitos, Arquiteto, Desenvolvedor Full-stack, Especialista em Banco de Dados, QA, Segurança, DevOps, Revisor/Documentação e FinOps/Contexto.

Essas funções não significam que todos os agentes devam ser acionados em toda tarefa.

Tarefa pequena: orquestrador -> implementador -> testes direcionados -> revisão se o risco justificar -> atualização do contexto.

Funcionalidade relevante: requisitos -> arquitetura/contratos -> implementação (paralela apenas para módulos independentes) -> integração -> testes -> segurança/revisão -> homologação -> publicação autorizada -> entrega.

O orquestrador consolida `contexto.md` de forma serial. Cada tarefa registra ID/responsável, objetivo e critérios de aceite, dependências, arquivos sob responsabilidade, estado (PENDENTE/EM_ANDAMENTO/EM_REVISAO/BLOQUEADO/FALHOU/CONCLUIDO), evidências, commit e próxima ação.

Em caso de falha, registre o erro real, defina responsável, altere hipótese/código e execute novamente as verificações afetadas. Limite tentativas. Se faltarem credenciais, ferramentas ou aprovação, interrompa e informe o bloqueio.
