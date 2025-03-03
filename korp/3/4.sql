Use hosp;

ALTER TABLE MedicalRecordEntries DROP CONSTRAINT FK_MED_CARD_ENTR_DIAGNOSIS_CODE;
DELETE FROM Diagnoses WHERE diagnosis_code = 2 AND diagnosis_name = 'Пневмония';
ALTER TABLE MedicalRecordEntries ADD CONSTRAINT FK_MED_CARD_ENTR_DIAGNOSIS_CODE FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code);

DELETE FROM MedicalRecordEntries WHERE diagnosis_code = 2 AND doctor_fio = 'Кузнецов К.К.';

DELETE FROM MedicalCards WHERE patient_id = 3 AND appointment_date < '2023-10-02' AND opening_date < '2023-10-02';

ALTER TABLE Appointments DROP CONSTRAINT FK_APP_DOCTOR_ID;
DELETE FROM Doctors WHERE category_number = 4;
ALTER TABLE Appointments ADD CONSTRAINT FK_APP_DOCTOR_ID FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id);