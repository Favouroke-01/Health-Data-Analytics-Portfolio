-- PROJECT: Understanding Disease Burden and Healthcare Service Utilisation
-- FILE: Data Cleaning and Preparation
-- DATASET: Synthetic Healthcare Patient Encounters
-- DATABASE: healthcare_eda
-- TABLE: patient_encounters

USE healthcare_eda;

-- PROJECT: Understanding Disease Burden and Healthcare Service Utilisation
-- FILE: Data Cleaning and Preparation
-- DATASET: Synthetic Healthcare Patient Encounters
-- DATABASE: healthcare_eda
-- TABLE: patient_encounters
-- TOTAL RECORDS: 2,000

USE healthcare_eda;


-- =====================================================
-- 1. INITIAL DATA INSPECTION
-- =====================================================

-- Inspect table structure
DESCRIBE patient_encounters;

-- Count total records
SELECT COUNT(*) AS Total_Records
FROM patient_encounters;

-- Preview first 10 records
SELECT *
FROM patient_encounters
LIMIT 10;


-- =====================================================
-- 2. CHECK UNIQUE IDENTIFIERS
-- =====================================================

-- Check unique encounter IDs
SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Encounter_ID) AS Unique_Encounters
FROM patient_encounters;

-- Check unique patients
SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Patient_ID) AS Unique_Patients
FROM patient_encounters;


-- =====================================================
-- 3. CHECK MISSING VALUES
-- =====================================================

SELECT
    SUM(Patient_ID IS NULL) AS Missing_Patient_ID,
    SUM(Age IS NULL) AS Missing_Age,
    SUM(Sex IS NULL) AS Missing_Sex,
    SUM(LGA IS NULL) AS Missing_LGA,
    SUM(Facility IS NULL) AS Missing_Facility,
    SUM(Diagnosis IS NULL) AS Missing_Diagnosis,
    SUM(Admission_Date IS NULL) AS Missing_Admission_Date,
    SUM(Encounter_Type IS NULL) AS Missing_Encounter_Type,
    SUM(Outcome IS NULL) AS Missing_Outcome,
    SUM(Treatment_Cost IS NULL) AS Missing_Treatment_Cost
FROM patient_encounters;


-- =====================================================
-- 4. CONVERT ADMISSION DATE
-- =====================================================

-- Convert text dates from DD/MM/YYYY to DATE format
UPDATE patient_encounters
SET Admission_Date_Clean =
    STR_TO_DATE(Admission_Date, '%d/%m/%Y')
WHERE Admission_Date IS NOT NULL;

-- Verify date conversion
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(Admission_Date_Clean) AS Converted_Dates,
    SUM(Admission_Date_Clean IS NULL) AS Missing_Dates
FROM patient_encounters;

-- Check date range
SELECT
    MIN(Admission_Date_Clean) AS Earliest_Date,
    MAX(Admission_Date_Clean) AS Latest_Date
FROM patient_encounters;


-- =====================================================
-- 5. CONVERT TREATMENT COST
-- =====================================================

-- Remove currency symbol and commas, then convert to DECIMAL
UPDATE patient_encounters
SET Treatment_Cost_Clean =
    CAST(
        REPLACE(
            REPLACE(Treatment_Cost, '₦', ''),
            ',',
            ''
        ) AS DECIMAL(12,2)
    )
WHERE Treatment_Cost IS NOT NULL;

-- Verify treatment cost conversion
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(Treatment_Cost_Clean) AS Converted_Costs,
    SUM(Treatment_Cost_Clean IS NULL) AS Missing_Costs
FROM patient_encounters;


-- =====================================================
-- 6. CHECK AGE AND TREATMENT COST RANGES
-- =====================================================

SELECT
    MIN(Age) AS Minimum_Age,
    MAX(Age) AS Maximum_Age,
    MIN(Treatment_Cost_Clean) AS Minimum_Cost,
    MAX(Treatment_Cost_Clean) AS Maximum_Cost
FROM patient_encounters;


-- =====================================================
-- 7. FINAL DATA QUALITY CHECK
-- =====================================================

-- Check for duplicate encounter IDs
SELECT
    Encounter_ID,
    COUNT(*) AS ID_Count
FROM patient_encounters
GROUP BY Encounter_ID
HAVING COUNT(*) > 1;

-- Check missing values in cleaned analytical columns
SELECT
    SUM(Patient_ID IS NULL) AS Missing_Patient_ID,
    SUM(Age IS NULL) AS Missing_Age,
    SUM(Sex IS NULL) AS Missing_Sex,
    SUM(LGA IS NULL) AS Missing_LGA,
    SUM(Facility IS NULL) AS Missing_Facility,
    SUM(Diagnosis IS NULL) AS Missing_Diagnosis,
    SUM(Admission_Date_Clean IS NULL) AS Missing_Date,
    SUM(Encounter_Type IS NULL) AS Missing_Encounter_Type,
    SUM(Outcome IS NULL) AS Missing_Outcome,
    SUM(Treatment_Cost_Clean IS NULL) AS Missing_Treatment_Cost
FROM patient_encounters;
