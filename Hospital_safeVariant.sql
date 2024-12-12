-- удаление таблиц, если они существуют
DROP TABLE IF EXISTS MedicalRecordEntries;
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
patient_address VARCHAR(255) NOT NULL
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


CREATE TABLE IF NOT EXISTS Appointments(
appointment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
doctor_id INT UNSIGNED NOT NULL,
patient_id INT UNSIGNED NOT NULL,
purpose VARCHAR(255) NOT NULL,
appointment_date DATE NOT NULL,
coupon_number INT UNSIGNED NOT NULL,
visit_cost DECIMAL(10,2) NOT NULL,
doctor_category INT UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS MedicalCards(
med_card_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
patient_id INT UNSIGNED UNIQUE NOT NULL,
appointment_date DATE NOT NULL,
opening_date DATE NOT NULL,
diagnosis_code INT UNSIGNED NOT NULL,
appointment_id INT UNSIGNED NOT NULL
);


CREATE TABLE IF NOT EXISTS MedicalRecordEntries(
record_number INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
med_card_id INT UNSIGNED NOT NULL,
patient_id INT UNSIGNED NOT NULL,
diagnosis_code INT UNSIGNED NOT NULL,
doctor_fio VARCHAR(255) NOT NULL
);


-- создание внешних ключей
ALTER TABLE Doctors ADD CONSTRAINT fk_doctors_specialties FOREIGN KEY (specialty_id) REFERENCES Specialties(specialty_id);
ALTER TABLE Doctors ADD CONSTRAINT fk_doctors_categories FOREIGN KEY (category_number) REFERENCES Categories(category_number);

ALTER TABLE Appointments ADD CONSTRAINT fk_appointments_doctors FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id);
ALTER TABLE Appointments ADD CONSTRAINT fk_appointments_patients FOREIGN KEY (patient_id) REFERENCES Patients(patient_id);
ALTER TABLE Appointments ADD CONSTRAINT fk_appointments_categories FOREIGN KEY (doctor_category) REFERENCES Categories(category_number);

ALTER TABLE MedicalCards ADD CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES Patients(patient_id);
-- ALTER TABLE MedicalCards ADD CONSTRAINT fk_appointment_date FOREIGN KEY (appointment_date) REFERENCES Appointments(appointment_date);
ALTER TABLE MedicalCards ADD CONSTRAINT fk_diagnosis_code FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code);

ALTER TABLE MedicalRecordEntries ADD CONSTRAINT fk_med_card_id FOREIGN KEY (med_card_id) REFERENCES MedicalCards(med_card_id);
ALTER TABLE MedicalRecordEntries ADD CONSTRAINT fk_med_card_entries_patient_id FOREIGN KEY (patient_id) REFERENCES Patients(patient_id);
ALTER TABLE MedicalRecordEntries ADD CONSTRAINT fk_med_card_entries_diagnosis_code FOREIGN KEY (diagnosis_code) REFERENCES Diagnoses(diagnosis_code);
-- ALTER TABLE MedicalRecordEntries ADD CONSTRAINT fk_med_card_doctor_fio FOREIGN KEY (doctor_fio) REFERENCES Doctors(doctor_fio);






-- триггер
DELIMITER //
CREATE TRIGGER calculate_visit_cost
BEFORE INSERT ON Appointments
FOR EACH ROW
BEGIN
SET NEW.visit_cost = (SELECT price_per_visit FROM Categories WHERE category_number = NEW.doctor_category);
END //
DELIMITER ;

INSERT IGNORE INTO Patients (patient_fio, patient_birthday, patient_gender, service_discount, patient_address) VALUES 
('Анасьев Сергей Константинович', '1988-05-21', 'M', 0.80, 'ул. Щапова 21'),
('Жорцев Григорий Олегович', '2000-08-01', 'M', 0.20, 'ул. Грегорьянова 6'),
('Мальцева Светлана Павловна', '1990-07-15', 'F', 0.90, 'ул. Пушкина 10'),
('Громов Павел Николаевич', '2010-01-12', 'M', 0.10, 'ул. Филлипова 28'),
('Мартыненко Георгий Валентинович', '1895-01-12', 'M', 0.80, 'ул. Макарова 9'),
('Ломов Андрей Альбертович', '2011-05-12', 'M', 0.10, 'ул. Некрасова 11'),
('Романова Лилия Максимовна', '1983-02-08', 'F', 0.80, 'ул. Чехова 6'),
('Строгов Николай Иванович', '2015-05-07', 'M', 0.20, 'ул. Макроса 10'), 
('Люблин Игнат Георгиевич', '2002-05-01', 'M', 0.20, 'ул. Кризина 5'),
('Иванов Иван Иванович', '1980-05-15', 'M', 0.80, 'ул. Ленина, 10'), 
('Петрова Анна Сергеевна', '1992-11-20', 'F', 0.20, 'пр. Мира, 5'), 
('Сидоров Петр Алексеев', '1975-03-08', 'M', 0.70, 'ул. Кирова, 25'),
('Ланов Константин Юрьевич', '2000-05-04', 'M', 0.20, 'ул. Зябликова 5'),
('Юрцева Наталья Николавена', '2005-02-12', 'F', 0.20, 'ул. Громова 10'),
('Тинькофф Максим Забегайкович', '1978-08-12', 'M', 0.70, 'ул. Кирова 11');

INSERT IGNORE INTO Specialties (specialty) VALUES 
('Терапия'),
('Хирургия'),
('Кардиология'),
('Психиатрия'),
('Психиатрическая-наркология');

INSERT IGNORE INTO Categories (category_name, price_per_visit) VALUES 
('Высшая', 2000.00),
('Первая', 1500.00),
('Вторая', 1000.00);

