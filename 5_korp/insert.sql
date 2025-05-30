﻿Use hosp;
INSERT INTO Patients(patient_id, patient_fio, patient_birthday, patient_gender, service_discount, patient_address)
VALUES 
(0, 'Горбин', '2000-01-01', 'M', 200.50 , 'Рыбинск. Ул. Авдеева')
,(1, 'Стукачёв', '2000-02-02', 'M', 100.25 , 'Рыбинск. Ул. Гаванская')
,(2, 'Сишарпов', '2000-03-03', 'M', 195.50 , 'Рыбинск. Ул. Батова')
,(3, 'Иванов', '2000-04-04', 'M', 225.35 , 'Ярославль. Ул. Республиканская')
,(4, 'Носов', '2000-05-05', 'M', 115.75 , 'Ярославль. Ул. Пушкина')
,(5, 'Ремонтов', '2000-06-06', 'M', 200.15 , 'Ярославль Ул. Свободы')


INSERT INTO Doctors(doctor_id, doctor_fio, specialty, category_name, price_per_visit) 
VALUES
(0, 'Петров П.П.', 'Терапевт', 'Первая', 100),
(1, 'Сидорова С.С', 'Терапевт', 'Вторая', 110),
(2, 'Кузнецов К.К.', 'Пульмонолог', 'Третья', 120),
(3, 'Иванова И.И.', 'Эндокринолог', 'Четвёртая', 130),
(4, 'Морозов М.М.', 'Кардиолог', 'Пятая', 140),
(5, 'Тихонов Т.Т.', 'Аллерголог', 'Шестая', 150);

INSERT INTO Appointments(appointment_id, purpose, appointment_date, coupon_number, visit_cost) 
VALUES
(0, 'Консультация по гриппу', '2023-10-01', 12345, 300.00),
(1, 'Диагностика ОРВИ', '2023-10-02', 12346, 150.00),
(2, 'Лечение пневмонии', '2023-10-03', 12347, 400.00),
(3, 'Обследование диабета', '2023-10-04', 12348, 500.00),
(4, 'Консультация по гипертонии', '2023-10-05', 12349, 200.00),
(5, 'Обследование аллергии', '2023-10-06', 12350, 50.00);

INSERT INTO MedicalCards(med_card_id, patient_id, opening_date, appointment_id) 
VALUES
(0, 0, '2023-10-01', 0),
(1, 1, '2023-10-02', 1),
(2, 2, '2023-10-03', 2),
(3, 3, '2023-10-04', 3),
(4, 4, '2023-10-05', 4),
(5, 5, '2023-10-06', 5);

INSERT INTO MedicalRecordEntries(record_number, med_card_id, diagnosis_name, doctor_id) 
VALUES
(0, 0, 'Грипп', 0),
(1, 1, 'ОРВИ', 1),
(2, 2, 'Пневмония' , 2),
(3, 3,	'Диабет', 3),
(4, 4, 'Гипертония', 4),
(5, 5, 'Аллергия', 5)

-- Вывести список пациентов из Ярославля (ФИО и дату рождения)
-- Вывести список пациентов из Ярославля и поставленные им диагнозы
-- Вывести список всех врачей, получивших оплату выше средней
-- Вывести список пациентов, поступивших на прием к Кузнецову К.К. и поставленные им диагнозы
