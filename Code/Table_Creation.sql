CREATE DATABASE HospitalManagementSystem;
GO

USE HospitalManagementSystem;
GO

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY IDENTITY(1,1), 
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F', 'O')), 
    contact_number NVARCHAR(15),
    address NVARCHAR(255),
    email NVARCHAR(100),
    medical_history NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),

    INDEX idx_patient_name (last_name, first_name)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    specialty NVARCHAR(100) NOT NULL,
    contact_number NVARCHAR(15),
    email NVARCHAR(100),
    available_schedule NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),

    INDEX idx_specialty (specialty)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY IDENTITY(1, 1),
    department_name VARCHAR(50),
    location VARCHAR(100)
);

-- Creating Doctor_Department Junction Table (Many-to-Many: Doctors & Departments)
CREATE TABLE Doctor_Department (
    doctor_id INT,
    department_id INT,

    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE CASCADE
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY IDENTITY(1,1),
    patient_id INT NOT NULL,
    doctor_id INT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    purpose NVARCHAR(255),
    status NVARCHAR(20) DEFAULT 'Scheduled',
    created_at DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE SET NULL,
    INDEX idx_appointment_date (appointment_date, appointment_time)
);

CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY IDENTITY(1,1),
    patient_id INT NOT NULL,
    doctor_id INT NULL,
    appointment_id INT NULL,
    diagnosis NVARCHAR(MAX),
    treatment NVARCHAR(MAX),
    prescription NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE SET NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE NO ACTION,

    INDEX idx_record_patient (patient_id)
);

CREATE TABLE Billing (
    bill_id INT PRIMARY KEY IDENTITY(1,1),
    patient_id INT NOT NULL,
    appointment_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    payment_status NVARCHAR(20) DEFAULT 'Pending',
    payment_date DATE,
    insurance_provider NVARCHAR(100),
    created_at DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE NO ACTION,

    INDEX idx_payment_status (payment_status)
);

-- Creating Staff Table (General staff details, including nurses and workers)
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY IDENTITY(1, 1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role NVARCHAR(20) NOT NULL CHECK (role IN ('Nurse', 'Worker', 'Admin', 'Pharmacist', 'Technician', 'Lab Assistant', 'Driver')),
    department_id INT,
    contact_number VARCHAR(15),
    email VARCHAR(50),
    address TEXT,
    hire_date DATE,

    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL,

    INDEX idx_staff_role (role)
);

CREATE TABLE Nurses (
    nurse_id INT PRIMARY KEY IDENTITY(1, 1),
    staff_id INT NOT NULL,
    specialization VARCHAR(50),
    shift_hours NVARCHAR(MAX),

    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id) ON DELETE CASCADE
);

CREATE TABLE Workers (
    worker_id INT PRIMARY KEY IDENTITY(1, 1),
    staff_id INT,
    job_title VARCHAR(50),
    work_schedule NVARCHAR(MAX),

    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id) ON DELETE CASCADE
);

CREATE TABLE Medicine (
    medicine_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    brand NVARCHAR(50),
    type NVARCHAR(20) CHECK (type IN ('Tablet', 'Capsule', 'Liquid', 'Injection', 'Ointment')),
    dosage NVARCHAR(50),
    stock_quantity INT CHECK (stock_quantity >= 0),
    expiry_date DATE,
    created_at DATETIME DEFAULT GETDATE()
);

-- Creating Pharmacy table for storing medication given to patients
CREATE TABLE Pharmacy (
    pharmacy_id INT PRIMARY KEY IDENTITY(1, 1),
    medicine_id INT,
    patient_id INT,
    quantity INT,
    prescription_date DATE,

    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id) ON DELETE CASCADE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE
);

