CREATE TABLE customers(
                          customersNumber INT PRIMARY KEY NOT NULL ,
                          customersName VARCHAR(100),
                          contactLastName VARCHAR(50),
                          contactFirstName VARCHAR(50),
                          phone VARCHAR(20),
                          addressLine1 VARCHAR(100)
);
INSERT INTO customers VALUE (103,'Atelier','schmitt','carine','40322555','54 :rue royale'),(112,'signal gift stores','king','jean','7025551838','8489 :strong st'),
    (114,'austranlian collectors, co','ferguson','peter','039524555','636st kilda road');
SELECT *FROM customers WHERE customersName='Atelier';
EXPLAIN SELECT * FROM customers WHERE customersName ='Atelier';
ALTER TABLE customers ADD INDEX idx_customerName(customersName);
EXPLAIN SELECT * FROM customers WHERE customersName ='Atelier';
ALTER TABLE customers ADD INDEX huy(contactFirstName,contactLastName);
EXPLAIN SELECT *FROM customers WHERE contactLastName='king' OR contactFirstName='jean';
ALTER TABLE  customers DROP INDEX huy;
DELIMITER //
CREATE PROCEDURE find()
BEGIN
SELECT *FROM customers;
END //
DELIMITER ;
CALl find();
DELIMITER //
DROP PROCEDURE  find;
CREATE PROCEDURE find()
BEGIN
SELECT *FROM customers WHERE customersNumber=114;
end //
CALL find();
DELIMITER //
CREATE PROCEDURE getCusByID
(IN cusNum INT(11))
BEGIN
SELECT *FROM customers WHERE customersNumber=cusNum;
end //
DELIMITER ;
CALL getCusByID(112);
DROP PROCEDURE getCusByID;
DELIMITER //
CREATE PROCEDURE getCity(
    IN in_city VARCHAR(50),
    OUT total INT
)
BEGIN
SELECT COUNT(customersNumber)
INTO total
FROM customers
WHERE city=in_city;
end //
DELIMITER ;
CALL getCity('Lyon',@total);
SELECT @total;
DELIMITER //
CREATE PROCEDURE setCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter=counter+inc;
end //
DELIMITER ;
SET @counter =1;
CALL setCounter(@counter,1);
SELECT @counter
           CALL setCounter(@counter,1);
SELECT @counter;
CREATE VIEW customer_view AS
SELECT customersNumber,customersName,phone
FROM customers;
SELECT *FROM customer_view;
CREATE OR REPLACE VIEW custo AS SELECT customersName,customersNumber,contactFirstName,contactLastName,phone FROM customers WHERE city='Nantes';

