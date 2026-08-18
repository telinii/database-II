CREATE DATABASE ClinicaVeterinaria
GO
USE ClinicaVeterinaria

CREATE TABLE Veterinario (
    codMed INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(80),
    dataNasc DATE
)

CREATE TABLE animal (
    codPac INT PRIMARY KEY IDENTITY(1,1),
    nomeAnimal VARCHAR(80),
    especie VARCHAR(140)
)

CREATE TABLE consulta (
    codCons INT PRIMARY KEY IDENTITY(1,1),
    codMed INT FOREIGN KEY REFERENCES Veterinario(codMed),
    codPac INT FOREIGN KEY REFERENCES animal(codPac),
    dataCons DATETIME,
    valor MONEY
)

INSERT INTO Veterinario (nome, dataNasc)
VALUES
    ('Luis Fernando', '1993-09-05'),
    ('Ana Souza',    '1985-03-12'),
    ('Carlos Pereira','1978-11-23'),
    ('Mariana Lima',  '1990-07-30'),
    ('Rafael Costa',  '1982-01-15')

INSERT INTO animal (nomeAnimal, especie)
VALUES
    ('Rex',          'Cachorro'),
    ('Mel',          'Cachorro'),
    ('Bolinha',      'Cachorro'),
    ('Luna',         'Cachorro'),
    ('Mingau',       'Gato'),
    ('Frajola',      'Gato'),
    ('Bidu',         'Gato'),
    ('Piu-Piu',      'Pássaro'),
    ('Loro',         'Pássaro'),
    ('Nemo',         'Peixe')

INSERT INTO consulta (codMed, codPac, dataCons, valor)
VALUES
    (1, 1, '2026-01-05', 150.00),
    (1, 2, '2026-01-10', 200.00),
    (2, 3, '2026-01-15', 120.00),
    (2, 4, '2026-02-02', 180.00),
    (3, 5, '2026-02-08', 250.00),
    (3, 6, '2026-02-20', 130.00),
    (4, 7, '2026-03-05', 170.00),
    (4, 8, '2026-03-12', 90.00),
    (5, 9, '2026-03-18', 300.00),
    (5, 10, '2026-03-25', 110.00),
    (1, 3, '2026-04-02', 160.00),
    (2, 5, '2026-04-14', 220.00),
    (3, 7, '2026-04-22', 140.00),
    (4, 9, '2026-05-06', 190.00),
    (5, 1, '2026-05-11', 240.00),
    (1, 4, '2026-05-19', 100.00),
    (2, 6, '2026-06-03', 210.00),
    (3, 8, '2026-06-15', 155.00),
    (4, 10, '2026-06-22', 175.00),
    (5, 2, '2026-07-01', 265.00)

-- 1
SELECT MAX(valor)
FROM consulta

-- 2
SELECT AVG(valor),
MAX(valor),
MIN(valor)
FROM consulta
WHERE dataCons >= '2026-07-01' AND dataCons < '2026-08-01'

-- 3
INSERT INTO consulta (codMed, codPac, dataCons, valor)
VALUES (1, 3, '2026-08-10', 135.00)

-- 4
UPDATE Veterinario
SET nome = 'Luca'
WHERE codMed = 3

-- 5
SELECT DISTINCT especie
FROM animal

-- 6
SELECT COUNT(*)
FROM consulta
WHERE codMed = 3

-- 7
SELECT codMed, COUNT(*) AS total_consultas
FROM consulta
GROUP BY codMed

-- 8
SELECT DISTINCT especie
FROM animal

-- 9
SELECT especie,nomeAnimal
FROM animal
ORDER BY especie,nomeAnimal -- ordenalção por mais de um campo

-- 10
SELECT SUM(valor) AS valorTotal
FROM consulta
WHERE codMed = 3

-- 11
SELECT COUNT(*) AS qtdVet
FROM Veterinario

-- 12
SELECT SUM(valor) * 1.1 AS total_com_aumento
FROM consulta
WHERE codMed = 3

-- 13
SELECT COUNT(*)
FROM consulta
WHERE codMed = 3
  AND dataCons BETWEEN '2026-01-01' AND '2026-03-31'

SELECT * FROM consulta
SELECT * FROM Veterinario
SELECT * FROM animal
