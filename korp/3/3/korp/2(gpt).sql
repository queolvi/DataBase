SELECT 
    patient_fio AS 'ФИО Пациента',
    patient_birthday AS 'ДР Пациента',
    NULL AS 'Название диагноза'
FROM 
    Patients
WHERE 
    patient_address LIKE '%Ярославль%'

UNION ALL

SELECT 
    NULL AS 'ФИО Пациента',
    NULL AS 'ДР Пациента',
    diagnosis_name AS 'Название диагноза'
FROM 
    MedicalRecordEntries
WHERE 
    doctor_id >= 0 AND doctor_id <= 5;