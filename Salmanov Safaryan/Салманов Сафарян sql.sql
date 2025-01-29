IF NOT EXISTS (SELECT * FROM sys.databases 
 WHERE [name] = 'TOVAR')
BEGIN
    CREATE DATABASE TOVAR
END 
GO

USE TOVAR;
GO

DROP TABLE IF EXISTS Kurer;
DROP TABLE IF EXISTS Otgruzka;	
DROP TABLE IF EXISTS Zakaz;
DROP TABLE IF EXISTS Tovar;
DROP TABLE IF EXISTS Zakazchik;
DROP TABLE IF EXISTS Zavod;



CREATE TABLE Zavod (
   inn VARCHAR(12) PRIMARY KEY NOT NULL,
   naimenovanie_procesa VARCHAR(150) NOT NULL,
   adres VARCHAR(100) NOT NULL,
   email VARCHAR(50) NOT NULL,
);


CREATE TABLE Zakazchik (
    no_pasp VARCHAR(10) PRIMARY KEY NOT NULL,
	inn VARCHAR(12) NOT NULL,                               
    adres VARCHAR(100) NOT NULL,                          
    fio VARCHAR(100) NOT NULL,              
    no_telefona VARCHAR(11) NOT NULL,         
    FOREIGN KEY (inn) REFERENCES Zavod(inn)
);

CREATE TABLE Tovar (
    no_tovara INT PRIMARY KEY IDENTITY,    
    naimenovanie_tovara VARCHAR(100) NOT NULL,        
);


CREATE TABLE Zakaz (
    no_zakaza INT PRIMARY KEY IDENTITY NOT NULL, 
    no_dogovora VARCHAR(50) NOT NULL,                 
    data_zaklyucheniya DATE NOT NULL,           
    no_tovara INT NOT NULL,        
    planirovannaya_postavka DATE NOT NULL,       
    cena_tovara DECIMAL(10, 2) NOT NULL,        
    no_pozitsii INT NOT NULL,	               
    no_pasp VARCHAR(10) NOT NULL,                     
    FOREIGN KEY (no_pasp) REFERENCES Zakazchik(no_pasp),
    FOREIGN KEY (no_tovara) REFERENCES Tovar(no_tovara),
);


CREATE TABLE Otgruzka (
    no_otgruzki INT PRIMARY KEY IDENTITY, 
    no_zakaza INT NOT NULL,                      
    data_otgruzki DATE NOT NULL,                
    otgruzheno_tovara INT NOT NULL,             
    FOREIGN KEY (no_zakaza) REFERENCES Zakaz(no_zakaza) 
);	



CREATE TABLE Kurer (
   no_pasp VARCHAR(10) PRIMARY KEY NOT NULL,
   fio VARCHAR(100) NOT NULL,
   no_telefona VARCHAR(11) NOT NULL,
   FOREIGN KEY (no_pasp) REFERENCES Zakazchik(no_pasp)
);

