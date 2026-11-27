# Plano de automação com Cypress

## Objetivo

Automatizar os fluxos de interface mais repetíveis do SauceDemo que fazem parte deste portfólio. O plano define o que a suíte cobre, como os testes verificam os resultados e quais limites devem ser considerados. A automação complementa os casos manuais, mas não substitui toda a cobertura do módulo.

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

Os testes usam JavaScript e Cypress com o endereço base do SauceDemo definido em `cypress.config.js`. Os seletores `data-test` identificam os campos, botões e conteúdo testados. As assertions verificam mensagens, rotas e elementos visíveis, em vez de depender somente de capturas de tela.

A suíte acessa o site público real do SauceDemo. Ela não usa respostas de rede simuladas. Uma mudança no site, na disponibilidade externa ou nos dados de demonstração pode afetar o resultado sem que tenha ocorrido uma alteração no código dos testes.

O spec de checkout limpa cookies e armazenamento local antes de autenticar. As credenciais são as públicas da aplicação e os dados de entrega são fictícios. Não usar senhas pessoais, dados de cartão ou informações pessoais reais.

## Execução local

Os comandos são executados dentro da pasta `04-automacao-cypress` e são os mesmos no Windows, no macOS e no Linux:

```bash
npm ci
npx cypress verify
npm test
```

O `npm test` executa `cypress run --browser chrome`, em modo headless. Se o Google Chrome não estiver instalado, escolha outro navegador no comando, por exemplo `npm test -- --browser edge`, `npm test -- --browser firefox` ou `npm test -- --browser chromium`. Com `npm run cy:open`, o navegador é escolhido na tela inicial do Cypress. A opção `npm test -- --headed` mostra a janela do navegador e ajuda no diagnóstico visual.

### Por que o comando indica um navegador

Sem a opção `--browser`, o Cypress usa o Electron, o navegador embutido nele. No Cypress 16.3.0, o `cy.screenshot()` falha no Electron ([issue 35508](https://github.com/cypress-io/cypress/issues/35508)). Como os specs usam capturas de tela como evidência, a suíte precisa rodar em um navegador instalado, como Chrome, Edge, Firefox ou Chromium.

### Permissão de instalação

O `package.json` autoriza o script de instalação somente para `cypress@16.3.0`. No npm 12, essa permissão é necessária para que o `postinstall` do Cypress baixe o binário durante o `npm ci`. Ela não aprova scripts de outras dependências, e versões anteriores do npm ignoram esse campo.

### Conferir a instalação com cache Cypress vazio

`npm ci` reinstala as dependências do projeto, mas normalmente reutiliza o cache global do Cypress. Para testar também o download do binário no Linux ou no macOS, execute na mesma janela de terminal:

```bash
export CYPRESS_CACHE_FOLDER="$(mktemp -d)"
npx --yes npm@12.2.3 ci
npx cypress verify
npm test
```

O diretório temporário faz com que o Cypress use um cache vazio, sem apagar o cache normal do usuário. A primeira instalação pode demorar alguns minutos porque o binário precisa ser baixado. Esta conferência é opcional e não é necessária para executar os testes.

## Evidências

O Cypress tem `video: true` em `cypress.config.js`. Cada spec também chama `cy.screenshot()` em pontos específicos do fluxo. Os arquivos gerados ficam nas pastas padrão de screenshots e vídeos do Cypress, ignoradas pelo Git. As evidências selecionadas para o portfólio são copiadas para `evidencias/` com a pasta e a data da execução. Os relatórios devem identificar o comando usado e não misturar resultados de execuções diferentes.

## Critérios para considerar uma execução aprovada

Uma execução só deve ser registrada como aprovada quando os dois specs terminarem sem falhas e as assertions confirmarem o comportamento esperado. Se uma captura falhar e interromper um spec, esse spec não deve ser contado como aprovado, mesmo que as assertions anteriores tenham passado. Registrar também o navegador, as versões de Node.js e Cypress, o comando, a data, os testes aprovados e as falhas.

## Resultados registrados

Ambiente: Fedora, Node.js 24.18.1, npm 12.2.3 e Cypress 16.3.0.

| Data | Verificação | Comando | Resultado |
|---|---|---|---|
| 24/11/2026 | Instalação limpa com cache Cypress vazio | `npx --yes npm@12.2.3 ci` e `npx cypress verify` | Aprovada. 171 pacotes instalados, sem vulnerabilidades. Cypress 16.3.0 verificado. |
| 24/11/2026 | Suíte headless no Chromium 157 | `npm test -- --browser chromium` | Aprovada. 2 testes aprovados, 0 falhas, 3 screenshots e vídeo dos dois specs. |
| 26/11/2026 | Suíte headless no Electron | `cypress run`, sem navegador indicado | Reprovada. Os 2 testes falharam com `cy.screenshot() timed out`, a falha descrita na issue 35508. |
| 27/11/2026 | Repetição no Chromium com o `package.json` final | `npm test -- --browser chromium` | Aprovada. 2 testes aprovados, 0 falhas. |

O registro de 15/11/2026 em [evidencias/execucao-suite-2026-11-15.md](evidencias/execucao-suite-2026-11-15.md) descreve uma execução histórica separada, com 2 testes aprovados e sem screenshots ou vídeo.

## Limites atuais

Neste computador, o Google Chrome está instalado como Flatpak e o Cypress não o detecta. Por isso, o comando padrão `npm test` com Chrome não foi executado aqui. Os testes também não foram executados em Windows ou macOS, nem nos navegadores Edge e Firefox.

## Fora do escopo atual

Esta etapa trata da execução local do Cypress. GitHub Actions e integração contínua não fazem parte do plano nem foram usados para as validações registradas aqui. Podem ser estudados e implementados em outra etapa.

## Referências técnicas

- [Issue Cypress 35508](https://github.com/cypress-io/cypress/issues/35508), relato de `cy.screenshot()` em Electron no Cypress 16.3.0.
- [Issue Cypress 30172](https://github.com/cypress-io/cypress/issues/30172), relato anterior de timeout em Electron headless.
- [Navegadores no Cypress](https://docs.cypress.io/app/references/launching-browsers), escolha do navegador com `--browser`.
- [Guia de instalação do Cypress](https://docs.cypress.io/app/get-started/install-cypress), requisitos, download do binário e scripts de instalação.
- [Comando npm install-scripts](https://docs.npmjs.com/cli/v12/commands/npm-install-scripts/), aprovação seletiva e versionada dos scripts de instalação.
