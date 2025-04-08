use hosp;
-- 1 scrypt
SELECT 
patient_fio AS 'ФИО Пациента' 
,patient_birthday AS 'ДР Пациента' 
FROM Patients
WHERE patient_address LIKE '%Ярославль%';
-- 2 scrypt

SELECT 
patient_fio AS 'ФИО Пациента' 
,patient_birthday AS 'ДР Пациента' 
FROM Patients
WHERE patient_address LIKE '%Ярославль%';
SELECT 
diagnosis_name AS 'Название диагноза '
FROM MedicalRecordEntries
WHERE doctor_id >= 0 and doctor_id <= 5;
