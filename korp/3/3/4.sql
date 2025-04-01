Use hosp;


DELETE FROM MedicalRecordEntries WHERE diagnosis_name = 'Пневмония';

DELETE FROM MedicalCards WHERE patient_id = 3 AND opening_date < '2023-10-02';

DELETE FROM Doctors WHERE price_per_visit < 100;