# Módulo 02 - Bug reports e investigação

Este módulo reúne investigações práticas realizadas no AcademyBugs. Cada relatório registra o comportamento esperado conforme a ficha do exercício, o comportamento observado e as evidências disponíveis. A ficha contextualiza o cenário, mas não substitui as evidências da execução.

## Casos documentados

### BUG-001 - Busca de produto retorna página 404

O caso investiga a busca pelo produto DNK Yellow Shoes. A interface exibiu `404 Error` e `Oops! That page can't be found`. Além da página, as duas capturas de Network mostram a requisição do tipo `document` com status HTTP `404`, uma em cada tentativa. Portanto, nesta versão das evidências, o status HTTP 404 do documento principal está confirmado.

- [Relatório BUG-001](BUG-001-busca-produto-404.md)
- [01: produto com busca preenchida](evidencias/BUG-001-01-pagina-produto.png)
- [02: página de erro 404](evidencias/BUG-001-02-resultado-404.png)
- [03: Network, documento HTTP 404, tentativa 1](evidencias/BUG-001-03-network-tentativa-1.png)
- [04: Network, documento HTTP 404, tentativa 2](evidencias/BUG-001-04-network-tentativa-2.png)

As capturas 03 e 04 mostram `document` e `404` no Network. Isso é diferente de usar o status de uma chamada XHR para descrever a navegação.

### BUG-002 - Reserva sem confirmação visível

Em 22/11/2026 foram feitos dois envios independentes com dados fictícios. Nas duas tentativas, a página permaneceu no formulário e não foi observada uma mensagem de confirmação. O formulário e os Payloads mostram os mesmos valores: 28/11/2026 às 7:30 AM.

Nas duas requisições, o Network mostra `POST /my-bookings/` com resposta HTTP `200 OK`. Esse status comprova que houve uma resposta HTTP, mas não confirma, por si só, que a reserva foi concluída ou armazenada.

- [Relatório BUG-002](BUG-002-reserva.md)
- [01: ficha do exercício no AcademyBugs](evidencias/BUG-002-01-ficha-academybugs.png)
- [05: formulário antes dos envios](evidencias/BUG-002-05-formulario-pre-envio.png)
- [06: Headers do primeiro envio](evidencias/BUG-002-06-headers-tentativa-1.png)
- [07: Payload do primeiro envio](evidencias/BUG-002-07-payload-tentativa-1.png)
- [08: Headers do segundo envio](evidencias/BUG-002-08-headers-tentativa-2.png)
- [09: Payload do segundo envio](evidencias/BUG-002-09-payload-tentativa-2.png)

As capturas antigas 02, 03 e 04 foram mantidas na pasta, mas não representam esta execução e não estão listadas como evidências dela.

## Como investigar e registrar um caso

1. Abrir o exercício indicado na ficha do AcademyBugs e identificar qual comportamento está sendo investigado.
2. Registrar o estado inicial, as pré-condições e os dados de teste usados. Não usar dados pessoais reais.
3. Seguir os passos de reprodução e observar a interface após cada ação importante.
4. Separar o resultado esperado, conforme a descrição do exercício, do resultado observado durante a execução.
5. Se usar o DevTools, abrir Network antes da tentativa. Distinguir a requisição `document` de chamadas `XHR` e registrar o status da linha correspondente ao comportamento investigado.
6. Relacionar cada captura ao caso e à tentativa que ela documenta. Não combinar execuções diferentes como se fossem uma sequência única.
7. Registrar os limites das evidências. Uma resposta HTTP `200 OK` não prova, por si só, que a operação de negócio foi concluída.
8. Não atribuir uma causa técnica sem investigação que a sustente.

## Cuidados ao publicar

Antes de adicionar imagens ao repositório, confira se nome, e-mail, telefone, endereço ou outros dados pessoais estão visíveis. Oculte dados reais nas cópias das capturas e preserve os originais localmente.

Severidade, frequência ou abrangência de navegadores exibidas na ficha devem ser identificadas como classificações da plataforma, salvo se forem verificadas independentemente.

## Arquivos do módulo

- `README.md`: índice e orientações deste módulo.
- `modelo-relatorio-bug.md`: estrutura reutilizável para novos relatórios.
- `BUG-001-busca-produto-404.md`: relato da busca de produto e do HTTP 404 do documento observado nas duas capturas de Network.
- `BUG-002-reserva.md`: relato da solicitação de reserva sem confirmação visível.
- `evidencias/`: capturas associadas a cada caso.

## Referências dos exercícios

- [Booking a table doesn't work, AcademyBugs](https://academybugs.com/)
- [Formulário Restaurant Reservation](https://academybugs.com/my-bookings/)
