IF NOT EXISTS (SELECT * FROM sys.databases WHERE [name] = 'Hospital')
BEGIN 
     CREATE DATABASE Hospital
END 
GO 
USE Hospital; 
GO 

ALTER TABLE Patients ADD CONSTRAINT PK_Patients PRIMARY KEY (patient_id);
ALTER TABLE Specialties ADD CONSTRAINT PK_Specialties PRIMARY KEY (specialty_id);
ALTER TABLE Categories ADD CONSTRAINT PK_Categories PRIMARY KEY (category_number);
ALTER TABLE Diagnoses ADD CONSTRAINT PK_Diagnoses PRIMARY KEY (diagnosis_code);
ALTER TABLE Doctors ADD CONSTRAINT PK_Doctors PRIMARY KEY (doctor_id);
ALTER TABLE Appointments ADD CONSTRAINT PK_Appointments PRIMARY KEY (appointment_id);
ALTER TABLE MedicalCards ADD CONSTRAINT PK_MedicalCards PRIMARY KEY (med_card_id);
ALTER TABLE MedicalRecordEntries ADD CONSTRAINT PK_MedicalRecordEntries PRIMARY KEY (record_number);


ALTER TABLE Doctors
ADD CONSTRAINT FK_Doctors_Specialties FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id);

ALTER TABLE Doctors
ADD CONSTRAINT FK_Doctors_Categories FOREIGN KEY (category_number) REFERENCES Categories(category_number);

ALTER TABLE Appointments
ADD CONSTRAINT FK_Appointments_Doctors FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id);

ALTER TABLE Appointments
ADD CONSTRAINT FK_Appointments_Patients FOREIGN KEY (patient_id) REFERENCES Patients(patient_id);

ALTER TABLE MedicalCards
ADD CONSTRAINT FK_MedicalCards_Patients FOREIGN KEY (patient_id) REFERENCES Patients(patient_id);

ALTER TABLE MedicalCards
ADD CONSTRAINT FK_MedicalCards_Diagnoses FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code);

ALTER TABLE MedicalCards
ADD CONSTRAINT FK_MedicalCards_Appointments FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id);

ALTER TABLE MedicalRecordEntries
ADD CONSTRAINT FK_MedicalRecordEntries_MedicalCards FOREIGN KEY (med_card_id) REFERENCES MedicalCards(med_card_id);

ALTER TABLE MedicalRecordEntries
ADD CONSTRAINT FK_MedicalRecordEntries_Patients FOREIGN KEY (patient_id) REFERENCES Patients(patient_id);

ALTER TABLE MedicalRecordEntries
ADD CONSTRAINT FK_MedicalRecordEntries_Diagnoses FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code);