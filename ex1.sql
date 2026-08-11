CREATE DATABASE ex1



--table creation
CREATE TABLE category(
    idCat INT PRIMARY KEY IDENTITY(1,1),
    nameCat varchar(50)
)

CREATE TABLE product(
    idPro INT PRIMARY KEY IDENTITY(1,1),
    descript varchar(30),
    idBarCde varchar(30),
        stock INT,
            idCat INT FOREIGN KEY REFERENCES category(idCat)
)

--REGISTER 5 CATEGORIES AND 8 PRODUCTS FILLING ALL THE FIELDS OF THE TABLES

INSERT INTO category
VALUES ('Drinks'),
       ('Food'),
       ('Personal Care'),
       ('Clean'),
       ('Electronics')

INSERT INTO product
VALUES('Coca Cola', '1234567890123', 100, 1),
      ('Pepsi', '1234567890124', 150, 1),
      ('Bread', '1234567890125', 200, 2),
      ('Shampoo', '1234567890126', 50, 3),
      ('Soap', '1234567890127', 75, 3),
      ('Detergent', '1234567890128', 60, 4),
      ('Laptop', '1234567890129', 30, 5),
      ('Smartphone', '1234567890130', 40, 5)

--4. EDIT THE STOCK OF THE PRODUCT WITH ID 4 TO 350 UNITS
UPDATE product
SET stock = 350
WHERE idPro = 4

--5.LIST THE DESCRIPTIONS, BAR CODES AND STOCK OF THE PRODUCTS THAT HAVE A STOCK GREATER THAN 500 UNITS
SELECT descript, idBarCde, stock
FROM product
WHERE stock > 500

--6. DELETE ALL THE PRODUCTS THAT HAVE THE CATEGORY ID = 3
DELETE FROM product
WHERE idCat = 3

--7. REGISTRY A NEW PRODUCT WITHOUT A BAR CODE
INSERT INTO product(descript, stock, idCat)
VALUES('PHONE', 100, 5)

--8. DELETE THE COLUMN BAR CODE 
ALTER TABLE product
DROP COLUMN idBarCde

SELECT * FROM product;


