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
FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id),
FOREIGN KEY (category_number) REFERENCES Categories(category_number)
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
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)

);

CREATE TABLE MedicalCards(
med_card_id INT NOT NULL PRIMARY KEY,
patient_id INT NOT NULL CHECK (patient_id >=0 AND patient_id <= 9999999),
appointment_date DATE,
opening_date DATE,
diagnosis_code INT NOT NULL CHECK (diagnosis_code >=0 AND diagnosis_code <= 9999999),
appointment_id INT NOT NULL CHECK (appointment_id >=0 AND appointment_id <= 9999999),
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code),
FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE MedicalRecordEntries(
record_number INT NOT NULL PRIMARY KEY,
med_card_id INT NOT NULL CHECK (med_card_id >=0 AND med_card_id <= 9999999),
patient_id INT NOT NULL CHECK (patient_id >=0 AND patient_id <= 9999999),
diagnosis_code INT NOT NULL CHECK (diagnosis_code >=0 AND diagnosis_code <= 9999999),
doctor_fio VARCHAR(255),
 FOREIGN KEY (med_card_id) REFERENCES MedicalCards(med_card_id),
 FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
 FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code)
);
