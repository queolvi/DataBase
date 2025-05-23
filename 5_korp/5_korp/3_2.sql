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
doctor_fio as '��� �������'
from Doctors
where doctor_fio like '%������%';
go


go
create view doctor_Sidorova as
select
doctor_fio as '��� �������' 
from Doctors
where doctor_fio like '%��������%';
go

go
create view doctor_Kuznetcov as
select
doctor_fio as '��� �������' 
from Doctors
where doctor_fio like '%��������%';
go

go
create view doctor_Ivanova as
select
doctor_fio as '��� �������' 
from Doctors
where doctor_fio like '%�������%';
go

go
create view doctor_Morozov as
select
doctor_fio as '��� �������' 
from Doctors
where doctor_fio like '%�������%';
go

go
create view doctor_Tikhonov as
select
doctor_fio as '��� �������' 
from Doctors
where doctor_fio like '%�������%';
go

--select doctor_fio as '������ ������' from doctor_Petrov  join Patients p on p.patient_fio = (SELECT patient_fio from Patients where patient_fio LIKE '%������%' and patient_id = (SELECT doctor_id from Doctors where doctor_id = patient_id));

SELECT 
    dp.[��� �������] AS '������ ������',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
     AND p.patient_fio LIKE '%������%') AS '������� ������'
FROM 
    doctor_Petrov dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
    AND p.patient_fio LIKE '%������%'
);
--
SELECT 
    dp.[��� �������] AS '������ ��������',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
     AND p.patient_fio LIKE '%��������%') AS '������� ��������'
FROM 
    doctor_Sidorova dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
    AND p.patient_fio LIKE '%��������%'
);
--
SELECT 
    dp.[��� �������] AS '������ ��������',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
     AND p.patient_fio LIKE '%��������%') AS '������� ��������'
FROM 
    doctor_Kuznetcov dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
    AND p.patient_fio LIKE '%��������%'
);
--
SELECT 
    dp.[��� �������] AS '������ �������',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
     AND p.patient_fio LIKE '%������%') AS '������� ������'
FROM 
    doctor_Ivanova dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
    AND p.patient_fio LIKE '%������%'
);
--

SELECT 
    dp.[��� �������] AS '������ �������',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
     AND p.patient_fio LIKE '%�����%') AS '������� �����'
FROM 
    doctor_Morozov dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
    AND p.patient_fio LIKE '%�����%'
);
--
SELECT 
    dp.[��� �������] AS '������ �������',
    (SELECT p.patient_fio 
     FROM Patients p
     JOIN MedicalCards mc ON p.patient_id = mc.patient_id
     JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
     WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
     AND p.patient_fio LIKE '%��������%') AS '������� ��������'
FROM 
    doctor_Tikhonov dp
WHERE EXISTS (
    SELECT 1
    FROM Patients p
    JOIN MedicalCards mc ON p.patient_id = mc.patient_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = (SELECT doctor_id FROM Doctors WHERE doctor_fio = dp.[��� �������])
    AND p.patient_fio LIKE '%��������%'
);
