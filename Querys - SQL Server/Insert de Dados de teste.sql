-- Inserção de dados na tabela Obra
INSERT INTO Obra (ID, Nome, CodigoISWC, Idioma, DataLancamento)
VALUES (1, 'Obra1', 'ISWC1', 'Português', '2024-01-01'),
	   (2, 'Obra2', 'ISWC2', 'Inglês', '2024-02-02'),
       (3, 'Obra3', 'ISWC3', 'Espanhol', '2024-03-03'),
       (4, 'Obra4', 'ISWC4', 'Francês', '2024-04-04'),
       (5, 'Obra5', 'ISWC5', 'Alemão', '2024-05-05'),
       (6, 'Obra6', 'ISWC6', 'Italiano', '2024-06-06');

-- Inserção de dados na tabela Fonograma
INSERT INTO Fonograma (ID, Nome, CodigoISRC, DuracaoMin, DuracaoSeg, FlagNacional, IDObra)
VALUES (1, 'Fonograma1', 'ISRC1', 3, 30, 'N', 1), 
       (2, 'Fonograma2', 'ISRC2', 4, 40, 'E', 2),
       (3, 'Fonograma3', 'ISRC3', 5, 50, 'N', 3),
       (4, 'Fonograma4', 'ISRC4', 6, 60, 'E', 4),
       (5, 'Fonograma5', 'ISRC5', 7, 70, 'N', 5),
       (6, 'Fonograma6', 'ISRC6', 8, 80, 'E', 6);

-- Inserção de dados na tabela Titular
INSERT INTO Titular (ID, Nome, Nacionalidade, DataNascimento, CPF, Sexo, EstadoCivil, Logradouro, Numero, Complemento, Bairro, CEP, Cidade, UF, Pais, FlagAtivo)
VALUES (1, 'Titular1', 'Brasileiro', '1980-01-01', '123.456.789-00', 'M', 'S', 'Rua 1', '123', 'Apto 1', 'Bairro 1', '12345-678', 'Cidade 1', 'RJ', 'Brasil', 'S'),
       (2, 'Titular2', 'Americano', '1981-02-02', '234.567.890-11', 'F', 'C', 'Rua 2', '234', 'Apto 2', 'Bairro 2', '23456-789', 'Cidade 2', 'SP', 'EUA', 'N'),
       (3, 'Titular3', 'Espanhol', '1982-03-03', '345.678.901-22', 'M', 'S', 'Rua 3', '345', 'Apto 3', 'Bairro 3', '34567-890', 'Cidade 3', 'MG', 'Espanha', 'S'),
       (4, 'Titular4', 'Francês', '1983-04-04', '456.789.012-33', 'F', 'C', 'Rua 4', '456', 'Apto 4', 'Bairro 4', '45678-901', 'Cidade 4', 'RJ', 'França', 'N'),
       (5, 'Titular5', 'Alemão', '1984-05-05', '567.890.123-44', 'M', 'S', 'Rua 5', '567', 'Apto 5', 'Bairro 5', '56789-012', 'Cidade 5', 'ES', 'Alemanha', 'S'),
       (6, 'Titular6', 'Italiano', '1985-06-06', '678.901.234-55', 'F', 'C', 'Rua 6', '678', 'Apto 6', 'Bairro 6', '67890-123', 'Cidade 6', 'BA', 'Itália', 'N');

-- Inserção de dados na tabela ObraTitular
INSERT INTO ObraTitular (IDObra, IDTitular)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6);