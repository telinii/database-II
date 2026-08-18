CREATE DATABASE hotel
GO
USE hotel

CREATE TABLE Hospede(
    CodHospede INT PRIMARY KEY IDENTITY(1,1),
    Nome varchar(80),
    Idade INT,
    Sexo VARCHAR(9)
)

CREATE TABLE Quarto(
    CodQuarto INT PRIMARY KEY IDENTITY(1,1),
    Tipo VARCHAR(50),
    Numero INT,
    Andar INT
)

CREATE TABLE Reserva(
    CodReserva INT PRIMARY KEY IDENTITY(1,1),
    DtEntrada DATE,
    DtSaida DATE,
    CodHospede INT FOREIGN KEY REFERENCES Hospede(CodHospede),
    CodQuarto INT FOREIGN KEY REFERENCES Quarto(CodQuarto)
)

CREATE TABLE Refeicao(
    CodConsumo INT PRIMARY KEY IDENTITY(1,1),
    DescRefeicao varchar(120),
    Valor MONEY,
    CodReserva INT FOREIGN KEY REFERENCES Reserva(CodReserva)
)

CREATE TABLE Pagamento(
    CodPagto INT PRIMARY KEY IDENTITY(1,1),
    Valor INT,
    DtPagto DATE,
    CodReserva INT FOREIGN KEY REFERENCES Reserva(CodReserva)
)

INSERT INTO Quarto (Tipo, Numero, Andar)
VALUES
    ('Superior Master', 101, 1),
    ('Superior Master', 102, 1),
    ('Standard', 201, 2),
    ('Suíte', 301, 3),
    ('Standard', 402, 4)

INSERT INTO Hospede (Nome, Idade, Sexo)
VALUES
    ('João da Silva', 30, 'M'),
    ('Maria Santos', 25, 'F'),
    ('Pedro Oliveira', 40, 'M'),
    ('Ana Souza', 28, 'F'),
    ('Carlos Pereira', 35, 'M'),
    ('Fernanda Costa', 22, 'F'),
    ('Lucas Almeida', 45, 'M'),
    ('Beatriz Lima', 31, 'F')

INSERT INTO Reserva (DtEntrada, DtSaida, CodHospede, CodQuarto)
VALUES
    ('2024-02-10', '2024-02-15', 1, 1),
    ('2024-12-01', '2024-12-05', 2, 3),
    ('2025-01-20', '2025-01-25', 4, 4),
    ('2026-02-05', '2026-02-12', 6, 5)

INSERT INTO Refeicao (DescRefeicao, Valor, CodReserva)
VALUES
    ('Café da manhã', 25.00, 1),
    ('Almoço', 45.00, 1),
    ('Jantar', 60.00, 2),
    ('Café da manhã', 25.00, 3),
    ('Almoço', 50.00, 4),
    ('Jantar', 70.00, 4)

SELECT COUNT(*) AS QtdSuperiorMaster
FROM Quarto
WHERE Tipo = 'Superior Master'

SELECT CONVERT(DECIMAL(10,2), AVG(Valor)) AS ValorMedio
FROM Refeicao

ALTER TABLE Hospede DROP COLUMN Idade
ALTER TABLE Hospede ADD DataNascimento DATE

SELECT COUNT(*) FROM Hospede

SELECT Hospede.Nome, Reserva.DtEntrada
FROM Hospede
INNER JOIN Reserva ON Hospede.CodHospede = Reserva.CodHospede

UPDATE Hospede SET DataNascimento = '1995-03-15' WHERE CodHospede = 1
UPDATE Hospede SET DataNascimento = '2001-07-22' WHERE CodHospede = 2
UPDATE Hospede SET DataNascimento = '1986-11-02' WHERE CodHospede = 3
UPDATE Hospede SET DataNascimento = '1998-05-10' WHERE CodHospede = 4
UPDATE Hospede SET DataNascimento = '1991-09-18' WHERE CodHospede = 5
UPDATE Hospede SET DataNascimento = '2004-01-30' WHERE CodHospede = 6
UPDATE Hospede SET DataNascimento = '1981-04-25' WHERE CodHospede = 7
UPDATE Hospede SET DataNascimento = '1994-12-08' WHERE CodHospede = 8

SELECT Hospede.Nome, Reserva.DtEntrada
FROM Hospede
INNER JOIN Reserva ON Hospede.CodHospede = Reserva.CodHospede
WHERE Reserva.DtEntrada < '2025-01-01'
ORDER BY Hospede.Nome ASC

-- SELECT Hospede.Nome, Hospede.Sexo
-- FROM Hospede
-- INNER JOIN Reserva.CodQuarto IN Quarto.CodQuarto
-- WHERE Quarto.CodQuarto = 4

SELECT Hospede.Nome
FROM Hospede
INNER JOIN Reserva ON Hospede.CodHospede = Reserva.CodHospede
INNER JOIN Quarto ON Reserva.CodQuarto = Quarto.CodQuarto
WHERE Quarto.Andar = 4 AND Hospede.Sexo = 'F'

SELECT Quarto.Numero, Quarto.Tipo
FROM Quarto
LEFT JOIN Reserva ON Quarto.CodQuarto = Reserva.CodQuarto
WHERE Reserva.CodReserva IS NULL

INSERT INTO Pagamento (Valor, DtPagto, CodReserva)
VALUES
    (750.00, '2024-02-15', 1),
    (400.00, '2024-12-05', 2),
    (650.00, '2025-01-25', 3),
    (700.00, '2026-02-12', 4)

SELECT SUM(Pagamento.Valor) AS TotalPago
FROM Hospede
INNER JOIN Reserva ON Hospede.CodHospede = Reserva.CodHospede
INNER JOIN Pagamento ON Reserva.CodReserva = Pagamento.CodReserva
WHERE Hospede.Nome = 'João da Silva'

SELECT COUNT(DISTINCT CodHospede)
FROM Reserva
WHERE DATEDIFF(DAY, DtEntrada, DtSaida) > 5
    AND YEAR(DtEntrada) = 2026
    AND MONTH(DtEntrada) = 2


SELECT * FROM Hospede
SELECT * FROM Quarto
SELECT * FROM Reserva
SELECT * FROM Refeicao
SELECT * FROM Pagamento