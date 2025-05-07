Use hosp;
DROP TABLE IF EXISTS MedicalRecordEntries;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS MedicalCards;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Diagnoses;
DROP TABLE IF EXISTS Specialties;


CREATE TABLE Patients(
patient_id INT NOT NULL PRIMARY KEY CHECK(patient_id >=0 AND patient_id <= 9999999),
patient_fio VARCHAR(255),
patient_birthday DATE,
patient_gender varchar(1) CHECK (patient_gender IN('M', 'F')) DEFAULT 'M',
service_discount DECIMAL(5,2),
patient_address VARCHAR(255)
);

CREATE TABLE Doctors(
doctor_id INT NOT NULL PRIMARY KEY CHECK (doctor_id >=0 AND doctor_id <= 9999999),
doctor_fio VARCHAR(255),
specialty VARCHAR(255),
category_name VARCHAR(255),
price_per_visit DECIMAL(10,2)
);

CREATE TABLE Appointments(
appointment_id INT NOT NULL PRIMARY KEY CHECK (appointment_id >=0 AND appointment_id <= 9999999),
purpose VARCHAR(255),
appointment_date DATE,
coupon_number INT NOT NULL CHECK (coupon_number >=0 AND coupon_number <= 9999999),
visit_cost DECIMAL(10,2)
);

CREATE TABLE MedicalCards(
med_card_id INT NOT NULL PRIMARY KEY,
patient_id INT NOT NULL CHECK (patient_id >=0 AND patient_id <= 9999999),
opening_date DATE,
appointment_id INT NOT NULL,
CONSTRAINT FK_MED_CARD_PATIENT_ID FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_MED_CARD_APPOINTMENT_ID FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MedicalRecordEntries(
record_number INT NOT NULL PRIMARY KEY,
med_card_id INT NOT NULL CHECK (med_card_id >=0 AND med_card_id <= 9999999),
diagnosis_name VARCHAR(255),
doctor_id INT NOT NULL,
CONSTRAINT FK_MED_CARD_ENTR_MED_CARD_ID FOREIGN KEY (med_card_id) REFERENCES MedicalCards(med_card_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_MED_CARD_ENTR_DOCTOR_ID FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE ON UPDATE CASCADE
);
