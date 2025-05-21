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

