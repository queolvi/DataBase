use hosp;

SELECT
patient_id AS 'Айди Пациента',
patient_fio AS 'ФИО Пациента',
patient_birthday AS 'ДР Пациента' ,
patient_gender AS 'Пол Пациента' ,
service_discount AS 'Скидка' ,
patient_address AS 'Адрес пациента' 
FROM
Patients;

SELECT
doctor_id AS 'Айди Доктора' ,
doctor_fio AS 'ФИО Доктора' ,
specialty AS 'Специальность' ,
category_name AS 'Название категории' ,
price_per_visit AS 'Цена за посещение' 
FROM
Doctors;

SELECT
appointment_id AS 'Айди Посещения' ,
purpose AS 'Причина визита' ,
appointment_date AS 'Дата посещения' ,
coupon_number AS 'Номер талона' ,
visit_cost AS 'Стоимость посещения' 
FROM
Appointments;

SELECT
med_card_id AS 'Айди медицинской карты' ,
patient_id AS 'Айди пациента' ,
opening_date AS 'Дата открытия мед.какрты' ,
appointment_id AS 'Айди посещения' 
FROM
MedicalCards;

SELECT
record_number AS 'Номер записи' ,
med_card_id AS 'Айди медицинской карты' ,
diagnosis_name AS 'Название диагноза' ,
doctor_id AS 'Айди Доктора' 
FROM MedicalRecordEntries;