USE hosp;
SELECT
    p.patient_id AS 'Айди Пациента',
    p.patient_fio AS 'ФИО Пациента',
    p.patient_birthday AS 'ДР Пациента',
    p.patient_gender AS 'Пол Пациента',
    p.service_discount AS 'Скидка на',
    p.patient_address AS 'Адрес пациента',

    d.doctor_id AS 'Айди Доктора',
    d.doctor_fio AS 'ФИО Доктора',
    d.specialty AS 'Специальность',
    d.category_name AS 'Название категории',
    d.price_per_visit AS 'Цена за посещение',

    a.appointment_id AS 'Айди Посещения',
    a.purpose AS 'Причина визита',
    a.appointment_date AS 'Дата посещения',
    a.coupon_number AS 'Номер талона',
    a.visit_cost AS 'Стоимость посещения',

    mc.med_card_id AS 'Айди медицинской карты',
    mc.opening_date AS 'Дата открытия мед. карты',

    mc_entr.record_number AS 'Номер записи',
    mc_entr.diagnosis_name AS 'Название диагноза'
FROM Patients p
JOIN MedicalCards mc ON p.patient_id = mc.patient_id
JOIN Appointments a ON mc.appointment_id = a.appointment_id
JOIN MedicalRecordEntries mc_entr ON mc.med_card_id = mc_entr.med_card_id
JOIN Doctors d ON mc_entr.doctor_id = d.doctor_id;