INSERT IGNORE INTO Diagnoses (diagnosis_name) VALUES 
('ОРВИ'),
('Гипертония'),
('Аппендицит'), 
('Депрессия'), 
('Наркотическая зависимость'), 
('Простуда'), 
('Грипп'), 
('Алкогольная зависимость'), 
('Артериальная гипертония'), 
('Паранойя');

INSERT IGNORE INTO Doctors (doctor_fio, specialty_id, category_number) VALUES
('Кузнецов Сергей Витальевич', 1, 1), 
('Смирнова Ольга Озоновна', 2, 2), 
('Алексеев Дмитрий Святославович', 3, 1), 
('Синицин Максим Анатольевич', 4, 2), 
('Крюков Олег Дмитриевич', 5, 3), 
('Юсин Анатолий Григориевич', 1, 3), 
('Тарков Николай Георгиевич', 2, 2), 
('Гонцев Андрей Михайлович', 3, 1);

INSERT IGNORE INTO Appointments (doctor_id, patient_id, purpose, appointment_date, coupon_number, doctor_category) VALUES 
(1,1,'Консультация','2024-03-08',1,1), 
(2,2,'Обследование','2024-03-10',2,2), 
(3,3,'Лечение','2024-03-15',3,1), 
(4,4,'Консультация','2024-03-17',4,2), 
(5,5,'Обследование','2024-03-19',5,3), 
(6,6,'Лечение','2024-03-21',6,3), 
(7,7,'Консультация','2024-03-23',7,2), 
(8,8,'Обследование','2024-03-25',8,1), 
(1,9,'Лечение','2024-03-27',9,1), 
(2,10,'Консультация','2024-03-29',10,2), 
(3,11,'Обследование','2024-04-01',11,1), 
(4,12,'Лечение','2024-04-03',12,2), 
(5,13,'Консультация','2024-04-05',13,3), 
(6,14,'Обследование','2024-04-07',14,3), 
(7,15,'Лечение','2024-04-09',15,2), 
(1,1,'Консультация','2024-04-10',16,1), 
(2,2,'Обследование','2024-04-12',17,2), 
(3,3,'Лечение','2024-04-15',18,1), 
(4,4,'Консультация','2024-04-17',19,2), 
(5,5,'Обследование','2024-04-19',20,3); 

INSERT IGNORE INTO MedicalCards (patient_id, appointment_date, opening_date, diagnosis_code, appointment_id) VALUES
(1, '2024-03-08', '2024-01-15', 1, 1),
(2, '2024-03-10', '2024-02-10', 2, 2),
(3, '2024-03-15', '2024-03-10', 3, 3),
(4, '2024-03-17', '2024-02-15', 4, 4),
(5, '2024-03-19', '2024-03-20', 5, 5),
(6, '2024-03-21', '2024-04-10', 6, 6),
(7, '2024-03-23', '2024-02-25', 7, 7),
(8, '2024-03-25', '2024-04-15', 8, 8),
(9, '2024-03-27', '2024-03-20', 9, 9),
(10, '2024-03-29', '2024-02-05', 10, 10),
(11, '2024-04-01', '2024-01-15', 1, 11),
(12, '2024-04-03', '2024-03-03', 2, 12),
(13, '2024-04-05', '2024-04-11', 3, 13),
(14, '2024-04-07', '2024-02-10', 4, 14),
(15, '2024-04-09', '2024-01-25', 5, 15),
(1, '2024-04-10', '2024-01-20', 6, 16),
(2, '2024-04-12', '2024-03-25', 7, 17),
(3, '2024-04-15', '2024-03-01', 8, 18),
(4, '2024-04-17', '2024-03-20', 9, 19),
(5, '2024-04-19', '2024-04-15', 10, 20);


INSERT IGNORE INTO MedicalRecordEntries (med_card_id, patient_id, diagnosis_code, doctor_fio) VALUES
(1, 1, 1, 'Кузнецов Сергей Витальевич'),
(2, 2, 2, 'Смирнова Ольга Озоновна'),
(3, 3, 3, 'Алексеев Дмитрий Святославович'),
(4, 4, 4, 'Синицин Максим Анатольевич'),
(5, 5, 5, 'Крюков Олег Дмитриевич'),
(6, 6, 6, 'Юсин Анатолий Григориевич'),
(7, 7, 7, 'Тарков Николай Георгиевич'),
(8, 8, 8, 'Гонцев Андрей Михайлович'),
(9, 9, 9, 'Кузнецов Сергей Витальевич'),
(10, 10, 10, 'Смирнова Ольга Озоновна'),
(11, 11, 1, 'Кузнецов Сергей Витальевич'),
(12, 12, 2, 'Смирнова Ольга Озоновна'),
(13, 13, 3, 'Алексеев Дмитрий Святославович'),
(14, 14, 4, 'Синицин Максим Анатольевич'),
(15, 15, 5, 'Крюков Олег Дмитриевич'),
(16, 1, 6, 'Юсин Анатолий Григориевич'),
(17, 2, 7, 'Тарков Николай Георгиевич'),
(18, 3, 8, 'Гонцев Андрей Михайлович'),
(19, 4, 9, 'Кузнецов Сергей Витальевич'),
(20, 5, 10, 'Смирнова Ольга Озоновна');

SHOW TABLES; -- вывод всех таблиц

-- вывод всех данных из таблиц

SELECT * FROM Patients; 
SELECT * FROM Specialties;
SELECT * FROM Categories;
SELECT * FROM Diagnoses;
SELECT * FROM Doctors;
SELECT * FROM MedicalCards;
SELECT * FROM Appointments;
SELECT * FROM MedicalRecordEntries;
