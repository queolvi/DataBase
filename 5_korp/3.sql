use hosp;
-- 1
if exists (select * from sys.views where name = 'diseasis_view ')
drop view diseasis_view   ;
go 

go
CREATE VIEW diseasis_view as
SELECT
diagnosis_name AS '�������� ��������'
FROM MedicalRecordEntries;
go

select count(*) as '������� ����� ���������' from diseasis_view;
--

if exists (select * from sys.views where name = 'flu_diagnosis')
drop view flu_diagnosis;

go
create view flu_diagnosis as 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '�����';
go

select count(*) as '�����' from flu_diagnosis;
--����� ��������� � ��������� �����

if exists (select * from sys.views where name = 'ARVI_diagnosis ')
drop view ARVI_diagnosis ;

go
create view ARVI_diagnosis as 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '����';
go

select count(*) as '����' from ARVI_diagnosis ;
--����� ��������� � ��������� ����


if exists (select * from sys.views where name = 'Pneumonia_diagnosis ')
drop view Pneumonia_diagnosis  ;

go
create view Pneumonia_diagnosis as 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '���������';
go

select count(*) as '���������' from Pneumonia_diagnosis ;
--����� ��������� � ��������� ���������



if exists (select * from sys.views where name = 'Diabetes_diagnosis ')
drop view Diabetes_diagnosis  ;

go
create view Diabetes_diagnosis as 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '������';
go

select count(*) as '������' from Diabetes_diagnosis  ;
--����� ��������� � ��������� ������



if exists (select * from sys.views where name = 'Hypertension_diagnosis ')
drop view Hypertension_diagnosis  ;

go
create view Hypertension_diagnosis as 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '����������';
go

select count(*) as '����������' from Hypertension_diagnosis;
--����� ��������� � ��������� ����������

if exists (select * from sys.views where name = 'Allergy_diagnosis')
drop view Allergy_diagnosis  ;

go
create view Allergy_diagnosis AS 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '��������';
go

select count(*) as '��������' from Allergy_diagnosis;
--����� ��������� � ��������� ��������



--1