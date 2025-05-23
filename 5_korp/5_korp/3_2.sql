use hosp;

if exists (select * from sys.views where name = 'doctor_Petrov ')
drop view doctor_Petrov ;
 
if exists (select * from sys.views where name = 'doctor_Sidorova')
drop view doctor_Sidorova;

if exists (select * from sys.views where name = 'doctor_Kuznetcov ')
drop view doctor_Kuznetcov  ;

if exists (select * from sys.views where name = 'doctor_Ivanova ')
drop view doctor_Ivanova  ;

if exists (select * from sys.views where name = 'doctor_Morozov ')
drop view doctor_Morozov  ;

if exists (select * from sys.views where name = 'doctor_Tikhonov ')
drop view doctor_Tikhonov ;


go
create view doctor_Petrov as
select
doctor_fio as 'ФИО Доктора'
from Doctors
where doctor_fio like '%Петров%';
go


go
create view doctor_Sidorova as
select
doctor_fio as 'ФИО Доктора' 
from Doctors
where doctor_fio like '%Сидорова%';
go

go
create view doctor_Kuznetcov as
select
doctor_fio as 'ФИО Доктора' 
from Doctors
where doctor_fio like '%Кузнецов%';
go

go
create view doctor_Ivanova as
select
doctor_fio as 'ФИО Доктора' 
from Doctors
where doctor_fio like '%Иванова%';
go

go
create view doctor_Morozov as
select
doctor_fio as 'ФИО Доктора' 
from Doctors
where doctor_fio like '%Морозов%';
go

go
create view doctor_Tikhonov as
select
doctor_fio as 'ФИО Доктора' 
from Doctors
where doctor_fio like '%Тихонов%';
go

--select doctor_fio as 'Доктор Петров' from doctor_Petrov  join Patients p on p.patient_fio = (SELECT patient_fio from Patients where patient_fio LIKE '%Горбин%' and patient_id = (SELECT doctor_id from Doctors where doctor_id = patient_id));

SELECT 
    dp.[ФИО Доктора] AS 'Доктор Петров',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
     AND p.patient_fio LIKE '%Горбин%') AS 'Пациент Горбин'
FROM 
    doctor_Petrov dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
    AND p.patient_fio LIKE '%Горбин%'
);
--
SELECT 
    dp.[ФИО Доктора] AS 'Доктор Сидорова',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
     AND p.patient_fio LIKE '%Стукачёв%') AS 'Пациент Стукачёв'
FROM 
    doctor_Sidorova dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
    AND p.patient_fio LIKE '%Стукачёв%'
);
--
SELECT 
    dp.[ФИО Доктора] AS 'Доктор Кузнецов',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
     AND p.patient_fio LIKE '%Сишарпов%') AS 'Пациент Сишарпов'
FROM 
    doctor_Kuznetcov dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
    AND p.patient_fio LIKE '%Сишарпов%'
);
--
SELECT 
    dp.[ФИО Доктора] AS 'Доктор Иванова',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
     AND p.patient_fio LIKE '%Иванов%') AS 'Пациент Иванов'
FROM 
    doctor_Ivanova dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
    AND p.patient_fio LIKE '%Иванов%'
);
--

SELECT 
    dp.[ФИО Доктора] AS 'Доктор Морозов',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
     AND p.patient_fio LIKE '%Носов%') AS 'Пациент Носов'
FROM 
    doctor_Morozov dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
    AND p.patient_fio LIKE '%Носов%'
);
--
SELECT 
    dp.[ФИО Доктора] AS 'Доктор Тихонов',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
     AND p.patient_fio LIKE '%Ремонтов%') AS 'Пациент Ремонтов'
FROM 
    doctor_Tikhonov dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[ФИО Доктора])
    AND p.patient_fio LIKE '%Ремонтов%'
);
