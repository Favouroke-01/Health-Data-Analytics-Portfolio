-- PROJECT: Understanding Disease Burden and Healthcare Service Utilisation
-- DATASET: Synthetic Healthcare Patient Encounters
-- TOTAL RECORDS: 2,000
-- TOOL: MySQL
-- PURPOSE: Exploratory Data Analysis

USE healthcare_eda;
-- 1. Disease Distribution

SELECT
    Diagnosis,
    COUNT(*) AS Total_Cases
FROM patient_encounters
GROUP BY Diagnosis
ORDER BY Total_Cases DESC;


-- 2. Age Group Distribution

SELECT
    CASE
        WHEN Age BETWEEN 0 AND 17 THEN 'Children'
        WHEN Age BETWEEN 18 AND 35 THEN 'Young adults'
        WHEN Age BETWEEN 36 AND 59 THEN 'Middle-aged adults'
        ELSE 'Older adults'
    END AS Age_Group,
    COUNT(*) AS Total_Encounters
FROM patient_encounters
GROUP BY Age_Group
ORDER BY Total_Encounters DESC;
-- 3. Encounter Distribution by LGA

SELECT
    LGA,
    COUNT(*) AS Total_Encounters
FROM patient_encounters
GROUP BY LGA
ORDER BY Total_Encounters DESC;


-- 4. Facility Utilisation

SELECT
    Facility,
    COUNT(*) AS Total_Encounters
FROM patient_encounters
GROUP BY Facility
ORDER BY Total_Encounters DESC;
-- 5. Monthly Encounter Trends

SELECT
    DATE_FORMAT(Admission_Date_Clean, '%Y-%m') AS Encounter_Month,
    COUNT(*) AS Total_Encounters
FROM patient_encounters
GROUP BY Encounter_Month
ORDER BY Encounter_Month;
-- 6. Treatment Cost Analysis by Diagnosis

SELECT
    Diagnosis,
    COUNT(*) AS Total_Encounters,
    ROUND(AVG(Treatment_Cost_Clean), 2) AS Average_Treatment_Cost,
    SUM(Treatment_Cost_Clean) AS Total_Treatment_Cost
FROM patient_encounters
GROUP BY Diagnosis
ORDER BY Average_Treatment_Cost DESC;
-- 7. Treatment Cost Analysis by Facility

SELECT
    Facility,
    COUNT(*) AS Total_Encounters,
    ROUND(AVG(Treatment_Cost_Clean), 2) AS Average_Treatment_Cost,
    SUM(Treatment_Cost_Clean) AS Total_Treatment_Cost
FROM patient_encounters
GROUP BY Facility
ORDER BY Average_Treatment_Cost DESC;
-- 8. Encounter Outcomes

SELECT
    Outcome,
    COUNT(*) AS Total_Encounters
FROM patient_encounters
GROUP BY Outcome
ORDER BY Total_Encounters DESC;