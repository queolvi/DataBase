use hosp;
-

if exists (select * from sys.views where name = 'diseasis_view ')
drop view diseasis_view   ;

if exists (select * from sys.views where name = 'flu_diagnosis')
drop view flu_diagnosis;


if exists (select * from sys.views where name = 'ARVI_diagnosis ')
drop view ARVI_diagnosis ;

if exists (select * from sys.views where name = 'Pneumonia_diagnosis ')
drop view Pneumonia_diagnosis  ;

if exists (select * from sys.views where name = 'Diabetes_diagnosis ')
drop view Diabetes_diagnosis  ;

if exists (select * from sys.views where name = 'Hypertension_diagnosis ')
drop view Hypertension_diagnosis  ;

if exists (select * from sys.views where name = 'Allergy_diagnosis')
drop view Allergy_diagnosis  ;

go 

go
CREATE VIEW diseasis_view as
SELECT
diagnosis_name AS '�������� ��������'
FROM MedicalRecordEntries;
go

go
create view flu_diagnosis as 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '�����';
go

go
create view ARVI_diagnosis as 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '����';
go

go
create view Pneumonia_diagnosis as 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '���������';
go

go
create view Diabetes_diagnosis as 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '������';
go

go
create view Hypertension_diagnosis as 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '����������';
go

go
create view Allergy_diagnosis AS 
select
diagnosis_name AS '�������� ��������'
from MedicalRecordEntries
where diagnosis_name like '��������';
go


select count(*) as '������� ����� ���������' from diseasis_view;

select count(*) as '�����' from flu_diagnosis;
--����� ��������� � ��������� �����

select count(*) as '����' from ARVI_diagnosis ;
--����� ��������� � ��������� ����

select count(*) as '���������' from Pneumonia_diagnosis ;
--����� ��������� � ��������� ���������

select count(*) as '������' from Diabetes_diagnosis  ;
--����� ��������� � ��������� ������

select count(*) as '����������' from Hypertension_diagnosis;
--����� ��������� � ��������� ����������

select count(*) as '��������' from Allergy_diagnosis;
--����� ��������� � ��������� ��������