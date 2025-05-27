Use hosp;

UPDATE Appointments
SET visit_cost = visit_cost * 1.1
WHERE appointment_id IN (
    SELECT app.appointment_id
    FROM Appointments app
    JOIN MedicalCards mc ON app.appointment_id = mc.appointment_id
    JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
    WHERE mre.doctor_id = 1
);

UPDATE Patients
SET service_discount = service_discount - service_discount * 0.015
WHERE patient_birthday < '2000-04-04';

UPDATE Patients
SET service_discount = service_discount - service_discount * 0.1
WHERE patient_address NOT LIKE '%Ярославль%';

