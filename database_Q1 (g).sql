-- Active: 1736219585719@@127.0.0.1@3306@dbms
--i) 
CREATE TABLE properties (
    PropertyID INT PRIMARY KEY,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Type VARCHAR(50) CHECK (Type IN ('Residential', 'Commercial', 'Industrial')),
    Size INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Available', 'Sold', 'Rented'))
);
--ii)
INSERT INTO properties (PropertyID, Address, City, Type, Size, Price, Status)
VALUES 
(1, '684 Acacia Avenue', 'Kampala', 'Commercial', 4000, 600000.00, 'Available'),
(2, '24 Kira Road', 'Kampala', 'Residential', 1400, 180000.00, 'Available'),
(3, '103 Lumumba Avenue', 'Kampala', 'Industrial', 5000, 750000.00, 'Sold'),
(4, '987 Bukoto Street', 'Kampala', 'Residential', 1200, 150000.00, 'Available'),
(5, '222 Entebbe Road', 'Kampala', 'Residential', 1800, 220000.00, 'Available'),
(6, '94 Jinja Road', 'Kampala', 'Commercial', 3000, 500000.00, 'Available'),
(7, '9 Nakasero Hill Road', 'Kampala', 'Commercial', 3500, 550000.00, 'Sold'),
(8, 'Plot 71 Kampala Road', 'Kampala', 'Residential', 1500, 200000.00, 'Available'),
(9, '948 Naguru Drive', 'Kampala', 'Industrial', 7000, 1000000.00, 'Available'),
(10, 'Plot 82 Ggaba Road', 'Kampala', 'Industrial', 6000, 900000.00, 'Rented');

--iii)
SELECT * 
FROM properties
WHERE City = 'Kampala' 
AND Status = 'Sold';

--iv)
UPDATE properties
SET Status = 'Sold'
WHERE PropertyID = 5;
