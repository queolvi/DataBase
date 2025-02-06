IF NOT EXISTS (SELECT * FROM sys.databases WHERE [name] = 'Catering')
BEGIN 
     CREATE DATABASE Catering
END 
GO 
USE Catering; 
GO 

DROP TABLE IF EXISTS cooking;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS structures;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS dishes;