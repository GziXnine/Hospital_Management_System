INSERT INTO Patients (first_name, last_name, date_of_birth, gender, contact_number, address, email, medical_history)
VALUES
	('John', 'Doe', '1985-05-15', 'M', '555-1234', '123 Elm St, Springfield, IL', 'john.doe@email.com', 'Hypertension'),
	('Jane', 'Smith', '1992-08-22', 'F', '555-5678', '456 Oak St, Springfield, IL', 'jane.smith@email.com', 'Asthma'),
	('Michael', 'Johnson', '1975-02-10', 'M', '555-8765', '789 Pine St, Springfield, IL', 'michael.johnson@email.com', 'Diabetes'),
	('Emily', 'Davis', '2000-11-30', 'F', '555-4321', '321 Birch St, Springfield, IL', 'emily.davis@email.com', 'None'),
	('Daniel', 'Brown', '1990-03-25', 'M', '555-6543', '654 Maple St, Springfield, IL', 'daniel.brown@email.com', 'Migraine'),
	('Olivia', 'Martinez', '1980-07-10', 'F', '555-9876', '987 Cedar St, Springfield, IL', 'olivia.martinez@email.com', 'Arthritis'),
	('James', 'Wilson', '1965-01-14', 'M', '555-1357', '159 Elm St, Springfield, IL', 'james.wilson@email.com', 'Heart disease'),
	('Sophia', 'Moore', '1995-04-05', 'F', '555-2468', '753 Oak St, Springfield, IL', 'sophia.moore@email.com', 'None'),
	('David', 'Taylor', '1983-09-20', 'M', '555-3579', '369 Pine St, Springfield, IL', 'david.taylor@email.com', 'High cholesterol'),
	('Isabella', 'Anderson', '2005-12-01', 'F', '555-4680', '741 Birch St, Springfield, IL', 'isabella.anderson@email.com', 'None');

INSERT INTO Doctors (first_name, last_name, specialty, contact_number, email, available_schedule)
VALUES
	('Dr. Alice', 'Miller', 'Cardiology', '555-1122', 'alice.miller@email.com', 'Mon-Wed 9AM-5PM'),
	('Dr. Bob', 'Williams', 'Neurology', '555-2233', 'bob.williams@email.com', 'Tue-Thu 10AM-6PM'),
	('Dr. Charlie', 'Brown', 'Orthopedics', '555-3344', 'charlie.brown@email.com', 'Mon-Fri 8AM-4PM'),
	('Dr. Diana', 'Jones', 'Dermatology', '555-4455', 'diana.jones@email.com', 'Mon-Fri 9AM-5PM'),
	('Dr. Eva', 'Garcia', 'Pediatrics', '555-5566', 'eva.garcia@email.com', 'Wed-Fri 10AM-6PM'),
	('Dr. Frank', 'Martinez', 'General Surgery', '555-6677', 'frank.martinez@email.com', 'Mon-Tue 8AM-3PM'),
	('Dr. Grace', 'Rodriguez', 'Gynecology', '555-7788', 'grace.rodriguez@email.com', 'Tue-Thu 9AM-5PM'),
	('Dr. Henry', 'Lee', 'Psychiatry', '555-8899', 'henry.lee@email.com', 'Mon-Fri 9AM-4PM'),
	('Dr. Ivy', 'Lopez', 'Ophthalmology', '555-9900', 'ivy.lopez@email.com', 'Mon-Wed 8AM-5PM'),
	('Dr. Jack', 'White', 'ENT', '555-1010', 'jack.white@email.com', 'Tue-Fri 10AM-6PM');

INSERT INTO Departments (department_name, location)
VALUES
	('Cardiology', '2nd Floor'),
	('Neurology', '3rd Floor'),
	('Orthopedics', '4th Floor'),
	('Dermatology', '1st Floor'),
	('Pediatrics', '2nd Floor'),
	('General Surgery', '5th Floor'),
	('Gynecology', '3rd Floor'),
	('Psychiatry', '6th Floor'),
	('Ophthalmology', '4th Floor'),
	('ENT', '1st Floor');

