IF NOT EXISTS (SELECT *FROM sys.databases 
 WHERE [name] = 'POP3')
BEGIN 
      CREATE DATABASE POP3
END 
GO

USE POP3;
GO

CREATE TABLE Zavod1 (
   inn VARCHAR(12),
   naimenovanie_procesa VARCHAR(150),
   adres VARCHAR(100),
   email VARCHAR(50),
);


CREATE TABLE Zakazchik1 (
    no_pasp VARCHAR(10),
	inn VARCHAR(12),                               
    adres VARCHAR(100),                          
    fio VARCHAR(100),              
    no_telefona VARCHAR(11),      
);

CREATE TABLE Tovar1 (
    no_tovara INT,    
    naimenovanie_tovara VARCHAR(100),        
);


CREATE TABLE Zakaz1 (
    no_zakaza  INT, 
    no_dogovora VARCHAR(50),                 
    data_zaklyucheniya DATE,           
    no_tovara INT,        
    planirovannaya_postavka DATE,       
    cena_tovara DECIMAL(10, 2),        
    no_pozitsii INT,	               
    no_pasp VARCHAR(10),                     
);


CREATE TABLE Otgruzka1 (
    no_otgruzki INT, 
    no_zakaza INT,                      
    data_otgruzki DATE,                
    otgruzheno_tovara INT,             
);	



CREATE TABLE Kurer1 (
   no_pasp VARCHAR(10),
   fio VARCHAR(100),
   no_telefona VARCHAR(11),
 
);

