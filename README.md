# Projeto de Produtora - Delphi

Check-in de afazeres:

Inserção de Registros de Exemplo:

- [x] Insira registros de exemplo em todas as tabelas criadas.

Scripts para Consultas:

- [x] Retorne 10 registros da tabela que possui o campo DATETIME ordenado de forma decrescente.
- [x] Retorne todos os registros de todas as tabelas utilizando JOIN.
- [x] Delete todos os registros da tabela que possui o campo DATETIME que foram inseridos em um determinado intervalo de horas.
- [x] Delete todos os fonogramas de um titular.

Etapa 2: Avaliação de Lógica

- [x] Elabore um algoritmo, utilizando pseudolinguagem (ou mesmo Pascal), que ao receber um número qualquer apresente a soma do próprio número com os 100 subsequentes.

Etapa 3: Avaliação de Conhecimentos de Sintaxe do Delphi
Prático

Desenvolvimento de um Programa em Delphi:

- [x] Crie um programa em Delphi com uma tela de cadastro contendo as funcionalidades de Inserir, Editar e Apagar, confirmados pelos botões "Gravar" e "Cancelar".
- [x] Use a tabela "TITULAR" criada na etapa 1.
Recursos Adicionais no Programa:

- [x] Desenvolva a tela "Main" do projeto com um componente "MainMenu", contendo a opção "Cadastro" e sub-opção "Titulares...".
- [x] Utilize um "Data Module" para conectar-se com o BD, sendo o meio de ligação entre os componentes de consulta e execução e o BD.

Realize as validações:

- [x] Nome preenchido.
- [x] Validação do formato e validade da data, se preenchidas.
- [x] O componente que captura o sexo do titular só pode aceitar os caracteres "M" ou "F".
- [x] Não permitir inserção de um nome já existente no BD, emitindo um alerta ao usuário.

Tela Base de Cadastro:

- [x] Crie uma tela base de cadastro que servirá de herança para a tela de cadastro de titulares.
- [x] Esta tela terá um DataSet e, no mínimo, os botões básicos (Inserir, Editar e Apagar).
- [x] O botão "Apagar" deve ter sua funcionalidade programada nesta tela base, deletando o registro vigente no DataSet.
- [x] Utilize uma API para preencher o endereço do titular ao digitar o CEP.

## Imagens
![Captura de tela 2024-06-08 012342](https://github.com/henrique-souza/hss_produtora/assets/72718207/bdc3255e-b830-431d-a50d-36ee1eb1bfdc)
![Captura de tela 2024-06-08 012402](https://github.com/henrique-souza/hss_produtora/assets/72718207/1ac2206f-c11a-4e34-b277-9a0a2a60f891)
![Captura de tela 2024-06-08 012550](https://github.com/henrique-souza/hss_produtora/assets/72718207/ac9815ff-1962-4847-b96f-3113d8a08f99)
![Captura de tela 2024-06-08 012602](https://github.com/henrique-souza/hss_produtora/assets/72718207/0f84175f-a300-4397-b843-cc6313fdb64d)
![Captura de tela 2024-06-08 012607](https://github.com/henrique-souza/hss_produtora/assets/72718207/fea2350a-f980-4e0d-a17a-661f4e3568ac)
![Captura de tela 2024-06-08 012624](https://github.com/henrique-souza/hss_produtora/assets/72718207/3d10ac3e-ae73-4c3e-8ecc-9bd3463c6bb7)
![Captura de tela 2024-06-08 012643](https://github.com/henrique-souza/hss_produtora/assets/72718207/c92c4420-36a3-42c3-b63b-f95148d48699)
![Captura de tela 2024-06-08 012724](https://github.com/henrique-souza/hss_produtora/assets/72718207/f6f592e4-e499-444b-9e90-d24d47de82c3)
![Captura de tela 2024-06-08 012728](https://github.com/henrique-souza/hss_produtora/assets/72718207/0be23986-34ce-4148-a57a-c0d50b469098)
![Captura de tela 2024-06-08 012738](https://github.com/henrique-souza/hss_produtora/assets/72718207/3e77cd33-9043-4257-9b10-fee04cdfa47a)
![Captura de tela 2024-06-08 013146](https://github.com/henrique-souza/hss_produtora/assets/72718207/261044e5-c107-49a8-809a-103df2c55d1a)
![Captura de tela 2024-06-08 012940](https://github.com/henrique-souza/hss_produtora/assets/72718207/0245e757-07a6-45d2-8d6a-f52e8ce6c231)
![Captura de tela 2024-06-08 012948](https://github.com/henrique-souza/hss_produtora/assets/72718207/64ee135b-0476-472d-b8ad-8b469090fa50)
![Captura de tela 2024-06-08 012953](https://github.com/henrique-souza/hss_produtora/assets/72718207/7b76b4d9-8676-4024-8b2d-432504d525f3)
![Captura de tela 2024-06-08 013131](https://github.com/henrique-souza/hss_produtora/assets/72718207/4d76a4fb-dcc2-4be2-bea9-6a8041f7b73d)
![Captura de tela 2024-06-08 013135](https://github.com/henrique-souza/hss_produtora/assets/72718207/7dee3bc5-07d5-42b5-9f6b-3db5ad6b8a9b)
![Captura de tela 2024-06-08 013504](https://github.com/henrique-souza/hss_produtora/assets/72718207/72beba2e-aef1-44fa-b4b1-23c87fe2733e)
![Captura de tela 2024-06-08 013533](https://github.com/henrique-souza/hss_produtora/assets/72718207/90c9f860-26fd-443a-a6e1-fd5b5137213b)
![Captura de tela 2024-06-08 013553](https://github.com/henrique-souza/hss_produtora/assets/72718207/913f044b-5723-43d0-8673-4fe2dc7cb576)
![Captura de tela 2024-06-08 013557](https://github.com/henrique-souza/hss_produtora/assets/72718207/8eb4f9eb-ba8b-4899-bc42-803a8be579e0)






