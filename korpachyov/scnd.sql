IF NOT EXISTS (SELECT * FROM sys.databases WHERE [name] = 'Hospital')
BEGIN 
     CREATE DATABASE Hospital
END 
GO 
USE Hospital; 
GO 

CREATE TABLE Patients_NoConstraints (
patient_id INT,
patient_fio VARCHAR(255),
patient_birthday DATE,
patient_gender varchar(1) DEFAULT 'M',
service_discount DECIMAL(5,2),
patient_address VARCHAR(255)
);

CREATE TABLE Specialties_NoConstraints (
specialty_id INT,
specialty VARCHAR(255)
);

CREATE TABLE Categories_NoConstraints (
category_number INT,
category_name VARCHAR(255),
price_per_visit DECIMAL(10,2)
);

CREATE TABLE Diagnoses_NoConstraints (
diagnosis_code INT,
diagnosis_name VARCHAR(255)
);

CREATE TABLE Doctors_NoConstraints (
doctor_id INT,
doctor_fio VARCHAR(255),
specialty_id INT,
category_number INT
);

CREATE TABLE Appointments_NoConstraints (
appointment_id INT,
doctor_id INT,
patient_id INT,
purpose VARCHAR(255),
appointment_date DATE,
coupon_number INT,
visit_cost DECIMAL(10,2),
doctor_category INT
);

CREATE TABLE MedicalCards_NoConstraints (
med_card_id INT,
patient_id INT,
appointment_date DATE,
opening_date DATE,
diagnosis_code INT,
appointment_id INT
);

CREATE TABLE MedicalRecordEntries_NoConstraints (
record_number INT,
med_card_id INT,
patient_id INT,
diagnosis_code INT,
doctor_fio VARCHAR(255)
);



