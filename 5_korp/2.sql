USE hosp;
GO

-- Удаляем представление если оно существует
IF EXISTS (SELECT * FROM sys.views WHERE name = 'General_View')
DROP VIEW General_View;
GO

-- Создаем общее представление без первичных ключей и идентификаторов
CREATE VIEW General_View AS
SELECT
    -- Данные пациентов
    p.patient_fio AS 'ФИО пациента',
    p.patient_birthday AS 'ДР Пациента',
    p.patient_gender AS 'Пол Пациента',
    p.service_discount AS 'Скидка',
    p.patient_address AS 'Адрес Пациента',
    
    -- Данные врачей
    d.doctor_fio AS 'ФИО Доктора',
    d.specialty AS 'Специальность',
    d.category_name AS 'Категория',
    d.price_per_visit AS 'Цена приема',
    
    -- Данные записей
    a.purpose AS 'Причина визита',
    a.appointment_date AS 'Дата посещения',
    a.coupon_number AS 'Номер талона',
    a.visit_cost AS 'Стоимость посещения',
    
    -- Медкарты
    mc.opening_date AS 'Дата открытия карты',
    
    -- Медицинские записи
    mre.diagnosis_name AS 'Диагноз'
FROM Patients p
LEFT JOIN MedicalCards mc ON p.patient_id = mc.patient_id
LEFT JOIN Appointments a ON mc.appointment_id = a.appointment_id
LEFT JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
LEFT JOIN Doctors d ON mre.doctor_id = d.doctor_id;
GO
SELECT * FROM General_View;