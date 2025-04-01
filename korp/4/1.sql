use hosp;

SELECT
patient_id AS 'Айди Пациента',
patient_fio AS 'ФИО Пациента',
patient_birthday AS 'ДР Пациента' ,
patient_gender AS 'Пол Пациента' ,
service_discount AS 'Скидка на ' ,
patient_address AS '' 
FROM
Patients;

SELECT
doctor_id AS '' ,
doctor_fio AS '' ,
specialty AS '' ,
category_name AS '' ,
price_per_visit AS '' 
FROM
Doctors;

SELECT
appointment_id AS '' ,
purpose AS '' ,
appointment_date AS '' ,
coupon_number AS '' ,
visit_cost AS '' 
FROM
Appointments;

SELECT
med_card_id AS '' ,
patient_id AS '' ,
opening_date AS '' ,
appointment_id AS '' 
FROM
MedicalCards;

SELECT
record_number AS '' ,
med_card_id AS '' ,
diagnosis_name AS '' ,
doctor_id AS '' 
FROM MedicalRecordEntries;