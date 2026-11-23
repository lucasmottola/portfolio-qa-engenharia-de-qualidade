# Automação Web com Cypress

Este módulo contém testes automatizados de interface para o SauceDemo. Os cenários cobrem uma tentativa de login com usuário bloqueado e a conclusão de uma compra com dois produtos.

## Requisitos e execução

- Node.js 22.x, 24.x ou 26.x em diante, compatível com Cypress 16.3.0 e npm
- Instalar as dependências com `npm ci`
- Executar todos os testes com `npm test`
- Abrir o Cypress em modo interativo com `npm run cy:open`

O script `npm test` executa `cypress run` e descobre os arquivos `*.cy.js` dentro de `cypress/e2e/`.

## Projeto 3.1 - Login com usuário bloqueado

- **Arquivo:** `cypress/e2e/login-locked-user.cy.js`
- **Tipo:** teste de interface (UI), funcional e negativo.
- **Verificações:** a mensagem de bloqueio fica visível; a rota permanece `/`; os campos de usuário e senha continuam visíveis.
- **Resultado esperado:** o acesso é recusado, a tela de login permanece disponível e a mensagem indica que o usuário está bloqueado.

## Projeto 3.2 - Checkout de dois produtos

- **Arquivo:** `cypress/e2e/checkout.cy.js`
- **Verificações:** adiciona dois produtos, confere o carrinho, preenche os dados de entrega, conclui a compra e valida a confirmação.
- **Mensagem validada:** `Thank you for your order!`

## Resultado da suíte completa

- **Última execução registrada:** 15/11/2026
- **Ambiente:** Fedora Linux, Node.js 24.18.1, Cypress 16.3.0, Electron 150 headless.
- **Specs executados:** 2
- **Testes aprovados:** 2
- **Falhas:** 0
- **Código de saída:** 0
- **Screenshots e vídeo:** não foram gerados nessa execução.

O Cypress exibiu um aviso de que o Electron será descontinuado como navegador de teste. O aviso não impediu a execução; os dois specs passaram.

## Evidência e reprodutibilidade

A execução foi realizada com `npm test` em 15/11/2026. O [registro resumido da execução](evidencias/execucao-suite-2026-11-15.md) apresenta o resultado por spec e o código de saída informado pelo terminal.

Para reproduzir:

```bash
npm ci
npm test
```

O SauceDemo é um site de demonstração. As credenciais usadas são as públicas do exercício; não use senhas pessoais.

## Execução com evidências - 23/11/2026

- **Comando:** `npm test -- --headed`
- **Resultado:** 2 testes aprovados, 0 falhas (`All specs passed!`)

### Screenshots

![Login com usuário bloqueado](evidencias/cypress-2026-11-23/screenshots/login-locked-user.cy.js/login-usuario-bloqueado.png)

![Resumo do pedido](evidencias/cypress-2026-11-23/screenshots/checkout.cy.js/checkout-resumo-pedido.png)

![Compra concluída](evidencias/cypress-2026-11-23/screenshots/checkout.cy.js/checkout-compra-concluida.png)

### Vídeos

- [Vídeo do teste de login](evidencias/cypress-2026-11-23/videos/login-locked-user-2026-11-23.mp4)
- [Vídeo do teste de checkout](evidencias/cypress-2026-11-23/videos/checkout-2026-11-23.mp4)