# Reutilização de recursos e implementação

Antes de criar um logo, imagem, componente, serviço, script ou documento, inspecione o projeto de destino.

## Ordem de busca
1. Instruções do projeto e inventário de recursos.
2. Componentes, estilos, tokens, ícones e diretórios de imagens existentes.
3. Documentação e implementações anteriores.
4. Dependências e utilitários internos existentes.
5. Referências visuais aprovadas.
6. Criar recursos novos somente quando não houver alternativa adequada.

## Logos e identidade visual
- Localize o logo oficial e confirme a qual produto/projeto pertence.
- Reutilize o arquivo original, preservando transparência, proporções e legibilidade.
- Gere variantes de formato/tamanho apenas quando necessário.
- Nunca redesenhe, substitua ou invente um logo oficial sem autorização explícita.
- Não reutilize o logo de outro produto apenas porque ele está disponível.
- Se o recurso oficial não for encontrado, registre a ausência e pergunte somente se isso bloquear a entrega.

## Inventário
Mantenha `docs/INVENTARIO-DE-RECURSOS.md` no projeto de destino:

| Recurso | Caminho | Produto/marca | Observações |
|---|---|---|---|
| Logo oficial | caminho/exato/logo.svg | Identidade do produto | Preservar proporções e cores |

Não copie recursos privados de marcas para este kit público.

## Reutilização de código
Prefira uma alteração pequena em um componente funcional a uma implementação duplicada. Antes de substituir algo, documente por que a solução existente não atende e quais comportamentos, migrações e testes serão afetados.
