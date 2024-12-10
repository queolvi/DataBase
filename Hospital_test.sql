-- удаление таблиц, если они существуют
DROP TABLE IF EXISTS MedicalCardDiagnoses;
DROP TABLE IF EXISTS DoctorDiagnoses;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS MedicalCards;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Diagnoses;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Specialties;
DROP TABLE IF EXISTS Patients;


-- создание таблиц
CREATE TABLE IF NOT EXISTS Patients(
patient_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,    
patient_fio VARCHAR(255) NOT NULL,
patient_birthday DATE NOT NULL,
patient_gender ENUM('M', 'F') NOT NULL,
service_discount DECIMAL(5,2),
patient_address VARCHAR(255) /* NOT NULL maybe?*/
);

CREATE TABLE IF NOT EXISTS Specialties(
specialty_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
specialty VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Categories(
category_number INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(255) UNIQUE NOT NULL,
price_per_visit DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Diagnoses(
diagnosis_code INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
diagnosis_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Doctors(
doctor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
doctor_fio VARCHAR(255) NOT NULL,
specialty_id INT UNSIGNED NOT NULL,
category_number INT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS MedicalCards(
med_card_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
patient_id INT UNSIGNED UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Appointments(
appointment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
doctor_id INT UNSIGNED NOT NULL,
patient_id INT UNSIGNED NOT NULL,
purpose VARCHAR(255) NOT NULL,
purpose_date DATE NOT NULL,
coupon_number INT UNSIGNED NOT NULL,
visit_cost DECIMAL(10,2) NOT NULL,
doctor_category INT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS DoctorDiagnoses(
doctor_id INT UNSIGNED NOT NULL,
diagnosis_code INT UNSIGNED NOT NULL,
PRIMARY KEY (doctor_id, diagnosis_code)
);

CREATE TABLE IF NOT EXISTS MedicalCardDiagnoses(
med_card_id INT UNSIGNED NOT NULL,
diagnosis_code INT UNSIGNED NOT NULL,
PRIMARY KEY (med_card_id, diagnosis_code)
);


-- создание внешних ключей
ALTER TABLE Doctors ADD CONSTRAINT fk_doctors_specialties FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id);
ALTER TABLE Doctors ADD CONSTRAINT fk_doctors_categories FOREIGN KEY (category_number) REFERENCES Categories(category_number);
ALTER TABLE MedicalCards ADD CONSTRAINT fk_medicalcards_patients FOREIGN KEY (patient_id) REFERENCES Patients(patient_id);
ALTER TABLE Appointments ADD CONSTRAINT fk_appointments_doctors FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id);
ALTER TABLE Appointments ADD CONSTRAINT fk_appointments_patients FOREIGN KEY (patient_id) REFERENCES Patients(patient_id);
ALTER TABLE Appointments ADD CONSTRAINT fk_appointments_categories FOREIGN KEY (doctor_category) REFERENCES Categories(category_number);
ALTER TABLE DoctorDiagnoses ADD CONSTRAINT fk_doctordiagnoses_doctors FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id);
ALTER TABLE DoctorDiagnoses ADD CONSTRAINT fk_doctordiagnoses_diagnoses FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code);
ALTER TABLE MedicalCardDiagnoses ADD CONSTRAINT fk_medicalcarddiagnoses_medicalcards FOREIGN KEY (med_card_id) REFERENCES MedicalCards(med_card_id);
ALTER TABLE MedicalCardDiagnoses ADD CONSTRAINT fk_medicalcarddiagnoses_diagnoses FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code);


-- триггер
DELIMITER //
CREATE TRIGGER calculate_visit_cost
BEFORE INSERT ON Appointments
FOR EACH ROW
BEGIN
SET NEW.visit_cost = (SELECT price_per_visit FROM Categories WHERE category_number = NEW.doctor_category);
END //
DELIMITER ;
--  вставка данных
INSERT IGNORE INTO Patients(patient_fio, patient_birthday, patient_gender, service_discount, patient_address) VALUES
('Иванов Иван Иванович', '1980-05-15', 'M', 0.00, 'ул. Ленина, 10'),
('Петрова Анна Сергеевна', '1992-11-20', 'F', 0.10, 'пр. Мира, 5'),
('Сидоров Петр Алексеев', '1975-03-08', 'M', 0.00, 'ул. Кирова, 25');

INSERT IGNORE INTO Specialties(specialty) VALUES
('Терапия'),
('Хирургия'),
('Кардиология');

INSERT IGNORE INTO Categories(category_name, price_per_visit) VALUES
('Высшая', 2000.00),
('Первая', 1500.00),
('Вторая', 1000.00);

INSERT IGNORE INTO Diagnoses(diagnosis_name) VALUES
('ОРВИ'),
('Гипертония'),
('Аппендицит');

INSERT IGNORE INTO Doctors(doctor_fio, specialty_id, category_number) VALUES
('Кузнецов Сергей', 1, 1),
('Смирнова Ольга', 2, 2),
('Алексеев Дмитрий', 3, 1);

INSERT IGNORE INTO MedicalCards(patient_id) VALUES
(1), (2), (3);

INSERT IGNORE INTO Appointments(doctor_id, patient_id, purpose, purpose_date, coupon_number, doctor_category) VALUES
(1, 1, 'Консультация', '2024-03-08', 1, 1),
(2, 2, 'Обследование', '2024-03-10', 2, 2),
(3, 3, 'Лечение', '2024-03-15', 3, 1);

INSERT IGNORE INTO DoctorDiagnoses(doctor_id, diagnosis_code) VALUES
(1,1), (2,2), (3,3);

INSERT IGNORE INTO MedicalCardDiagnoses(med_card_id, diagnosis_code) VALUES
(1,1), (2,2), (3,3);
 
SHOW TABLES; -- вывод всех таблиц

-- вывод всех данных из таблиц

SELECT * FROM Patients; 
SELECT * FROM Specialties;
SELECT * FROM Categories;
SELECT * FROM Diagnoses;
SELECT * FROM Doctors;
SELECT * FROM MedicalCards;
SELECT * FROM Appointments;
SELECT * FROM DoctorDiagnoses;
SELECT * FROM MedicalCardDiagnoses;
