# BUG-001 - Busca de produto retorna página 404

## Resumo

Ao pesquisar por DNK Yellow Shoes na página do produto, a navegação leva a uma página com erro 404 em vez de apresentar resultados de busca.

## Aplicação

- Site: AcademyBugs
- Produto usado na busca: DNK Yellow Shoes
- URL de origem: `https://academybugs.com/store/dnk-yellow-shoes/?single`
- Navegador: Chrome, conforme as capturas. A versão não está visível e não foi informada.
- Tentativas registradas: duas capturas independentes do Network mostram status `404` para o documento.

## Pré-condições

- Abrir a página de detalhes do produto DNK Yellow Shoes no AcademyBugs.
- A página deve exibir o campo Product Search.

## Passos para reproduzir

1. Abrir a página do produto DNK Yellow Shoes.
2. No campo Product Search, digitar `DNK Yellow Shoes`.
3. Clicar em `Search`.
4. Observar o conteúdo da página de destino.
5. Para conferir o status da navegação, abrir o DevTools antes de repetir a busca, selecionar Network e `Doc`, então observar a requisição do documento.
6. Repetir a busca uma segunda vez e conferir novamente o tipo e o status do documento.

## Resultado esperado

A ficha do exercício informa que a busca deve localizar resultados apropriados para o termo pesquisado.

## Resultado observado

A página de destino apresenta os textos `404 Error` e `Oops! That page can't be found.`

Nas duas capturas de Network, a linha correspondente à navegação está identificada como tipo `document` e status `404`. Assim, as imagens sustentam tanto o erro exibido pela interface quanto o status HTTP 404 do documento nas duas tentativas registradas.

## Evidências

1. [Produto com o campo de busca preenchido](evidencias/BUG-001-01-pagina-produto.png)
2. [Página exibindo a mensagem 404](evidencias/BUG-001-02-resultado-404.png)
3. [Network, documento HTTP 404, tentativa 1](evidencias/BUG-001-03-network-tentativa-1.png)
4. [Network, documento HTTP 404, tentativa 2](evidencias/BUG-001-04-network-tentativa-2.png)

As duas capturas do Network mostram uma requisição do tipo `document`. O resultado não foi inferido de uma chamada XHR.

## Reprodutibilidade observada

- Tentativas documentadas: 2.
- Resultado nas capturas: HTTP 404 para o documento em 2 de 2 tentativas.
- Não se afirma que todas as tentativas futuras ou todos os navegadores terão o mesmo resultado.

## Limites da investigação

A causa técnica do erro não foi determinada. As capturas sustentam o comportamento e o status HTTP observados, mas não explicam por que o site respondeu com 404.

## Referência

- [Exercício de busca no AcademyBugs](https://academybugs.com/)
