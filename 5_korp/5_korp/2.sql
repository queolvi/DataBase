USE hosp;
GO

-- ������� ������������� ���� ��� ����������
IF EXISTS (SELECT * FROM sys.views WHERE name = 'General_View')
DROP VIEW General_View;
GO

-- ������� ����� ������������� ��� ��������� ������ � ���������������
CREATE VIEW General_View AS
SELECT
    -- ������ ���������
    p.patient_fio AS '��� ��������',
    p.patient_birthday AS '�� ��������',
    p.patient_gender AS '��� ��������',
    p.service_discount AS '������',
    p.patient_address AS '����� ��������',
    
    -- ������ ������
    d.doctor_fio AS '��� �������',
    d.specialty AS '�������������',
    d.category_name AS '���������',
    d.price_per_visit AS '���� ������',
    
    -- ������ �������
    a.purpose AS '������� ������',
    a.appointment_date AS '���� ���������',
    a.coupon_number AS '����� ������',
    a.visit_cost AS '��������� ���������',
    
    -- ��������
    mc.opening_date AS '���� �������� �����',
    
    -- ����������� ������
    mre.diagnosis_name AS '�������'
FROM Patients p
LEFT JOIN MedicalCards mc ON p.patient_id = mc.patient_id
LEFT JOIN Appointments a ON mc.appointment_id = a.appointment_id
LEFT JOIN MedicalRecordEntries mre ON mc.med_card_id = mre.med_card_id
LEFT JOIN Doctors d ON mre.doctor_id = d.doctor_id;
GO
SELECT * FROM General_View;