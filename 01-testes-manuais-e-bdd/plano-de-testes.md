# Plano de testes do portfólio

## Objetivo

Este plano organiza os testes e as investigações apresentados no portfólio. Ele registra o que será verificado, como executar cada conjunto, quais evidências guardar e quais limites devem ser considerados. Os exercícios usam aplicações públicas de demonstração e não certificam a qualidade de sistemas de produção.

## Aplicações e objetivo de cada módulo

| Aplicação | Módulo | Objetivo |
|---|---|---|
| SauceDemo | Testes manuais, BDD e Cypress | Verificar o login bloqueado, a compra de dois produtos e as validações obrigatórias do checkout. |
| ServeRest | Testes de API com Postman | Verificar autenticação, cadastro, validações de dados e operações de produtos. |
| AcademyBugs | Bug reports e investigação | Reproduzir os exercícios de busca e reserva, comparar o resultado esperado com o observado e registrar evidências. |

## Escopo

No SauceDemo, o escopo inclui o login de usuário bloqueado, o checkout positivo com dois produtos e a validação de First Name, Last Name e Postal Code obrigatórios. Os cenários de checkout estão descritos em Gherkin e têm resultados registrados no relatório correspondente. O Cypress automatiza somente o login bloqueado e o checkout positivo.

Na ServeRest, o escopo inclui login válido e inválido, cadastro válido, e-mail duplicado, e-mail ausente, senha em branco e o ciclo de criação, listagem, atualização e exclusão de produtos. Para testar e-mail duplicado, a requisição de preparação deve criar um usuário e a requisição seguinte deve reutilizar o mesmo e-mail e o mesmo corpo.

No AcademyBugs, o escopo é limitado às investigações registradas em BUG-001 e BUG-002. BUG-001 documenta duas respostas HTTP 404 na navegação do documento após a busca. BUG-002 documenta duas tentativas de envio em que o formulário permaneceu visível sem confirmação observada. A resposta HTTP 200 registrada em BUG-002 não comprova que a reserva foi armazenada.

## Fora do escopo

Este portfólio não inclui testes de carga ou desempenho, testes de segurança, testes de acessibilidade, compatibilidade ampla entre navegadores, integração com serviços de pagamento reais ou validação de dados pessoais reais. Também não confirma a persistência no servidor da reserva investigada no AcademyBugs.

## Estratégia e técnicas

Os testes funcionais de interface verificam o comportamento percebido pela pessoa usuária, incluindo mensagens, rotas e conteúdo da página. Os cenários positivos cobrem o caminho esperado. Os cenários negativos verificam credenciais bloqueadas, campos obrigatórios, e-mail duplicado e dados de cadastro inválidos.

Os testes da ServeRest são enviados pelo Postman. As verificações consideram status HTTP, conteúdo da resposta e, quando documentado, o formato JSON esperado. As operações de produto dependem de autenticação e devem seguir a ordem criar, listar, atualizar e excluir.

Os cenários Gherkin organizam os comportamentos e os critérios esperados. O relatório de execução registra os resultados observados. A automação Cypress cobre apenas os casos associados aos specs descritos no [plano de automação](../04-automacao-cypress/plano-de-automacao.md).

As investigações do AcademyBugs usam reprodução manual e evidências do navegador. O relatório separa fatos observados de conclusões que não podem ser sustentadas pelas capturas.

## Rastreabilidade dos testes

### SauceDemo

| ID | Cenário | Execução atual | Referências |
|---|---|---|---|
| CT-LOGIN-001 | Recusar o login do usuário bloqueado e manter a tela disponível. | Manual e Cypress | [Feature de login](login-locked-user-bdd.feature), [relatório de login](relatorio-execucao-login.md), [spec Cypress](../04-automacao-cypress/cypress/e2e/login-locked-user.cy.js) |
| CT-001 | Concluir uma compra com Backpack e Bike Light e validar a confirmação. | Manual e Cypress | [Feature de checkout](carrinho-e-checkout-bdd.feature), [relatório de checkout](relatorio-execucao-checkout.md), [spec Cypress](../04-automacao-cypress/cypress/e2e/checkout.cy.js) |
| CT-002 | Validar que First Name é obrigatório. | Manual | [Feature de checkout](carrinho-e-checkout-bdd.feature), [relatório e evidência](relatorio-execucao-checkout.md) |
| CT-003 | Validar que Last Name é obrigatório. | Manual | [Feature de checkout](carrinho-e-checkout-bdd.feature), [relatório e evidência](relatorio-execucao-checkout.md) |
| CT-004 | Validar que Postal Code é obrigatório. | Manual | [Feature de checkout](carrinho-e-checkout-bdd.feature), [relatório e evidência](relatorio-execucao-checkout.md) |

O CT-001 automatizado verifica os produtos e a confirmação da compra. O spec atual não valida cada quantidade nem os valores de subtotal, imposto e total. Os casos CT-002, CT-003 e CT-004 não fazem parte da suíte Cypress.

### ServeRest

