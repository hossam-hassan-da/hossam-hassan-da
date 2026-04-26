-- ========================================
-- Analysis 1: Medication by Medical Condition (Matrix)
-- ========================================
SELECT 
    H.Medication,
    COUNT(CASE WHEN P.Medical_Condition = 'Arthritis' THEN H.Medication END) AS Arthritis,
    COUNT(CASE WHEN P.Medical_Condition = 'Asthma' THEN H.Medication END) AS Asthma,
    COUNT(CASE WHEN P.Medical_Condition = 'Diabetes' THEN H.Medication END) AS Diabetes,
    COUNT(CASE WHEN P.Medical_Condition = 'Hypertension' THEN H.Medication END) AS Hypertension,
    COUNT(CASE WHEN P.Medical_Condition = 'Obesity' THEN H.Medication END) AS Obesity
FROM hospital_doctors_data H
JOIN patient_data P ON P.patient_id = H.hospital_id
GROUP BY H.Medication;

-- ========================================
-- Analysis 2: Cases Distribution by Age Group
-- ========================================
WITH AGE_DATA AS (
    SELECT 
        CASE 
            WHEN Age < 30 THEN 'Under 30'
            WHEN Age BETWEEN 30 AND 39 THEN '30-39'
            WHEN Age BETWEEN 40 AND 49 THEN '40-49'
            WHEN Age BETWEEN 50 AND 59 THEN '50-59'
            WHEN Age BETWEEN 60 AND 69 THEN '60-69'
            WHEN Age BETWEEN 70 AND 79 THEN '70-79'
            ELSE '80+'
        END AS Age_Group,
        COUNT(patient_name) as cases_number
    FROM patient_data
    GROUP BY Age_Group
)
SELECT * 
FROM AGE_DATA
GROUP BY Age_Group
ORDER BY cases_number DESC;

-- ========================================
-- Analysis 3: Cases Number by Insurance Provider
-- ========================================
SELECT 
    S.Insurance_provider,
    COUNT(P.patient_name) as cases_number
FROM insurance_data S
JOIN patient_data P ON P.patient_id = S.insurance_id
GROUP BY S.Insurance_provider
ORDER BY cases_number DESC;

-- ========================================
-- Analysis 4: Total Cost by Insurance Provider
-- ========================================
SELECT 
    S.Insurance_provider,
    ROUND(SUM(F.Billing_amount), 0) AS TOTAL_PROFIT
FROM insurance_data S
JOIN fact_table F ON S.insurance_id = F.fact_id
GROUP BY S.Insurance_provider
ORDER BY TOTAL_PROFIT DESC;

-- ========================================
-- Analysis 5: Total Cost by Admission Type
-- ========================================
SELECT 
    H.Admission_type,
    ROUND(SUM(F.Billing_amount), 0) AS total_profit
FROM hospital_doctors_data H
JOIN fact_table F ON H.hospital_id = F.fact_id
GROUP BY H.Admission_type
ORDER BY total_profit DESC;

-- ========================================
-- Analysis 6: Cases Number by Admission Type
-- ========================================
SELECT 
    H.Admission_type,
    COUNT(P.patient_name) AS CASES_NUMBER
FROM hospital_doctors_data H
JOIN patient_data P ON P.patient_id = H.hospital_id
GROUP BY H.Admission_type
ORDER BY CASES_NUMBER DESC;

-- ========================================
-- Analysis 7: Yearly Trends (Cases & Cost)
-- ========================================
SELECT 
    YEAR(D.Date_of_admission) AS year,
    COUNT(P.patient_name) as cases_number,
    ROUND(SUM(F.Billing_amount), 0) as total_profit
FROM date_table D
JOIN patient_data P ON P.patient_id = D.date_id
JOIN fact_table F ON F.fact_id = D.date_id
GROUP BY year
ORDER BY year;

-- ========================================
-- Analysis 8: Insurance Provider Performance by Year
-- ========================================
SELECT 
    S.Insurance_provider,
    YEAR(D.Date_of_admission) as year,
    ROUND(SUM(F.Billing_amount), 0) AS TOTAL_PROFIT
FROM insurance_data S
JOIN fact_table F ON S.insurance_id = F.fact_id
JOIN date_table D ON D.date_id = F.fact_id
GROUP BY S.Insurance_provider, year
ORDER BY year, TOTAL_PROFIT DESC;

-- ========================================
-- Analysis 9: Monthly Medical Cost Trends
-- ========================================
SELECT 
    MONTHNAME(D.Date_of_admission) AS MONTH,
    COUNT(P.patient_name) AS CASES_NUMBER,
    ROUND(SUM(F.Billing_amount), 0) AS MEDICAL_COST
FROM date_table D
JOIN patient_data P ON P.patient_id = D.date_id
JOIN fact_table F ON F.fact_id = D.date_id
GROUP BY MONTH
ORDER BY MEDICAL_COST;