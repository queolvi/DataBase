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
DROP VIEW IF EXISTS dishesView;
DROP VIEW IF EXISTS cookingView;
DROP VIEW IF EXISTS recipesView;
DROP VIEW IF EXISTS structuresView;
DROP VIEW IF EXISTS productsView;
DROP VIEW IF EXISTS AllDataView;
DROP VIEW IF EXISTS priceDishesView;
DROP VIEW IF EXISTS ExpensiveDishesView;

CREATE TABLE dishes (
 id INT IDENTITY PRIMARY KEY NOT NULL,
 name VARCHAR(255) NOT NULL, 
 type_dishes VARCHAR(255) NOT NULL,
 image VARBINARY(MAX) NOT NULL, 
 preparation_time INT, 
 technology TEXT,
); 

CREATE TABLE cooking(
 id INT  IDENTITY PRIMARY KEY NOT NULL,
 dishes_id INT NOT NULL,
 portions INT NOT NULL,
 date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
 FOREIGN KEY (dishes_id) REFERENCES dishes(id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE products( 
 id INT IDENTITY PRIMARY KEY NOT NULL,
 name VARCHAR(255) NOT NULL, 
 calories FLOAT(53) NOT NULL, 
 weight INT NOT NULL, 
 price MONEY NOT NULL
);

CREATE TABLE structures(
 id INT IDENTITY PRIMARY KEY NOT NULL,
 dishes_id INT,
 product INT,
 weight INT NOT NULL,
 FOREIGN KEY (dishes_id) REFERENCES dishes(id) ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (product) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE,
);

-- Представление списка блюд и их времени приготовления, у которых время приготовления ниже среднего
-- Список ингридиентов и количество блюд, в которых они используются
-- Вывести список блюд и соответствующий блюду ингридиент, которого больше всего в нем