-- Insert sample data for Doctor_Department (Many-to-Many relationship)
INSERT INTO Doctor_Department (doctor_id, department_id)
VALUES
	(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
	(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, purpose, status)
VALUES
	(1, 1, '2024-11-20', '09:00', 'Heart checkup', 'Scheduled'),
	(2, 2, '2024-11-21', '10:00', 'Neurology consultation', 'Scheduled'),
	(3, 3, '2024-11-22', '11:00', 'Knee pain', 'Scheduled'),
	(4, 4, '2024-11-23', '14:00', 'Skin rash', 'Scheduled'),
	(5, 5, '2024-11-24', '15:00', 'Child vaccination', 'Scheduled'),
	(6, 6, '2024-11-25', '16:00', 'Gallbladder surgery', 'Scheduled'),
	(7, 7, '2024-11-26', '09:30', 'Gynecological checkup', 'Scheduled'),
	(8, 8, '2024-11-27', '10:30', 'Mental health evaluation', 'Scheduled'),
	(9, 9, '2024-11-28', '13:00', 'Eye checkup', 'Scheduled'),
	(10, 10, '2024-11-29', '14:30', 'Ear examination', 'Scheduled');

INSERT INTO Medical_Records (patient_id, doctor_id, appointment_id, diagnosis, treatment, prescription)
VALUES
	(1, 1, 1, 'Hypertension', 'Lifestyle changes, medication', 'Lisinopril'),
	(2, 2, 2, 'Asthma', 'Inhalers, avoid triggers', 'Albuterol'),
	(3, 3, 3, 'Knee Osteoarthritis', 'Physical therapy, pain relief', 'Ibuprofen'),
	(4, 4, 4, 'Dermatitis', 'Topical corticosteroids', 'Hydrocortisone'),
	(5, 5, 5, 'Routine checkup', 'No issues found', 'None'),
	(6, 6, 6, 'Gallstones', 'Surgical removal', 'None'),
	(7, 7, 7, 'Pelvic Exam', 'Normal', 'None'),
	(8, 8, 8, 'Anxiety', 'Therapy, medication', 'Sertraline'),
	(9, 9, 9, 'Myopia', 'Eyeglasses', 'None'),
	(10, 10, 10, 'Ear Infection', 'Antibiotics', 'Amoxicillin');

INSERT INTO Billing (patient_id, appointment_id, total_amount, payment_status, payment_date, insurance_provider)
VALUES
	(1, 1, 100.00, 'Pending', NULL, 'Blue Cross'),
	(2, 2, 150.00, 'Paid', '2024-11-21', 'Aetna'),
	(3, 3, 200.00, 'Pending', NULL, 'Cigna'),
	(4, 4, 120.00, 'Paid', '2024-11-22', 'UnitedHealthcare'),
	(5, 5, 80.00, 'Pending', NULL, 'Blue Cross'),
	(6, 6, 500.00, 'Paid', '2024-11-23', 'Aetna'),
	(7, 7, 250.00, 'Pending', NULL, 'Cigna'),
	(8, 8, 100.00, 'Paid', '2024-11-24', 'UnitedHealthcare'),
	(9, 9, 150.00, 'Pending', NULL, 'Blue Cross'),
	(10, 10, 130.00, 'Paid', '2024-11-25', 'Aetna');

INSERT INTO Staff (first_name, last_name, role, department_id, contact_number, email, address, hire_date) 
VALUES
    ('Alice', 'Johnson', 'Nurse', 1, '555-0100', 'alice.johnson@hospital.com', '123 Elm St', '2023-08-01'),
    ('Bob', 'Smith', 'Technician', 2, '555-0101', 'bob.smith@hospital.com', '456 Oak St', '2022-07-15'),
    ('Charlie', 'Brown', 'Admin', 3, '555-0102', 'charlie.brown@hospital.com', '789 Pine St', '2021-09-10'),
    ('David', 'Lee', 'Pharmacist', 4, '555-0103', 'david.lee@hospital.com', '321 Maple St', '2020-12-05'),
    ('Eva', 'Davis', 'Worker', 5, '555-0104', 'eva.davis@hospital.com', '654 Birch St', '2024-03-20'),
    ('Frank', 'Wilson', 'Nurse', 1, '555-0105', 'frank.wilson@hospital.com', '987 Cedar St', '2022-02-25'),
    ('Grace', 'Moore', 'Technician', 2, '555-0106', 'grace.moore@hospital.com', '321 Oak St', '2021-01-15'),
    ('Helen', 'Taylor', 'Admin', 3, '555-0107', 'helen.taylor@hospital.com', '654 Pine St', '2020-08-30'),
    ('Ivy', 'Anderson', 'Pharmacist', 4, '555-0108', 'ivy.anderson@hospital.com', '123 Birch St', '2023-06-25'),
    ('James', 'Thomas', 'Worker', 5, '555-0109', 'james.thomas@hospital.com', '432 Maple St', '2024-09-10'),
	('John', 'Doe', 'Driver', 1, '555-0110', 'john.doe@hospital.com', '123 Maple St', '2024-04-01'),
    ('Sarah', 'Miller', 'Driver', 2, '555-0111', 'sarah.miller@hospital.com', '456 Oak St', '2024-05-15'),
    ('Michael', 'Taylor', 'Driver', 3, '555-0112', 'michael.taylor@hospital.com', '789 Pine St', '2024-06-10'),
    ('Olivia', 'Martinez', 'Driver', 4, '555-0113', 'olivia.martinez@hospital.com', '321 Birch St', '2024-07-22'),
    ('David', 'Jackson', 'Driver', 5, '555-0114', 'david.jackson@hospital.com', '654 Cedar St', '2024-08-01');

INSERT INTO Ambulance (ambulance_number, availability, driver_id, last_service_date) 
VALUES
    ('AMB001', 'Available', 1, '2024-10-10'),
    ('AMB002', 'On Duty', 2, '2024-10-08'),
    ('AMB003', 'Maintenance', 3, '2024-09-20'),
    ('AMB004', 'Available', 4, '2024-09-30'),
    ('AMB005', 'Available', 5, '2024-10-05'),
    ('AMB006', 'On Duty', 6, '2024-10-02'),
    ('AMB007', 'Maintenance', 7, '2024-09-15'),
    ('AMB008', 'Available', 8, '2024-10-01'),
    ('AMB009', 'On Duty', 9, '2024-10-03'),
    ('AMB010', 'Maintenance', 10, '2024-09-25');

INSERT INTO Ambulance_Log (ambulance_id, patient_id, pickup_location, dropoff_location, pickup_time, dropoff_time, status) 
VALUES
    (1, 1, '123 Main St', 'City Hospital', '2024-10-11 08:30', '2024-10-11 09:00', 'Completed'),
    (2, 3, '456 Elm St', 'County Clinic', '2024-10-10 14:00', '2024-10-10 14:30', 'Completed'),
    (3, 4, '789 Oak St', 'General Hospital', '2024-10-09 10:00', '2024-10-09 10:30', 'In Progress'),
    (4, 2, '321 Pine St', 'Downtown Medical Center', '2024-10-08 12:00', '2024-10-08 12:30', 'Canceled'),
    (5, 5, '654 Maple St', 'State Hospital', '2024-10-07 09:00', '2024-10-07 09:30', 'Completed'),
    (6, 7, '234 Birch St', 'City Hospital', '2024-10-06 13:00', '2024-10-06 13:45', 'Completed'),
    (7, 6, '567 Cedar St', 'General Hospital', '2024-10-05 15:30', '2024-10-05 16:00', 'In Progress'),
    (8, 8, '890 Willow St', 'Downtown Medical Center', '2024-10-04 16:15', '2024-10-04 16:45', 'Completed'),
    (9, 9, '135 Ash St', 'County Clinic', '2024-10-03 11:00', '2024-10-03 11:30', 'Canceled'),
    (10, 10, '246 Oak St', 'State Hospital', '2024-10-02 17:00', '2024-10-02 17:30', 'Completed');

INSERT INTO Blood_Bank (blood_type, stock_quantity, last_updated) 
VALUES
	('A+', 20, '2024-10-10'),
	('A-', 15, '2024-10-10'),
	('B+', 30, '2024-10-09'),
	('B-', 10, '2024-10-08'),
	('AB+', 25, '2024-10-07'),
	('AB-', 5, '2024-10-06'),
	('O+', 50, '2024-10-05'),
	('O-', 40, '2024-10-04'),
	('A+', 18, '2024-10-03'),
	('B-', 12, '2024-10-02');

INSERT INTO Medicine (name, brand, type, dosage, stock_quantity, expiry_date) 
VALUES
	('Paracetamol', 'BrandA', 'Tablet', '500mg', 100, '2025-12-31'),
	('Ibuprofen', 'BrandB', 'Capsule', '250mg', 150, '2025-06-30'),
	('Cough Syrup', 'BrandC', 'Liquid', '10ml', 50, '2025-03-31'),
	('Amoxicillin', 'BrandD', 'Capsule', '200mg', 200, '2026-01-31'),
	('Aspirin', 'BrandE', 'Tablet', '500mg', 80, '2025-11-30'),
	('Ciprofloxacin', 'BrandF', 'Tablet', '500mg', 60, '2025-05-31'),
	('Vitamin C', 'BrandG', 'Capsule', '20mg', 120, '2024-12-31'),
	('Doxycycline', 'BrandH', 'Capsule', '100mg', 90, '2026-07-15'),
	('Metformin', 'BrandI', 'Tablet', '500mg', 200, '2026-02-28'),
	('Prednisone', 'BrandJ', 'Tablet', '0.5mg', 50, '2024-11-30');

INSERT INTO Medical_Records_Medicine (record_id, medicine_id, dosage) 
VALUES
	(1, 2, '500mg'),
	(2, 3, '250mg'),
	(3, 5, '10ml'),
	(4, 1, '200mg'),
	(5, 4, '5ml'),
	(6, 7, '20mg'),
	(7, 9, '1 Capsule'),
	(8, 6, '100mg'),
	(9, 8, '1 Tablet'),
	(10, 10, '0.5mg');

INSERT INTO Nurses (staff_id, specialization, shift_hours) 
VALUES
	(1, 'Pediatrics', '7:00 AM - 3:00 PM'),
	(2, 'Cardiology', '8:00 AM - 4:00 PM'),
	(3, 'Orthopedics', '9:00 AM - 5:00 PM'),
	(4, 'Neonatology', '10:00 AM - 6:00 PM'),
	(5, 'Oncology', '11:00 AM - 7:00 PM'),
	(6, 'Emergency Care', '7:00 AM - 7:00 PM'),
	(7, 'General Surgery', '8:00 AM - 4:00 PM'),
	(8, 'Internal Medicine', '9:00 AM - 5:00 PM'),
	(9, 'Neurology', '10:00 AM - 6:00 PM'),
	(10, 'Dermatology', '7:00 AM - 3:00 PM');

INSERT INTO Pharmacy (medicine_id, patient_id, quantity, prescription_date) 
VALUES
	(1, 1, 10, '2024-10-11'),
	(2, 3, 15, '2024-10-10'),
	(3, 5, 5, '2024-10-09'),
	(4, 2, 20, '2024-10-08'),
	(5, 4, 30, '2024-10-07'),
	(6, 6, 25, '2024-10-06'),
	(7, 7, 10, '2024-10-05'),
	(8, 8, 50, '2024-10-04'),
	(9, 9, 100, '2024-10-03'),
	(10, 10, 30, '2024-10-02');

INSERT INTO Workers (staff_id, job_title, work_schedule) 
VALUES
	(1, 'Cleaner', '8:00 AM - 4:00 PM'),
	(2, 'Security Guard', '9:00 AM - 5:00 PM'),
	(3, 'Janitor', '10:00 AM - 6:00 PM'),
	(4, 'Cook', '7:00 AM - 3:00 PM'),
	(5, 'Cleaner', '6:00 AM - 2:00 PM'),
	(6, 'Security Guard', '11:00 AM - 7:00 PM'),
	(7, 'Janitor', '8:00 AM - 4:00 PM'),
	(8, 'Cook', '10:00 AM - 6:00 PM'),
	(9, 'Cleaner', '8:00 AM - 4:00 PM'),
	(10, 'Security Guard', '12:00 PM - 8:00 PM');

INSERT INTO Room_Types (room_type_name, description)
VALUES
    ('ICU', 'ICU for critical care patients'),
    ('Laboratory', 'Laboratories for medical testing and diagnostics'),
    ('Cosmetic', 'Rooms for cosmetic surgeries and treatments'),
    ('Operating', 'Operating rooms for surgeries'),
    ('Staff', 'Staff rooms for hospital employees');

INSERT INTO Rooms (room_number, room_type_id, capacity, status, last_serviced)
VALUES
    ('ICU101', 1, 2, 'Available', '2024-10-01'),
    ('LAB201', 2, 4, 'Occupied', '2024-10-05'),
    ('COS301', 3, 1, 'Under Maintenance', '2024-10-10'),
    ('OPR401', 4, 2, 'Available', '2024-10-01'),
    ('STF501', 5, 3, 'Occupied', '2024-09-20');

INSERT INTO Room_Assignments (room_id, staff_id, patient_id, assignment_date, end_date)
VALUES
    (1, 1, NULL, '2024-10-12', NULL),  -- ICU room assigned to staff member (e.g., nurse)
    (2, NULL, 1, '2024-10-11', '2024-10-15'),  -- Laboratory room assigned to a patient
    (3, NULL, 2, '2024-10-10', '2024-10-12'),  -- Cosmetic room assigned to a patient
    (4, 3, NULL, '2024-10-10', NULL),  -- Operating room assigned to surgeon (staff)
    (5, NULL, NULL, '2024-10-09', NULL);  -- Staff room, no patient assigned

INSERT INTO Cleaning_Service (room_id, service_date, service_time, staff_id, notes)
VALUES
    (1, '2024-11-10', '08:00', 2, 'Daily cleaning for ICU'),
    (3, '2024-11-11', '09:00', 4, 'Post-surgery cleanup in Operating Room'),
    (5, '2024-11-12', '10:30', 3, 'Routine cleaning of staff rooms'),
    (4, '2024-11-13', '11:00', 5, 'Cleaning of Cosmetic Surgery room'),
    (2, '2024-11-14', '12:00', 6, 'Routine cleaning of Laboratory');

INSERT INTO Prescription (patient_id, doctor_id, prescription_date, medication_name, dosage, frequency, duration, notes)
VALUES
    (1, 3, '2024-11-10', 'Paracetamol', '500mg', 'Every 6 hours', '5 days', 'For pain relief'),
    (2, 4, '2024-11-11', 'Amoxicillin', '250mg', 'Every 8 hours', '7 days', 'For bacterial infection'),
    (3, 2, '2024-11-12', 'Metformin', '500mg', 'Twice daily', 'Indefinite', 'For diabetes management'),
    (4, 5, '2024-11-13', 'Aspirin', '75mg', 'Once daily', '30 days', 'For blood thinning'),
    (5, 1, '2024-11-14', 'Ibuprofen', '200mg', 'Every 4 hours', '3 days', 'For fever and pain');