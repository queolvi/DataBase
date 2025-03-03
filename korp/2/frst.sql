CREATE TABLE Patients(
patient_id INT NOT NULL,
patient_fio VARCHAR(255),
patient_birthday DATE,
patient_gender varchar(1) CHECK (patient_gender IN('M', 'F')) DEFAULT 'M',
service_discount DECIMAL(5,2),
patient_address VARCHAR(255)
);

CREATE TABLE Specialties(
specialty_id INT NOT NULL,
specialty VARCHAR(255)
);

CREATE TABLE Categories(
category_number INT NOT NULL,
category_name VARCHAR(255),
price_per_visit DECIMAL(10,2)
);

CREATE TABLE Diagnoses(
diagnosis_code INT NOT NULL,
diagnosis_name VARCHAR(255)
);

CREATE TABLE Doctors(
doctor_id INT NOT NULL,
doctor_fio VARCHAR(255),
specialty_id INT NOT NULL,
category_number INT NOT NULL
);

CREATE TABLE Appointments(
appointment_id INT NOT NULL,
doctor_id INT NOT NULL,
patient_id INT NOT NULL,
purpose VARCHAR(255),
appointment_date DATE,
coupon_number INT NOT NULL,
visit_cost DECIMAL(10,2),
doctor_category INT NOT NULL
);

CREATE TABLE MedicalCards(
med_card_id INT NOT NULL,
patient_id INT NOT NULL,
appointment_date DATE,
opening_date DATE,
diagnosis_code INT NOT NULL,
appointment_id INT NOT NULL
);

CREATE TABLE MedicalRecordEntries(
record_number INT NOT NULL,
med_card_id INT NOT NULL,
patient_id INT NOT NULL,
diagnosis_code INT NOT NULL,
doctor_fio VARCHAR(255)
);
