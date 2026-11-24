#import "report-theme.typ": report-accent, report-theme

#show: report-theme.with(
  title: "Portfólio de QA",
  author: "Lucas Doege Mottola",
  rhythm: "report",
  running-header: true,
)

#set text(font: "Libertinus Serif", size: 10pt, lang: "pt", region: "br")

#page(margin: (top: 1.8cm, bottom: 1.8cm, x: 2cm), numbering: none, header: none)[
  #set par(first-line-indent: 0em)
  #align(center)[
    #v(0.7cm)
    #text(size: 28pt, weight: "bold", fill: report-accent)[Portfólio de QA]
    #v(0.3cm)
    #text(size: 15pt, fill: luma(85))[Projetos, cobertura e evidências]
    #v(0.5cm)
    #text(size: 11pt)[Lucas Doege Mottola]
    #v(0.3cm)
    #text(size: 9pt, fill: luma(90))[
      Testes manuais e BDD, investigação de bugs, testes de API e automação web.
    ]
    #v(0.7cm)
    #figure(
      image("diagramas/estrutura-do-portfolio.png", width: 100%),
      caption: [Os projetos usam três plataformas de demonstração independentes.],
    )
    #v(0.4cm)
    #link("https://github.com/lucasmottola/portfolio-qa-engenharia-de-qualidade")[Acessar o repositório no GitHub]
  ]
]

#counter(page).update(1)

= Projetos e cobertura

Este repositório reúne exercícios práticos. Os registros mostram o que foi testado e quais evidências sustentam cada resultado. As aplicações são independentes e não formam um único produto integrado.

- *Testes manuais e BDD, SauceDemo:* login bloqueado e checkout. O relatório de checkout registra quatro casos aprovados, de `CT-001` a `CT-004`.
- *Bug reports, AcademyBugs:* `BUG-001` registra a página HTTP 404 em duas tentativas. `BUG-002` registra duas tentativas de reserva sem confirmação visual. A resposta HTTP 200 não é tratada como prova de que a reserva foi concluída.
- *Testes de API, ServeRest:* coleção Postman com 11 requisições para login, cadastro, validações e operações CRUD de produtos.
- *Automação, SauceDemo:* dois testes Cypress para login bloqueado e checkout de dois produtos. A execução registrada em 23/11/2026 terminou com dois testes aprovados e zero falhas.

#figure(
  image("diagramas/mapa-mental-testes.png", width: 100%),
  caption: [Escopo, abordagem, evidências e limites dos exercícios.],
)

#pagebreak()

= Evidências selecionadas

As imagens abaixo vêm dos relatórios e execuções publicados no repositório. Cada captura ilustra um resultado específico, não uma garantia de comportamento futuro das plataformas.

#grid(
  columns: (1fr, 1fr),
  column-gutter: 0.8em,
  row-gutter: 0.7em,
  [
    #figure(
      image("../01-testes-manuais-e-bdd/evidencias/checkout-ct-001-resumo-pedido.png", width: 100%),
      caption: [SauceDemo: resumo do pedido.],
    )
  ],
  [
    #figure(
      image("../02-bug-reports/evidencias/BUG-001-02-resultado-404.png", width: 100%),
      caption: [AcademyBugs: busca termina em página 404.],
    )
  ],
  [
    #figure(
      image("../03-testes-api-postman/evidencias/cadastro-email-obrigatorio.png", width: 100%),
      caption: [ServeRest: validação de e-mail ausente.],
    )
  ],
  [
    #figure(
      image("../04-automacao-cypress/evidencias/cypress-2026-11-23/screenshots/checkout.cy.js/checkout-compra-concluida.png", width: 100%),
      caption: [Cypress: compra concluída no SauceDemo.],
    )
  ],
)

#v(0.4cm)

#text(size: 8.5pt, fill: luma(80))[
  Os detalhes de execução, limitações e demais evidências estão nos documentos de cada módulo. Consulte o README do repositório para acessar os arquivos e instruções.
]
