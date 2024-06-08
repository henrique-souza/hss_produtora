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
