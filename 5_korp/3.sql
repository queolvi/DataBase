use hosp;
-- 1
if exists (select * from sys.views where name = 'diseasis_view ')
drop view diseasis_view   ;
go 

go
CREATE VIEW diseasis_view as
SELECT
diagnosis_name AS 'Название диагноза'
FROM MedicalRecordEntries;
go

select count(*) as 'Сколько всего диагнозов' from diseasis_view;
--

if exists (select * from sys.views where name = 'flu_diagnosis')
drop view flu_diagnosis;

go
create view flu_diagnosis as 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'Грипп';
go

select count(*) as 'Грипп' from flu_diagnosis;
--колво диагнозов с диагнозом Грипп

if exists (select * from sys.views where name = 'ARVI_diagnosis ')
drop view ARVI_diagnosis ;

go
create view ARVI_diagnosis as 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'ОРВИ';
go

select count(*) as 'ОРВИ' from ARVI_diagnosis ;
--колво диагнозов с диагнозом ОРВИ


if exists (select * from sys.views where name = 'Pneumonia_diagnosis ')
drop view Pneumonia_diagnosis  ;

go
create view Pneumonia_diagnosis as 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'Пневмония';
go

select count(*) as 'Пневмония' from Pneumonia_diagnosis ;
--колво диагнозов с диагнозом Пневмония



if exists (select * from sys.views where name = 'Diabetes_diagnosis ')
drop view Diabetes_diagnosis  ;

go
create view Diabetes_diagnosis as 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'Диабет';
go

select count(*) as 'Диабет' from Diabetes_diagnosis  ;
--колво диагнозов с диагнозом Диабет



if exists (select * from sys.views where name = 'Hypertension_diagnosis ')
drop view Hypertension_diagnosis  ;

go
create view Hypertension_diagnosis as 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'Гипертония';
go

select count(*) as 'Гипертония' from Hypertension_diagnosis;
--колво диагнозов с диагнозом Гипертония

if exists (select * from sys.views where name = 'Allergy_diagnosis')
drop view Allergy_diagnosis  ;

go
create view Allergy_diagnosis AS 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'Аллергия';
go

select count(*) as 'Аллергия' from Allergy_diagnosis;
--колво диагнозов с диагнозом Аллергия



--1