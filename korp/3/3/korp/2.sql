use hosp;
-- 1 scrypt
SELECT 
patient_fio AS 'ФИО Пациента' 
,patient_birthday AS 'ДР Пациента' 
FROM Patients
WHERE patient_address LIKE '%Ярославль%';
-- 2 scrypt
-- надо написать так, что бы возвращало все найденные значения для айди пациентов 
-- типо FROM Patients WHERE patient_id IN ('0', '1', '2', '3', '4', '5'))) = med_card_id будет ошибка, а если будет один аргумент - запрос выполнится корректно

--SELECT med_card_id AS 'Айди Мед.Карты' FROM MedicalCards WHERE 
--(SELECT med_card_id AS 'Айди Мед.Карты' 
--FROM MedicalRecordEntries 
--WHERE med_card_id =
--(SELECT patient_id AS 'Айди Пациента' FROM Patients WHERE patient_id IN ('0', '1', '2', '3', '4', '5'))) = med_card_id;

SELECT p.fio, S.diagnosis_name FROM(SELECT r.record_number, r.diagnosis_name, m.patient_id FROM MedicalRecordEntries r, MedicalCards m WHERE m.med_card_id = r.med_card_id) AS S, 
Patients p WHERE p.patient_id = S.patient_id));

Patients p;
MedicalRecordEntries S; 
MedicalRecordEntries r;
MedicalCards m;
