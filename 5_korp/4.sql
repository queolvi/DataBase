use hosp;

if not exists (
select * from sys.indexes 
where name = 'unique_patients_fio' and object_id = OBJECT_ID('Patients')
)
begin

create unique index unique_patients_fio
on Patients(patient_fio);
end

else 
begin
	print 'index (unique_patients_fio) already exists';
end

select * from patients;

exec sp_helpindex 'Patients';