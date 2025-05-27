use hosp;
DELETE FROM MedicalRecordEntries 
WHERE
record_number = 2 AND diagnosis_name = 'Пневмония';


DELETE mre
FROM MedicalRecordEntries mre
INNER JOIN Doctors d ON mre.doctor_id = d.doctor_id
WHERE d.doctor_fio = 'Кузнецов К.К.' and d.doctor_id = 2;


DELETE a
FROM Appointments a
INNER JOIN MedicalCards mc ON a.appointment_id = mc.appointment_id
WHERE mc.patient_id = 3 
AND a.appointment_date < '2023-10-02' 
AND mc.opening_date < '2023-10-02';

DELETE FROM MedicalCards
WHERE patient_id = 3 
AND opening_date < '2023-10-02';


DELETE FROM Doctors
WHERE
category_name = 'Четвёртая';

