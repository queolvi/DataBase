SELECT 
    patient_fio AS '��� ��������',
    patient_birthday AS '�� ��������',
    NULL AS '�������� ��������'
FROM 
    Patients
WHERE 
    patient_address LIKE '%���������%'

UNION ALL

SELECT 
    NULL AS '��� ��������',
    NULL AS '�� ��������',
    diagnosis_name AS '�������� ��������'
FROM 
    MedicalRecordEntries
WHERE 
    doctor_id >= 0 AND doctor_id <= 5;