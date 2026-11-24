# Plano de automação com Cypress

## Objetivo

Automatizar os fluxos de interface mais repetíveis do SauceDemo que fazem parte deste portfólio. O plano define o que a suíte cobre, como os testes verificam os resultados e quais limitações ainda precisam ser resolvidas. A automação complementa os casos manuais, mas não substitui toda a cobertura do módulo.

## Escopo automatizado

| ID relacionado | Spec | Verificações implementadas |
|---|---|---|
| CT-LOGIN-001 | `cypress/e2e/login-locked-user.cy.js` | Envia as credenciais públicas de `locked_out_user`, verifica a mensagem de bloqueio, confirma que a rota permanece `/` e que os campos de usuário e senha continuam visíveis. |
| CT-001 | `cypress/e2e/checkout.cy.js` | Autentica com `standard_user`, adiciona Backpack e Bike Light, confirma os dois produtos no carrinho e no resumo, preenche os dados de entrega, conclui a compra e valida a mensagem final. |

No CT-001, o spec atual não verifica a quantidade individual de cada produto, o subtotal, o imposto ou o total. Esses critérios aparecem na feature Gherkin e permanecem fora das assertions atuais do Cypress.

## Casos mantidos como testes manuais

Os casos `CT-002`, `CT-003` e `CT-004` verificam, respectivamente, First Name, Last Name e Postal Code obrigatórios no checkout. Eles estão descritos na [feature de carrinho e checkout](../01-testes-manuais-e-bdd/carrinho-e-checkout-bdd.feature) e têm resultados e evidências no [relatório de execução](../01-testes-manuais-e-bdd/relatorio-execucao-checkout.md). Como não há assertions para esses casos nos specs atuais, o plano os considera manuais.

Os testes da API ServeRest e as investigações do AcademyBugs não fazem parte desta suíte Cypress.

## Estratégia técnica

Os testes usam JavaScript e Cypress com o endereço base do SauceDemo definido em `cypress.config.js`. Os seletores `data-test` identificam os campos, botões e conteúdo testados. As assertions verificam mensagens, rotas e elementos visíveis, em vez de depender somente de uma captura de tela.

A suíte acessa o site público real do SauceDemo. Ela não usa respostas de rede simuladas. Uma mudança no site, na disponibilidade externa ou nos dados de demonstração pode afetar o resultado sem que tenha ocorrido uma alteração no código dos testes.

O spec de checkout limpa cookies e armazenamento local antes de autenticar. As credenciais são as públicas da aplicação e os dados de entrega são fictícios. Não usar senhas pessoais, dados de cartão ou informações pessoais reais.

## Execução local

Os comandos são executados dentro da pasta `04-automacao-cypress`:

```bash
npm ci
npm test
```

O comando `npm test` chama `cypress run` e executa os specs em modo headless por padrão. Para diagnóstico visual, pode-se usar `npm test -- --headed`. Uma execução headed ajuda a observar a interface, mas não substitui a verificação headless quando o objetivo é validar o comando de execução automatizada.

## Evidências

O Cypress tem `video: true` em `cypress.config.js`. Cada spec também chama `cy.screenshot()` em pontos específicos do fluxo. Os arquivos gerados durante a execução ficam nas pastas padrão de screenshots e vídeos do Cypress, que estão ignoradas pelo Git. As evidências selecionadas para o portfólio são copiadas para `evidencias/` com a pasta e a data da execução. Os relatórios devem identificar o comando usado e não misturar resultados de execuções diferentes.

## Critérios para considerar uma execução aprovada

Uma execução só deve ser registrada como aprovada quando os dois specs terminarem sem falhas e as assertions confirmarem o comportamento esperado. Se uma captura falhar e interromper um spec, esse spec não deve ser contado como aprovado, mesmo que as assertions anteriores tenham passado. Registrar também o navegador, as versões de Node.js e Cypress, o comando, a data, os testes aprovados e as falhas.

## Estado observado e pendências

No Fedora relatado, a execução `npm test` em modo headless falhou nos dois specs durante as chamadas explícitas a `cy.screenshot()`, com timeout de 30 segundos. No checkout, a falha ocorreu antes da validação da conclusão da compra. A execução `npm test -- --headed` terminou com dois testes aprovados e gerou três screenshots e dois vídeos.

Um relato público do Cypress 16.3.0 descreve timeout semelhante em Electron e informa que não reproduziu o problema em Chrome. O sistema operacional e a versão do Node.js daquele relato são diferentes do ambiente Fedora descrito aqui. A semelhança justifica testar outro navegador, mas não confirma a correção neste projeto.

Durante `npm ci`, o npm informou que o script `postinstall` de `cypress@16.3.0` não estava aprovado. O Cypress iniciou provavelmente porque o binário já existia no cache. Por esse motivo, ainda não há confirmação de uma instalação limpa que baixe o binário em um cache vazio.

Até esses dois pontos serem repetidos e verificados, a execução headless e a instalação limpa devem permanecer como pendências. Uma execução com arquivos de Cypress já armazenados em cache não comprova que uma instalação nova baixará o binário corretamente.

## Fora do escopo desta etapa

GitHub Actions e integração contínua ficam para uma etapa posterior. O foco atual é entender a cobertura, executar os testes localmente e resolver as pendências de instalação e screenshots. A configuração de workflow existente na cópia local não deve ser apresentada como competência concluída nem usada como evidência até que seja estudada e validada.

## Referências técnicas

- [Issue Cypress 35508](https://github.com/cypress-io/cypress/issues/35508), relato de `cy.screenshot()` em Electron no Cypress 16.3.0.
- [Issue Cypress 30172](https://github.com/cypress-io/cypress/issues/30172), relato anterior de timeout em Electron headless.
- [Guia de instalação do Cypress](https://docs.cypress.io/app/get-started/install-cypress), requisitos, download do binário e scripts de instalação.
- [Comando npm install-scripts](https://docs.npmjs.com/cli/v12/commands/npm-install-scripts/), aprovação seletiva e versionada dos scripts de instalação.
