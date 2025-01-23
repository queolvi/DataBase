CREATE TABLE Patients(
patient_id INT CHECK(patient_id >=0 AND patient_id <= 9999999),
patient_fio VARCHAR(255),
patient_birthday DATE,
patient_gender varchar(1) CHECK (patient_gender IN('M', 'F')) DEFAULT 'M',
service_discount DECIMAL(5,2),
patient_address VARCHAR(255)
);

CREATE TABLE Specialties(
specialty_id INT CHECK(specialty_id >=0 AND specialty_id <= 9999999),
specialty VARCHAR(255)
);

CREATE TABLE Categories(
category_number INT CHECK(category_number>=0 AND category_number<= 9999999),
category_name VARCHAR(255),
price_per_visit DECIMAL(10,2)
);

CREATE TABLE Diagnoses(
diagnosis_code INT CHECK(diagnosis_code >=0 AND diagnosis_code <= 9999999),
diagnosis_name VARCHAR(255)
);

CREATE TABLE Doctors(
doctor_id INT CHECK(doctor_id >=0 AND doctor_id <= 9999999),
doctor_fio VARCHAR(255),
specialty_id INT CHECK(specialty_id >=0 AND specialty_id <= 9999999),
category_number INT CHECK (category_number >=0 AND category_number <= 9999999)
);

CREATE TABLE Appointments(
appointment_id INT CHECK(appointment_id  >=0 AND appointment_id  <= 9999999),
doctor_id INT CHECK(doctor_id >=0 AND doctor_id <= 9999999),
patient_id INT CHECK(patient_id >=0 AND patient_id <= 9999999),
purpose VARCHAR(255),
appointment_date DATE,
coupon_number INT CHECK(coupon_number >=0 AND coupon_number <= 9999999),
visit_cost DECIMAL(10,2),
doctor_category INT CHECK(doctor_category >=0 AND doctor_category <= 9999999)
);

CREATE TABLE MedicalCards(
med_card_id INT CHECK(med_card_id  >=0 AND med_card_id  <= 9999999),
patient_id INT CHECK(patient_id >=0 AND patient_id <= 9999999),
appointment_date DATE,
opening_date DATE,
diagnosis_code INT CHECK(diagnosis_code >=0 AND diagnosis_code <= 9999999),
appointment_id INT CHECK(appointment_id >=0 AND appointment_id <= 9999999)
);

CREATE TABLE MedicalRecordEntries(
record_number INT CHECK(record_number >=0 AND record_number <= 9999999),
med_card_id INT CHECK(med_card_id >=0 AND med_card_id <= 9999999),
patient_id INT CHECK(med_card_id >=0 AND med_card_id <= 9999999),
diagnosis_code INT CHECK(med_card_id >=0 AND med_card_id <= 9999999),
doctor_fio VARCHAR(255)
);

