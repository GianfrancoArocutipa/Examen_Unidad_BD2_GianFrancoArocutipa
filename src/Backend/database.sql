CREATE DATABASE VentasDB;
GO
USE VentasDB;
GO

CREATE TABLE Eventos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL
);

INSERT INTO Eventos (Nombre, Precio, Stock) 
VALUES ('Concierto Rock UPT', 150.00, 50), ('Teatro Cultural', 45.00, 20);