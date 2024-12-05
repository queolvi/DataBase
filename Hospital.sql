CREATE TABLE Patients(
patient_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
patient_fio VARCHAR(255) NOT NULL,
patient_birthday DATE NOT NULL,
patient_gender ENUM('M', 'F') NOT NULL,
service_discount DECIMAL(5,2),
patient_address VARCHAR(255)
);

CREATE TABLE Specialties(
specialty_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
specialty VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Categories(
category_number INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(255) UNIQUE NOT NULL,
price_per_visit DECIMAL(10,2)
);

CREATE TABLE Diagnoses(
diagnosis_code INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
diagnosis_name VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE Doctors(
doctor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
doctor_fio VARCHAR(255) NOT NULL,
specialty_id INT UNSIGNED NOT NULL,
category_number INT UNSIGNED NOT NULL, 
FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id),
FOREIGN KEY (category_number) REFERENCES Categories(category_number)
);

CREATE TABLE MedicalCards(
med_card_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
patient_id INT UNSIGNED UNIQUE NOT NULL,
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Appointments(
appointment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
doctor_id INT UNSIGNED NOT NULL,
patient_id INT UNSIGNED NOT NULL,
purpose VARCHAR(255) NOT NULL,
purpose_date DATE NOT NULL,
coupon_number INT UNSIGNED NOT NULL, 
visit_cost DECIMAL(10,2) NOT NULL,   
doctor_category INT UNSIGNED NOT NULL,
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY (doctor_category) REFERENCES Categories(category_number)
);


CREATE TABLE DoctorDiagnoses( 
doctor_id INT UNSIGNED NOT NULL,
diagnosis_code INT UNSIGNED NOT NULL,
PRIMARY KEY (doctor_id, diagnosis_code),
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code)
);

CREATE TABLE MedicalCardDiagnoses( 
med_card_id INT UNSIGNED NOT NULL,
diagnosis_code INT UNSIGNED NOT NULL,
PRIMARY KEY (med_card_id, diagnosis_code),
FOREIGN KEY (med_card_id) REFERENCES MedicalCards(med_card_id),
FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code)
);
