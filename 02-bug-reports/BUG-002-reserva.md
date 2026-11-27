# BUG-002 - Solicitação de reserva sem confirmação visível

## Situação

A ausência de confirmação foi observada em 2 de 2 envios independentes, no mesmo ambiente. Não foi testada em outros navegadores nem em outros dias.

## Resumo

Ao solicitar uma reserva de mesa no AcademyBugs, a página permaneceu em `/my-bookings/` e não foi observada uma mensagem de confirmação.

## Aplicação e ambiente

- Aplicação: AcademyBugs
- Funcionalidade: Restaurant Reservation
- URL: https://academybugs.com/my-bookings/
- Navegador: Google Chrome, versão 157.0.8103.78 (x86_64)
- Sistema operacional: Fedora Linux 44 (Workstation Edition)
- Data da execução relatada: 22/11/2026
- Dados preenchidos: fictícios, conforme relato do executor

## Pré-condições

- A página Restaurant Reservation está acessível.
- Há uma data e um horário disponíveis para seleção.
- O formulário é preenchido com dados de teste, sem informações pessoais reais.

## Passos para reproduzir

1. Acessar https://academybugs.com/.
2. Na seção Examples of Bugs, abrir o exercício Booking a table doesn't work.
3. Na ficha do exercício, abrir Table Reservation form.
4. Na página Restaurant Reservation, selecionar uma data e um horário disponíveis.
5. Selecionar a quantidade de pessoas.
6. Preencher Name, Email e Phone com dados fictícios.
7. Clicar em Request Booking.
8. Observar se a página apresenta uma mensagem de confirmação.

## Resultado esperado

A ficha do exercício informa: “The user should be able to book a table, but in this example the user cannot submit the booking form.” Assim, o resultado esperado é que seja possível enviar a solicitação de reserva. A captura da ficha disponível não especifica uma mensagem de confirmação específica.

## Resultado observado

Em 22/11/2026, foram feitos dois envios independentes do formulário, usando dados fictícios. Nas duas tentativas, foram selecionados 28/11/2026 e 7:30 AM.

Após cada envio, o formulário permaneceu visível na página e não foi observada uma mensagem de confirmação.

## Informação técnica observada

Nas duas tentativas, o Network mostra uma requisição `POST` para `/my-bookings/` com resposta HTTP `200 OK`.

Os Payloads mostram `rtb-date: 2026/11/28` e `rtb-time: 7:30 AM`, correspondentes aos valores exibidos no formulário. As capturas de Headers e Payload de cada tentativa referem-se à respectiva requisição selecionada.

O status HTTP `200 OK` confirma que houve uma resposta do servidor. Não comprova, por si só, que a reserva foi concluída ou armazenada.

## Reprodutibilidade observada

- Envios independentes realizados: 2.
- Formulário permaneceu visível sem confirmação observada: 2 de 2 tentativas.
- Essa contagem descreve somente as tentativas registradas neste relatório.

## Classificação

- Tipo indicado pela ficha do AcademyBugs: funcional.
- Severidade indicada pela ficha: `Critical`.
- Frequência indicada pela ficha: `Every Time`. Isso é uma classificação da plataforma, não uma medição deste relatório.
- Ambiente indicado pela ficha: `All Browsers`. Este relatório registra as tentativas feitas no ambiente descrito acima.

## Evidências

A ficha contextualiza o exercício. As demais capturas registram os dois envios feitos em 22/11/2026.

- [01: ficha do exercício](evidencias/BUG-002-01-ficha-academybugs.png)
- [05: formulário preenchido antes do envio](evidencias/BUG-002-05-formulario-pre-envio.png)
- [06: Headers do primeiro envio](evidencias/BUG-002-06-headers-tentativa-1.png)
- [07: Payload do primeiro envio](evidencias/BUG-002-07-payload-tentativa-1.png)
- [08: Headers do segundo envio](evidencias/BUG-002-08-headers-tentativa-2.png)
- [09: Payload do segundo envio](evidencias/BUG-002-09-payload-tentativa-2.png)

## Limites das evidências

A falta de confirmação visual foi observada nas duas tentativas. A resposta HTTP `200 OK` e os dados do Payload não permitem concluir se a reserva foi registrada no servidor. Este relatório não atribui uma causa técnica ao comportamento. Por isso, a gravação da reserva fica como não verificada.

Os dados de contato usados são fictícios, conforme informado pelo executor.

## Referências

- [Ficha Booking a table doesn't work, AcademyBugs](https://academybugs.com/examples/ )
- [Formulário Restaurant Reservation, AcademyBugs](https://academybugs.com/my-bookings/ )