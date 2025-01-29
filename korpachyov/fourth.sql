IF NOT EXISTS (SELECT * FROM sys.databases WHERE [name] = 'Hospital')
BEGIN 
     CREATE DATABASE Hospital
END 
GO 
USE Hospital; 
GO 

DROP TABLE MedicalRecordEntries;
DROP TABLE MedicalCards;
DROP TABLE Appointments;
DROP TABLE Doctors;
DROP TABLE Diagnoses;
DROP TABLE Categories;
DROP TABLE Specialties;
DROP TABLE Patients;


DROP TABLE MedicalRecordEntries_NoConstraints;
DROP TABLE MedicalCards_NoConstraints;
DROP TABLE Appointments_NoConstraints;
DROP TABLE Doctors_NoConstraints;
DROP TABLE Diagnoses_NoConstraints;
DROP TABLE Categories_NoConstraints;
DROP TABLE Specialties_NoConstraints;
DROP TABLE Patients_NoConstraints;