-- Удаление таблиц, если они существуют (для повторного выполнения скрипта)
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Specialties;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Diagnoses;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS MedicalCards;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS DoctorDiagnoses;
DROP TABLE IF EXISTS MedicalCardDiagnoses;

-- Создание таблиц
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

-- Триггер для расчета стоимости визита
DELIMITER //

CREATE TRIGGER calculate_visit_cost
BEFORE INSERT ON Appointments
FOR EACH ROW
BEGIN
    SET NEW.visit_cost = (SELECT price_per_visit FROM Categories WHERE category_number = NEW.doctor_category);
END //

DELIMITER ;

-- Вставка данных
INSERT INTO Patients (patient_fio, patient_birthday, patient_gender, service_discount, patient_address) VALUES
('Иванов Иван Иванович', '1980-05-15', 'M', 0.00, 'ул. Ленина, 10'),
('Петрова Анна Сергеевна', '1992-11-20', 'F', 0.10, 'пр. Мира, 5'),
('Сидоров Петр Алексеев', '1975-03-08', 'M', 0.00, 'ул. Кирова, 25');

INSERT INTO Specialties (specialty) VALUES
('Терапия'),
('Хирургия'),
('Кардиология');

INSERT INTO Categories (category_name, price_per_visit) VALUES
('Высшая', 2000.00),
('Первая', 1500.00),
('Вторая', 1000.00);

INSERT INTO Diagnoses (diagnosis_name) VALUES
('ОРВИ'),
('Гипертония'),
('Аппендицит');

INSERT INTO Doctors (doctor_fio, specialty_id, category_number) VALUES
('Кузнецов Сергей', 1, 1),
('Смирнова Ольга', 2, 2),
('Алексеев Дмитрий', 3, 1);

INSERT INTO MedicalCards (patient_id) VALUES
(1), (2), (3);
