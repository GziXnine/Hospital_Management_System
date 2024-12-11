# 📊 Hospital Management System Database

Welcome to the **Hospital Management System Database** repository! This README provides a comprehensive overview of the database tables, their purpose, and relationships.

---
<p align="center">
  <img src="https://img.shields.io/badge/Completion-100%25-brightgreen" alt="Completion Status">
  &nbsp;&nbsp;
  <img src="https://visitor-badge.laobi.icu/badge?page_id=GziXnine/Hospital_Management_System" alt="Visitors">
</p>

## 📋 Database Overview
The database is designed to manage various aspects of a hospital's operations, including patient records, staff details, appointments, billing, and more. Below is a detailed comparison of the tables:

| Table Name               | Description                                                                                 | Key Features                                                                                                                                                                    |
|--------------------------|---------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Patients**             | Stores patient details.                                                                   | Includes medical history, contact info, and gender validation.                                                                                                                |
| **Doctors**              | Contains doctor information.                                                              | Tracks specialties, available schedules, and contact details.                                                                                                                |
| **Departments**          | Lists hospital departments.                                                               | Includes department name and location.                                                                                                                                         |
| **Doctor_Department**    | Junction table linking doctors and departments.                                           | Establishes many-to-many relationships.                                                                                                                                       |
| **Appointments**         | Manages patient appointments.                                                             | Includes purpose, status, and references to doctors and patients.                                                                                                            |
| **Medical_Records**      | Logs patient medical records.                                                             | Tracks diagnosis, treatment, and prescriptions with links to appointments.                                                                                                   |
| **Billing**              | Handles billing information.                                                              | Tracks total amounts, payment status, and insurance providers.                                                                                                                |
| **Staff**                | General table for hospital staff.                                                         | Covers roles like nurses, workers, and admin staff with department references.                                                                                               |
| **Nurses**               | Subset of staff with nursing specializations.                                             | Tracks shift hours and specializations.                                                                                                                                       |
| **Workers**              | Subset of staff for various non-medical roles.                                            | Tracks job titles and schedules.                                                                                                                                              |
| **Medicine**             | Stores information about medicines.                                                       | Tracks stock, dosage, expiry, and types (e.g., Tablet, Capsule).                                                                                                              |
| **Pharmacy**             | Logs medications prescribed to patients.                                                  | Links medicines and patients with quantities and dates.                                                                                                                       |
| **Blood_Bank**           | Manages blood stock levels.                                                               | Tracks blood types, quantities, and updates.                                                                                                                                  |
| **Room_Types**           | Defines types of hospital rooms.                                                          | Includes descriptions for ICU, Laboratory, and more.                                                                                                                          |
| **Rooms**                | Tracks individual room details.                                                           | Monitors status (Available, Occupied), capacity, and servicing dates.                                                                                                        |
| **Room_Assignments**     | Assigns rooms to staff or patients.                                                       | Logs assignment periods with room, staff, and patient references.                                                                                                            |
| **Cleaning_Service**     | Tracks room cleaning activities.                                                          | Logs service dates, times, and notes with staff assignments.                                                                                                                 |
| **Prescription**         | Stores doctor prescriptions for patients.                                                | Tracks medication details, dosage, frequency, and duration.                                                                                                                  |
| **Ambulance**            | Manages ambulance information.                                                            | Tracks availability, service dates, and driver assignments.                                                                                                                  |
| **Ambulance_Log**        | Logs ambulance usage for patient transport.                                               | Tracks pickup/dropoff details, times, and status.                                                                                                                             |
| **Medical_Records_Medicine** | Junction table linking medical records and medicines.                                   | Enables many-to-many relationships with dosage information.                                                                                                                   |

<p align="center">
  <img src="https://github.com/GziXnine/Hospital_Management_System/blob/main/Database_Diagram.png" alt="DB Screenshot" />
    
</p>

## 🚀 Key Features
- **Efficient Management**: Comprehensive tables to handle hospital operations.
- **Data Integrity**: Enforced through foreign keys and constraints.
- **Scalability**: Supports future extensions with optimized indexes.


## 📂 How to Use
1. Clone the repository.
2. Execute the SQL scripts in a compatible database management system.
3. Explore and customize tables as needed.

Feel free to contribute or raise issues! 😄


## 🤝 Contribution
We welcome contributions to improve the database design or documentation. Please fork the repository and submit a pull request.


## 📧 Contact
For any queries, contact the repository owner.

- **GitHub**: [GziXnine](https://github.com/GziXnine)
- **LinkedIn**: [Ahmed Allam](https://www.linkedin.com/in/1ahmed-allam)
- **Telegram**: [Telegram](http://t.me/GziXnine)

Happy coding! 🎉
