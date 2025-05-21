use hosp;


if exists (select * from sys.views where name = 'diseasis_view ')
drop view diseasis_view   ;
 
if exists (select * from sys.views where name = 'Allergy_diagnosis')
drop view Allergy_diagnosis  ;

if exists (select * from sys.views where name = 'Hypertension_diagnosis ')
drop view Hypertension_diagnosis  ;

if exists (select * from sys.views where name = 'Diabetes_diagnosis ')
drop view Diabetes_diagnosis  ;

if exists (select * from sys.views where name = 'Pneumonia_diagnosis ')
drop view Pneumonia_diagnosis  ;

if exists (select * from sys.views where name = 'ARVI_diagnosis ')
drop view ARVI_diagnosis ;

if exists (select * from sys.views where name = 'flu_diagnosis')
drop view flu_diagnosis;

go
CREATE VIEW diseasis_view as
SELECT
diagnosis_name AS 'Название диагноза'
FROM MedicalRecordEntries;
go

--

go
create view flu_diagnosis as 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'Грипп';
go

go
create view ARVI_diagnosis as 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'ОРВИ';
go

go
create view Pneumonia_diagnosis as 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'Пневмония';
go

go
create view Diabetes_diagnosis as 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'Диабет';
go

go
create view Hypertension_diagnosis as 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'Гипертония';
go

go
create view Allergy_diagnosis AS 
select
diagnosis_name AS 'Название диагноза'
from MedicalRecordEntries
where diagnosis_name like 'Аллергия';
go


select count(*) as 'Сколько всего диагнозов' from diseasis_view;

select count(*) as 'Грипп' from flu_diagnosis;
--колво диагнозов с диагнозом Грипп

select count(*) as 'ОРВИ' from ARVI_diagnosis ;
--колво диагнозов с диагнозом ОРВИ

select count(*) as 'Пневмония' from Pneumonia_diagnosis ;
--колво диагнозов с диагнозом Пневмония

select count(*) as 'Диабет' from Diabetes_diagnosis  ;
--колво диагнозов с диагнозом Диабет

select count(*) as 'Гипертония' from Hypertension_diagnosis;
--колво диагнозов с диагнозом Гипертония

select count(*) as 'Аллергия' from Allergy_diagnosis;
--колво диагнозов с диагнозом Аллергия

