Use hosp;

CREATE TABLE Patients(
patient_id INT NOT NULL PRIMARY KEY CHECK(patient_id >=0 AND patient_id <= 9999999),
patient_fio VARCHAR(255),
patient_birthday DATE,
patient_gender varchar(1) CHECK (patient_gender IN('M', 'F')) DEFAULT 'M',
service_discount DECIMAL(5,2),
patient_address VARCHAR(255)
);

CREATE TABLE Specialties(
specialty_id INT NOT NULL PRIMARY KEY CHECK (specialty_id >=0 AND specialty_id <= 9999999),
specialty VARCHAR(255)
);

CREATE TABLE Categories(
category_number INT NOT NULL PRIMARY KEY CHECK (category_number >=0 AND category_number <= 9999999),
category_name VARCHAR(255),
price_per_visit DECIMAL(10,2)
);

CREATE TABLE Diagnoses(
diagnosis_code INT NOT NULL PRIMARY KEY CHECK (diagnosis_code >= 0 AND diagnosis_code <= 9999999),
diagnosis_name VARCHAR(255)
);

CREATE TABLE Doctors(
doctor_id INT NOT NULL PRIMARY KEY CHECK (doctor_id >=0 AND doctor_id <= 9999999),
doctor_fio VARCHAR(255),
specialty_id INT NOT NULL CHECK (specialty_id >=0 AND specialty_id <= 9999999),
category_number INT NOT NULL CHECK (category_number >=0 AND category_number <= 9999999),
CONSTRAINT FK_DOCTORS_SPECIALTY_ID FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id),
CONSTRAINT FK_DOCTORS_CATEGORY_NUMBER FOREIGN KEY (category_number) REFERENCES Categories(category_number)
);

CREATE TABLE Appointments(
appointment_id INT NOT NULL PRIMARY KEY CHECK (appointment_id >=0 AND appointment_id <= 9999999),
doctor_id INT NOT NULL CHECK (doctor_id >=0 AND doctor_id <= 9999999),
patient_id INT NOT NULL CHECK (patient_id >=0 AND patient_id <= 9999999),
purpose VARCHAR(255),
appointment_date DATE,
coupon_number INT NOT NULL CHECK (coupon_number >=0 AND coupon_number <= 9999999),
visit_cost DECIMAL(10,2),
doctor_category INT NOT NULL CHECK (doctor_category >=0 AND doctor_category <= 9999999),
CONSTRAINT FK_APP_DOCTOR_ID FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
CONSTRAINT FK_APP_PATIENT_ID FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)

);

CREATE TABLE MedicalCards(
med_card_id INT NOT NULL PRIMARY KEY,
patient_id INT NOT NULL CHECK (patient_id >=0 AND patient_id <= 9999999),
appointment_date DATE,
opening_date DATE,
diagnosis_code INT NOT NULL CHECK (diagnosis_code >=0 AND diagnosis_code <= 9999999),
appointment_id INT NOT NULL CHECK (appointment_id >=0 AND appointment_id <= 9999999),
CONSTRAINT FK_MED_CARD_PATIENT_ID FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
CONSTRAINT FK_MED_CARD_DIAGNOSIS_CODE FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code),
CONSTRAINT FK_MED_CARD_APPOINTMENT_ID FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE MedicalRecordEntries(
record_number INT NOT NULL PRIMARY KEY,
med_card_id INT NOT NULL CHECK (med_card_id >=0 AND med_card_id <= 9999999),
patient_id INT NOT NULL CHECK (patient_id >=0 AND patient_id <= 9999999),
diagnosis_code INT NOT NULL CHECK (diagnosis_code >=0 AND diagnosis_code <= 9999999),
doctor_fio VARCHAR(255),
 CONSTRAINT FK_MED_CARD_ENTR_MED_CARD_ID FOREIGN KEY (med_card_id) REFERENCES MedicalCards(med_card_id),
 CONSTRAINT FK_MED_CARD_ENTR_PATIENT_ID FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
 CONSTRAINT FK_MED_CARD_ENTR_DIAGNOSIS_CODE FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code)
);
