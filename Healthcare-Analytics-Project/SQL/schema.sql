-- ========================================
-- 1. Create Database
-- ========================================
CREATE DATABASE Hospital_data;
USE Hospital_data;

-- ========================================
-- 2. Create Dimension Tables
-- ========================================

-- Patient Dimension Table
CREATE TABLE patient_data (
    patient_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    patient_name VARCHAR(25),
    Age INT NOT NULL,
    Gender VARCHAR(25),
    Blood_type VARCHAR(25),
    Medical_condition VARCHAR(25),
    Test_results VARCHAR(25)
);

-- Hospital/Doctors Dimension Table
CREATE TABLE hospital_doctors_data (
    hospital_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    hospital VARCHAR(35),
    Doctor VARCHAR(35),
    Admission_type VARCHAR(35),
    Room_number INT NOT NULL,
    Medication VARCHAR(35)
);

-- Modify Medication column
ALTER TABLE hospital_doctors_data
MODIFY COLUMN Medication VARCHAR(35);

-- Insurance Dimension Table
CREATE TABLE insurance_data (
    insurance_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Insurance_provider VARCHAR(25)
);

-- Date Dimension Table
CREATE TABLE date_table (
    date_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Date_of_admission DATE,
    Discharge_date DATE
);

-- ========================================
-- 3. Create Fact Table with Relationships
-- ========================================
CREATE TABLE fact_table (
    fact_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    patient_id INT,
    hospital_id INT,
    insurance_id INT,
    date_id INT,
    Billing_amount DECIMAL(10,2),
    
    FOREIGN KEY (patient_id) REFERENCES patient_data(patient_id),
    FOREIGN KEY (hospital_id) REFERENCES hospital_doctors_data(hospital_id),
    FOREIGN KEY (insurance_id) REFERENCES insurance_data(insurance_id),
    FOREIGN KEY (date_id) REFERENCES date_table(date_id)
);

-- ========================================
-- 4. Populate Fact Table
-- ========================================
INSERT INTO fact_table (patient_id, hospital_id, insurance_id, date_id)
SELECT patient_id, patient_id, patient_id, patient_id
FROM patient_data;