DELETE FROM Diagnoses 
WHERE
diagnosis_code = 2 AND diagnosis_name = 'Ïíåâìîíèÿ';

DELETE FROM MedicalRecordEntries 
WHERE 
diagnosis_code = 2 AND doctor_fio = 'Êóçíåöîâ Ê.Ê.';

DELETE FROM MedicalCards
WHERE
patient_id = 3 AND appointment_date < '2023-10-02' AND opening_date < '2023-10-02';

DELETE FROM Doctors
WHERE
category_number = 4;
https://habr.com/ru/articles/738428/
