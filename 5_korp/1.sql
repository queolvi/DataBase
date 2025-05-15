USE hosp;
GO

if exists (select * from sys.views where name = 'Patients_View')
drop view Patients_View ;
go 

CREATE VIEW Patients_View AS
SELECT
    patient_fio AS 'ФИО пациента',
    patient_birthday AS 'ДР Пациента',
    patient_gender AS 'Пол Пациента',
    service_discount  AS 'Скидка',
    patient_address AS 'Адрес Пациента'
FROM
    Patients;
GO

if exists (select * from sys.views where name = 'Doctors_View ')
drop view Doctors_View  ;
go 

GO
CREATE VIEW Doctors_View AS
SELECT

doctor_fio AS 'ФИО Доктора' ,
specialty AS 'Специальность' ,
category_name AS 'Название категории' ,
price_per_visit AS 'Цена за посещение' 
FROM
Doctors;
GO

if exists (select * from sys.views where name = 'Appointments_View')
drop view Appointments_View;
go 

Go
CREATE VIEW Appointments_View AS
SELECT
purpose AS 'Причина визита' ,
appointment_date AS 'Дата посещения' ,
coupon_number AS 'Номер талона' ,
visit_cost AS 'Стоимость посещения' 
FROM
Appointments;
GO

if exists (select * from sys.views where name = 'MedicalCards_View')
drop view MedicalCards_View;
go

GO
CREATE VIEW MedicalCards_View AS 
SELECT 
--patient id == ITS NOT PRIMARY KEY!!!
patient_id AS 'Айди пациента' ,
opening_date AS 'Дата открытия мед.какрты' ,
appointment_id AS 'Айди посещения' 
FROM
MedicalCards;
GO

if exists (select * from sys.views where name = 'MedicalRecordEntries_View ')
drop view MedicalRecordEntries_View ;
go

GO
CREATE VIEW MedicalRecordEntries_View AS 
SELECT
med_card_id AS 'Айди медицинской карты' ,
diagnosis_name AS 'Название диагноза' ,
doctor_id AS 'Айди Доктора' 
FROM MedicalRecordEntries;
GO

select * from Patients_View;
select * from Doctors_View;
select * from Appointments_View;
select * from MedicalCards_View;
select * from MedicalRecordEntries_View;

-- проверка
UPDATE Doctors_View 
SET [Цена за посещение] = [Цена за посещение] * 2 
WHERE [Специальность] LIKE 'Терапевт';

insert into Patients_View([ФИО пациента], [ДР Пациента], [Пол Пациента], [Скидка], [Адрес Пациента])
values
('Иван Ванечкин', '1990-02-02', 'М', 500.00, 'Москоу');

select * from Patients_View where [Скидка] = 500.00;
 


drop view Patients_View;
drop view Doctors_View;
drop view Appointments_View;
drop view MedicalCards_View;
drop view MedicalRecordEntries_View;