| ID ou referência na coleção | Cenário | Registro |
|---|---|---|
| Login - credenciais válidas | Autenticar e obter token. | [README do módulo](../03-testes-api-postman/README.md) e coleção Postman. |
| Login - credenciais inválidas | Rejeitar credenciais inválidas. | [README do módulo](../03-testes-api-postman/README.md) e coleção Postman. |
| CT-CAD-01 | Cadastrar usuário com dados válidos. | [Relatório de cadastro](../03-testes-api-postman/bdd/relatorio-execucao-cadastro.md) e coleção Postman. |
| CT-CAD-02 | Rejeitar um segundo cadastro com o mesmo e-mail. | [Relatório de cadastro](../03-testes-api-postman/bdd/relatorio-execucao-cadastro.md) e coleção Postman. |
| TC-API-2.3-001 | Rejeitar cadastro sem a propriedade `email`. | [Caso de teste 2.3](../03-testes-api-postman/projeto-2.3-campo-obrigatorio-email.md) e coleção Postman. |
| TC-API-2.4-001 | Rejeitar cadastro com `password` em branco. | [Caso de teste 2.4](../03-testes-api-postman/projeto-2.4-senha-em-branco.md) e coleção Postman. |
| Requisições CRUD por nome | Criar, listar, atualizar e excluir produto. | [README do módulo](../03-testes-api-postman/README.md) e requisições da coleção Postman. |

Nos casos de login e CRUD, o nome da requisição Postman é usado como referência porque a coleção não registra um ID próprio para cada um deles. Os resultados e nomes devem permanecer alinhados entre a coleção, este plano e o README do módulo.

### AcademyBugs

| Referência | Investigação | Resultado registrado |
|---|---|---|
| BUG-001 | Buscar DNK Yellow Shoes a partir da página do produto. | A página de erro foi observada e o Network registrou HTTP 404 para o documento em 2 de 2 tentativas. [Relatório e evidências](../02-bug-reports/BUG-001-busca-produto-404.md) |
| BUG-002 | Enviar o formulário de reserva. | Em 2 de 2 tentativas, o formulário permaneceu visível sem confirmação observada. O Network registrou POST com HTTP 200, sem comprovar persistência. [Relatório e evidências](../02-bug-reports/BUG-002-reserva.md) |

## Ambiente e dados de teste

Os três serviços são públicos e independentes. Os relatórios de execução registram o ambiente e a data de cada atividade. Não se deve assumir que as versões, respostas ou disponibilidade permanecerão iguais em execuções futuras.

No SauceDemo, usar somente as credenciais públicas da aplicação. Nos testes de entrega, usar dados fictícios. Na ServeRest, selecionar o ambiente `ServeRest - DEV`, conferir `baseUrl` e usar e-mails e dados descartáveis. Para CT-CAD-02, criar um usuário com e-mail novo e repetir exatamente os mesmos dados na tentativa de duplicidade. No AcademyBugs, usar dados de contato fictícios.

## Condições para iniciar

Antes de executar um caso, confirmar que a aplicação ou API está acessível, que a ferramenta necessária está configurada e que os dados usados são fictícios ou descartáveis. Para os casos da ServeRest, conferir se `ServeRest - DEV` está selecionado. Para o Cypress, instalar as dependências e confirmar que o binário está disponível antes de interpretar uma falha de execução como falha funcional do site.

## Registro dos resultados

Cada execução deve indicar data, ambiente, caso executado, resultado esperado, resultado observado e evidência correspondente. Usar os seguintes estados:

| Estado | Quando usar |
|---|---|
| PASSOU | O resultado observado corresponde ao critério esperado e há evidência suficiente. |
| FALHOU | O resultado observado diverge do critério esperado e a divergência foi registrada. |
| BLOQUEADO | Não foi possível executar por problema de acesso, ambiente, dependência ou dado. Informar o motivo. |
| NÃO EXECUTADO | O caso faz parte do plano, mas ainda não foi tentado. |

Um status HTTP 400 pode ser aprovado em um cenário negativo quando a rejeição é o resultado esperado. Da mesma forma, HTTP 200 não comprova sozinho a conclusão de uma operação de negócio.

## Registro de divergências

Quando o resultado observado não corresponder ao esperado, registrar os passos usados, os dados de teste, o ambiente, a frequência observada e as evidências. Em testes de API, incluir método, endpoint, status HTTP e parte relevante do corpo da resposta, sem publicar tokens ou dados sensíveis. Separar o comportamento observado de qualquer hipótese sobre a causa. Quando houver uma ficha do AcademyBugs, identificar quais classificações vieram da plataforma e quais observações foram feitas durante a execução.

## Critérios de saída

Um conjunto de testes pode ser considerado concluído quando todos os casos planejados tiverem um resultado registrado ou estiverem identificados como bloqueados ou não executados, as divergências tiverem evidência e os links dos documentos apontarem para os arquivos corretos. O resultado de um módulo não deve ser usado para afirmar que os outros módulos também passaram.

## Riscos e limites atuais

Os serviços de demonstração podem mudar ou ficar indisponíveis. A ServeRest é uma API pública, então e-mails já usados e dados temporários podem interferir em uma repetição. No AcademyBugs, a confirmação visual ausente e a resposta HTTP 200 não permitem afirmar se a reserva foi ou não persistida. O estado de instalação e execução do Cypress, que pode afetar a interpretação dos testes automatizados, está registrado no [plano de automação](../04-automacao-cypress/plano-de-automacao.md).
