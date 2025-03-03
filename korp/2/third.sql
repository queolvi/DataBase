ALTER TABLE Patients ADD CONSTRAINT CH_Patients_patient_id CHECK (patient_id >=0 AND patient_id <= 9999999);
ALTER TABLE Specialties ADD CONSTRAINT CH_Specialties_specialty_id CHECK (specialty_id >=0 AND specialty_id <= 9999999);
ALTER TABLE Categories ADD CONSTRAINT CH_Categories_category_number CHECK (category_number >=0 AND category_number <= 9999999);
ALTER TABLE Diagnoses ADD CONSTRAINT CH_Diagnoses_diagnosis_code CHECK (diagnosis_code >=0 AND diagnosis_code <= 9999999);

ALTER TABLE Doctors ADD CONSTRAINT CH_Doctors_doctor_id CHECK (doctor_id >=0 AND doctor_id <= 9999999);
ALTER TABLE Doctors ADD CONSTRAINT CH_Doctors_specialty_id CHECK (specialty_id >=0 AND specialty_id <= 9999999);
ALTER TABLE Doctors ADD CONSTRAINT CH_Doctors_category_number CHECK (category_number >=0 AND category_number <= 9999999);

ALTER TABLE Appointments ADD CONSTRAINT CH_Appointments_appointment_id CHECK (appointment_id >=0 AND appointment_id <= 9999999);
ALTER TABLE Appointments ADD CONSTRAINT CH_Appointments_doctor_id CHECK (doctor_id >=0 AND doctor_id <= 9999999);
ALTER TABLE Appointments ADD CONSTRAINT CH_Appointments_patient_id CHECK (patient_id >=0 AND patient_id <= 9999999);
ALTER TABLE Appointments ADD CONSTRAINT CH_Appointments_coupon_number CHECK (coupon_number >=0 AND coupon_number <= 9999999);
ALTER TABLE Appointments ADD CONSTRAINT CH_Appointments_doctor_category CHECK (doctor_category >=0 AND doctor_category <= 9999999);

ALTER TABLE MedicalCards ADD CONSTRAINT CH_MedicalCards_med_card_id CHECK (med_card_id >=0 AND med_card_id <= 9999999);
ALTER TABLE MedicalCards ADD CONSTRAINT CH_MedicalCards_patient_id CHECK (patient_id >=0 AND patient_id <= 9999999);
ALTER TABLE MedicalCards ADD CONSTRAINT CH_MedicalCards_diagnosis_code CHECK (diagnosis_code >=0 AND diagnosis_code <= 9999999);
ALTER TABLE MedicalCards ADD CONSTRAINT CH_MedicalCards_appointment_id CHECK (appointment_id >=0 AND appointment_id <= 9999999);

ALTER TABLE MedicalRecordEntries ADD CONSTRAINT CH_MedicalRecordEntries_record_number CHECK (record_number >= 0 AND record_number <= 9999999);
ALTER TABLE MedicalRecordEntries ADD CONSTRAINT CH_MedicalRecordEntries_med_card_id CHECK (med_card_id >= 0 AND med_card_id <= 9999999);
ALTER TABLE MedicalRecordEntries ADD CONSTRAINT CH_MedicalRecordEntries_patient_id CHECK (patient_id >= 0 AND patient_id <= 9999999);
ALTER TABLE MedicalRecordEntries ADD CONSTRAINT CH_MedicalRecordEntries_diagnosis_code CHECK (diagnosis_code >= 0 AND diagnosis_code <= 9999999);



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
