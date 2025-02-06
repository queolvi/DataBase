IF NOT EXISTS (SELECT * FROM sys.databases WHERE [name] = 'Catering1')
BEGIN 
     CREATE DATABASE Catering1
END 
GO 
USE Catering1; 
GO 

IF NOT EXISTS ( SELECT * FROM sysobjects WHERE name='dishes') 
	 CREATE TABLE dishes (
	 id INT IDENTITy,
	 name VARCHAR(255) , 
	 type_dishes VARCHAR(255) ,
	 image VARBINARY(MAX), 
	 preparation_time INT, 
	 technology TEXT,
	); 
GO

IF NOT EXISTS ( SELECT * FROM sysobjects WHERE name='cooking') 
	CREATE TABLE cooking(
	 id INT IDENTITy,
	 dishes_id INT,
	 portions INT,
	 date DATETIME D,
	);
GO

IF NOT EXISTS ( SELECT * FROM sysobjects WHERE name='products') 
	CREATE TABLE products( 
	 id INT IDENTITy,
	 name VARCHAR(255), 
	 calories FLOAT(53), 
	 weight INT, 
	 price MONEY
	);
GO

IF NOT EXISTS ( SELECT * FROM sysobjects WHERE name='structures') 
	CREATE TABLE structures(
	 id INT IDENTITy,
	 dishes_id INT,
	 product INT,
	 weight INT,
	);
GO
