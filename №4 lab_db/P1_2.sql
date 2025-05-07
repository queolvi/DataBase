USE hosp;

SELECT
    p.patient_id AS '���� ��������',
    p.patient_fio AS '��� ��������',
    p.patient_birthday AS '�� ��������',
    p.patient_gender AS '��� ��������',
    p.service_discount AS '������',
    p.patient_address AS '����� ��������',
    d.doctor_id AS '���� �������',
    d.doctor_fio AS '��� �������',
    d.specialty AS '�������������',
    d.category_name AS '�������� ���������',
    d.price_per_visit AS '���� �� ���������',
    a.appointment_id AS '���� ���������',
    a.purpose AS '������� ������',
    a.appointment_date AS '���� ���������',
    a.coupon_number AS '����� ������',
    a.visit_cost AS '��������� ���������',
    mc.med_card_id AS '���� ����������� �����',
    mc.opening_date AS '���� �������� ���. �����',
    mc_entr.record_number AS '����� ������',
    mc_entr.diagnosis_name AS '�������� ��������'
FROM Patients p, Appointments a, Doctors d, MedicalCards mc, MedicalRecordEntries mc_entr
WHERE 
    p.patient_id = a.patient_id AND
    a.doctor_id = d.doctor_id AND
    p.patient_id = mc.patient_id AND
    mc.med_card_id = mc_entr.med_card_id;