CREATE TABLE Blood_Bank (
    blood_id INT PRIMARY KEY IDENTITY(1,1),
    blood_type NVARCHAR(3) CHECK (blood_type IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    stock_quantity INT CHECK (stock_quantity >= 0),
    last_updated DATE,

    INDEX idx_blood_type (blood_type)
);

CREATE TABLE Room_Types (
    room_type_id INT PRIMARY KEY IDENTITY(1,1),
    room_type_name NVARCHAR(50) NOT NULL, -- ICU, Laboratory, Cosmetic, Operating, Staff
    description NVARCHAR(255)
);

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY IDENTITY(1,1),
    room_number VARCHAR(10) UNIQUE NOT NULL,  
    room_type_id INT,                         
    capacity INT,                             
    status NVARCHAR(20) CHECK (status IN ('Available', 'Occupied', 'Under Maintenance')),  
    last_serviced DATE,                       -- Date when the room was last serviced or cleaned

    FOREIGN KEY (room_type_id) REFERENCES Room_Types(room_type_id) ON DELETE SET NULL
);

CREATE TABLE Room_Assignments (
    assignment_id INT PRIMARY KEY IDENTITY(1,1),
    room_id INT,
    staff_id INT NULL,
    patient_id INT NULL,
    assignment_date DATETIME DEFAULT GETDATE(),
    end_date DATETIME NULL,                  -- End date for the assignment (nullable)
    
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id) ON DELETE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id) ON DELETE SET NULL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE SET NULL
);

CREATE TABLE Cleaning_Service (
    service_id INT PRIMARY KEY IDENTITY(1, 1),
    room_id INT,
    service_date DATE DEFAULT CAST(GETDATE() AS DATE),
    service_time TIME DEFAULT CAST(GETDATE() AS TIME),
    staff_id INT,
    notes NVARCHAR(255),

    FOREIGN KEY (room_id) REFERENCES Rooms(room_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

CREATE TABLE Prescription (
    prescription_id INT PRIMARY KEY IDENTITY(1, 1),
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    prescription_date DATE DEFAULT GETDATE(),
    medication_name NVARCHAR(100),
    dosage NVARCHAR(100),
    frequency NVARCHAR(50),
    duration NVARCHAR(50),
    notes NVARCHAR(255),

    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Ambulance (
    ambulance_id INT PRIMARY KEY IDENTITY(1, 1),
    ambulance_number VARCHAR(10) UNIQUE,
    availability NVARCHAR(15) CHECK (availability IN ('Available', 'On Duty', 'Maintenance')),
    driver_id INT NULL,  -- Make driver_id nullable
    last_service_date DATE,

    FOREIGN KEY (driver_id) REFERENCES Staff(staff_id) ON DELETE NO ACTION
);

-- Creating Ambulance_Log Table to track ambulance usage
CREATE TABLE Ambulance_Log (
    log_id INT PRIMARY KEY IDENTITY(1,1),
    ambulance_id INT,
    patient_id INT,
    pickup_location NVARCHAR(100),
    dropoff_location NVARCHAR(100),
    pickup_time DATETIME,
    dropoff_time DATETIME,
    status NVARCHAR(15) CHECK (status IN ('Completed', 'In Progress', 'Canceled')),

    FOREIGN KEY (ambulance_id) REFERENCES Ambulance(ambulance_id) ON DELETE CASCADE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,

	INDEX idx_log_status (status)
);

-- Creating Medical_Records_Medicine Table (Junction table for many-to-many relationship between MedicalRecords and Medicine)
CREATE TABLE Medical_Records_Medicine (
    record_id INT,
    medicine_id INT,
    dosage NVARCHAR(50),

    PRIMARY KEY (record_id, medicine_id),
    FOREIGN KEY (record_id) REFERENCES Medical_Records(record_id) ON DELETE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES Medicine(medicine_id) ON DELETE CASCADE
);

-- Creating indexes for optimization
CREATE INDEX idx_doctor_specialty ON Doctors(specialty);
CREATE INDEX idx_billing_status ON Billing(payment_status);
CREATE INDEX idx_medicine_type ON Medicine (type);
CREATE INDEX idx_medicine_expiry ON Medicine (expiry_date);