use hosp;
-- 1 scrypt
SELECT 
patient_fio AS 'ФИО Пациента' 
,patient_birthday AS 'ДР Пациента' 
FROM Patients
WHERE patient_address LIKE '%Ярославль%';
-- 2 scrypt



--SELECT patient_fio FROM Patients WHERE patient_address LIKE '%Ярославль%' and 
--(SELECT diagnosis_name FROM MedicalRecordEntries WHERE med_card_id = 
--(SELECT med_card_id FROM MedicalCards WHERE med_card_id NOT LIKE '-1'))));

SELECT p.patient_fio, me.diagnosis_name
FROM Patients p
JOIN MedicalCards mc ON p.patient_id = mc.patient_id
JOIN MedicalRecordEntries me ON mc.med_card_id = me.med_card_id
WHERE p.patient_address LIKE '%Ярославль%';

SELECT d.doctor_id, d.doctor_fio, SUM(a.visit_cost) AS total_earnings
FROM Doctors d
JOIN MedicalRecordEntries me ON d.doctor_id = me.doctor_id
JOIN MedicalCards mc ON me.med_card_id = mc.med_card_id
JOIN Appointments a ON mc.appointment_id = a.appointment_id
GROUP BY d.doctor_id, d.doctor_fio
HAVING SUM(a.visit_cost) > (
    SELECT AVG(total_earnings)
    FROM (
        SELECT SUM(visit_cost) AS total_earnings
        FROM Appointments
        GROUP BY appointment_id
    ) subq
);

SELECT p.patient_fio AS Пациент, m.diagnosis_name AS Диагноз
FROM Patients p
JOIN MedicalCards mc ON p.patient_id = mc.patient_id
JOIN MedicalRecordEntries m ON mc.med_card_id = m.med_card_id
WHERE m.doctor_id = (
    SELECT d.doctor_id FROM Doctors d WHERE d.doctor_fio = 'Кузнецов К.К.'
);