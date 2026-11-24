# Modelo de relatório de bug

Substitua os campos entre colchetes por informações confirmadas durante a investigação. Remova campos que não se aplicam e não invente resultados. Use somente dados de teste e oculte informações pessoais antes de publicar capturas.

## Identificação

- ID: [BUG-XXX]
- Título curto: [comportamento incorreto observado]
- Aplicação: [nome do site ou produto]
- Funcionalidade: [área investigada]
- Data da execução: [AAAA-MM-DD]
- Responsável: [opcional]

## Ambiente

- URL ou rota: [endereço utilizado]
- Navegador e versão: [se conhecidos]
- Sistema operacional e versão: [se conhecidos]
- Observações: [configuração relevante]

## Resumo

[Explique o problema em uma ou duas frases, usando comportamento observável.]

## Pré-condições

- [Estado inicial necessário]
- [Conta ou dado de teste necessário, sem incluir segredo]

## Passos para reprodução

1. [Primeira ação]
2. [Próxima ação]
3. [Ação que manifesta o problema]

## Resultado esperado

[Comportamento indicado pelo requisito, critério ou descrição do exercício. Cite a fonte da expectativa.]

## Resultado observado

[O que aconteceu na execução. Separe o que aparece na interface do que foi confirmado no Network ou em outro diagnóstico.]

## Frequência e reprodutibilidade

- Tentativas realizadas: [número observado]
- Tentativas com o mesmo resultado: [número observado]
- Execuções independentes: [resultado ou não avaliado]
- Frequência informada por uma plataforma externa: [se houver, identifique-a como classificação externa]

## Evidências

- Descrição da captura ou log: `evidencias/nome-do-arquivo.png`
- [Outra evidência, se houver]

Explique o que cada arquivo comprova. Não use uma captura de uma tentativa como prova de outra.

## Diagnóstico técnico

[Inclua apenas fatos observados, como tipo de requisição e status. Não atribua causa sem evidência.]

## Classificação

- Severidade: [valor e critério usado, ou não avaliada]
- Prioridade: [valor e critério usado, ou não avaliada]
- Tipo: [funcional, visual, compatibilidade ou outro]

## Limites da investigação

[Declare o que não foi confirmado, o que não foi testado e quaisquer diferenças entre tentativas.]

## Referências

- [Requisito, ficha do exercício ou documentação consultada]
