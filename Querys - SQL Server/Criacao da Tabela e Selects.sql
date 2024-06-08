-- Criação da tabela Obra
CREATE TABLE Obra (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    CodigoISWC VARCHAR(255),
    Idioma VARCHAR(255),
    DataLancamento DATETIME,
    DataInclusao DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela Fonograma
CREATE TABLE Fonograma (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    CodigoISRC VARCHAR(255),
    DuracaoMin INT CHECK (DuracaoMin > 0),
    DuracaoSeg INT CHECK (DuracaoSeg > 0),
    DataInclusao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FlagNacional CHAR(1),
    IDObra INT,
    FOREIGN KEY (IDObra) REFERENCES Obra(ID)
);

-- Criação da tabela Titular
CREATE TABLE Titular (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Nacionalidade VARCHAR(255),
    DataNascimento DATETIME,
    CPF VARCHAR(255),
    Sexo CHAR(1),
    EstadoCivil CHAR(1),
    Logradouro VARCHAR(255),
    Numero VARCHAR(255),
    Complemento VARCHAR(255),
    Bairro VARCHAR(255),
    CEP VARCHAR(255),
    Cidade VARCHAR(255),
    UF VARCHAR(255),
    Pais VARCHAR(255),
    DataInclusao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FlagAtivo CHAR(1)
);

-- Criação da tabela ObraTitular
CREATE TABLE ObraTitular (
    IDObra INT,
    IDTitular INT,
    PRIMARY KEY (IDObra, IDTitular),
    FOREIGN KEY (IDObra) REFERENCES Obra(ID),
    FOREIGN KEY (IDTitular) REFERENCES Titular(ID)
);

SELECT * FROM Obra
SELECT * FROM Fonograma
SELECT * FROM ObraTitular
SELECT * FROM Titular

SELECT MAX(ID) as ID FROM Titular

SELECT TOP 10 * FROM Obra ORDER BY DataInclusao DESC;

SELECT * FROM Obra
JOIN Fonograma ON Obra.ID = Fonograma.IDObra
JOIN ObraTitular ON Obra.ID = ObraTitular.IDObra
JOIN Titular ON ObraTitular.IDTitular = Titular.ID;

sp_help Titular

DELETE FROM Obra WHERE CodigoISWC = 'ISWC1'

DELETE FROM ObraTitular WHERE ObraTitular.IDObra = 1

DELETE FROM Titular WHERE Titular.ID = 1

DELETE FROM Fonograma WHERE IDObra IN (SELECT IDObra FROM ObraTitular WHERE IDTitular = 1);

-- Consulta c)
DELETE FROM Obra WHERE DataInclusao BETWEEN '2024-01-01 00:00:00' AND '2024-12-31 23:59:59';
