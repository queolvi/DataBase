CREATE TABLE Patients(
patient_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
patient_fio VARCHAR(255) NOT NULL,
patient_birthday DATE NOT NULL,
patient_gender ENUM('M', 'F') NOT NULL,
service_discount DECIMAL(5,2)
);

CREATE TABLE MedicalCards(
med_card_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
patient_id INT UNSIGNED UNIQUE NOT NULL,
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Doctors(
doctor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
doctor_fio VARCHAR(255) NOT NULL,
specialty_id INT UNSIGNED NOT NULL,
FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id)
);

CREATE TABLE Specialties(
specialty_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
specialty VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Appointments(
appointment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
doctor_id INT UNSIGNED NOT NULL,
patient_id INT UNSIGNED NOT NULL,
purpose VARCHAR(255) NOT NULL,
purpose_date DATE,
coupon_number INT UNSIGNED,
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Diagnoses(
diagnosis_code INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
diagnosis_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Categories(
category_number INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(255) UNIQUE NOT NULL
);
