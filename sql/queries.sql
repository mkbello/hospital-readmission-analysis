-- ==================================================
-- queries.sql
-- Healthcare Data Analysis Project
-- Purpose: Analyze patient treatments, readmission rates, and recovery outcomes
-- Readmission categories: 
--   NO = not readmitted
--   >30 = readmitted after 30 days (considered successful for analysis)
--   <30 = readmitted within 30 days (high-risk / failure)
-- ==================================================

-- ===============================================
-- Q1: Which treatments are most effective for different patient groups?
-- Metric: Success treatment = patients NOT readmitted within 30 days (NO or >30), failure = <30
-- ===============================================

-- Effectiveness of Treatments (metformin, insulin, glipizide, glyburide)
SELECT 
    t.metformin,
    t.insulin,
    t.glipizide,
    t.glyburide,

    COUNT(*) AS total_patients,

    SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) AS successful_treatments,
    SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) AS failed_treatments,

    ROUND(
        SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS success_rate_percent,

    ROUND(
        SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_percent

FROM treatments t
JOIN encounters e ON t.encounter_id = e.encounter_id
JOIN outcomes o ON e.encounter_id = o.encounter_id

GROUP BY t.metformin, t.insulin, t.glipizide, t.glyburide
HAVING COUNT(*) > 30
ORDER BY success_rate_percent DESC;


-- Treatment Effectiveness by Age
SELECT 
    p.age,
    t.metformin,
    t.insulin,
    t.glipizide,
    t.glyburide,

    COUNT(*) AS total_patients,

    SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) AS successful_treatments,
    SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) AS failed_treatments,

    ROUND(
        SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS success_rate_percent,

    ROUND(
        SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_percent

FROM patients p
JOIN encounters e ON p.patient_nbr = e.patient_nbr
JOIN treatments t ON e.encounter_id = t.encounter_id
JOIN outcomes o ON e.encounter_id = o.encounter_id

GROUP BY p.age, t.metformin, t.insulin, t.glipizide, t.glyburide
HAVING COUNT(*) > 20
ORDER BY success_rate_percent DESC;

-- Treatment Effectiveness by Gender
SELECT 
    p.gender,
    t.metformin,
    t.insulin,
    t.glipizide,
    t.glyburide,

    COUNT(*) AS total_patients,

    SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) AS successful_treatments,
    SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) AS failed_treatments,

    ROUND(
        SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS success_rate_percent,

    ROUND(
        SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_percent

FROM patients p
JOIN encounters e ON p.patient_nbr = e.patient_nbr
JOIN treatments t ON e.encounter_id = t.encounter_id
JOIN outcomes o ON e.encounter_id = o.encounter_id

GROUP BY p.gender, t.metformin, t.insulin, t.glipizide, t.glyburide
HAVING COUNT(*) > 20
ORDER BY success_rate_percent DESC;

-- Treatment Effectiveness by Race
SELECT 
    p.race,
    t.metformin,
    t.insulin,
    t.glipizide,
    t.glyburide,

    COUNT(*) AS total_patients,

    SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) AS successful_treatments,
    SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) AS failed_treatments,

    ROUND(
        SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS success_rate_percent,

    ROUND(
        SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS failure_rate_percent

FROM patients p
JOIN encounters e ON p.patient_nbr = e.patient_nbr
JOIN treatments t ON e.encounter_id = t.encounter_id
JOIN outcomes o ON e.encounter_id = o.encounter_id

GROUP BY p.race, t.metformin, t.insulin, t.glipizide, t.glyburide
HAVING COUNT(*) > 20
ORDER BY success_rate_percent DESC;


-- ===============================================
-- Q2: What factors influence hospital readmission rate?
-- Metric: Early readmission = <30 days
-- ===============================================

-- Length of Hospital Stay
SELECT 
    e.time_in_hospital,

    COUNT(*) AS total_patients,

    SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) 
        AS early_readmissions,

    ROUND(
        SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 
        2
    ) AS early_readmission_rate_percent

FROM encounters e
JOIN outcomes o ON e.encounter_id = o.encounter_id

GROUP BY e.time_in_hospital
HAVING COUNT(*) > 30
ORDER BY early_readmission_rate_percent DESC;


-- Number of Diagnoses
SELECT 
    d.number_diagnoses,

    COUNT(*) AS total_patients,

    SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) 
        AS early_readmissions,

    ROUND(
        SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 
        2
    ) AS early_readmission_rate_percent

FROM diagnoses d
JOIN encounters e ON d.encounter_id = e.encounter_id
JOIN outcomes o ON e.encounter_id = o.encounter_id

GROUP BY d.number_diagnoses
HAVING COUNT(*) > 30
ORDER BY early_readmission_rate_percent DESC;


-- Number of Emergency Visits
SELECT 
    e.number_emergency,

    COUNT(*) AS total_patients,

    SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) 
        AS early_readmissions,

    ROUND(
        SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 
        2
    ) AS early_readmission_rate_percent

FROM encounters e
JOIN outcomes o ON e.encounter_id = o.encounter_id

GROUP BY e.number_emergency
HAVING COUNT(*) > 30
ORDER BY early_readmission_rate_percent DESC;


-- Q3: How do demographics (age, gender, race) affect recovery outcomes?
-- Metrics: Recovery success = NO or >30, failure = <30
-- ===============================================

-- Recovery Outcomes by Age
SELECT 
    p.age,

    COUNT(*) AS total_patients,

    SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) AS recovery_success,
    SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) AS recovery_failure,

    ROUND(
        SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS recovery_success_rate_percent,

    ROUND(
        SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS recovery_failure_rate_percent

FROM patients p
JOIN encounters e ON p.patient_nbr = e.patient_nbr
JOIN outcomes o ON e.encounter_id = o.encounter_id

GROUP BY p.age
ORDER BY recovery_success_rate_percent DESC;

-- Recovery Outcomes by Gender
SELECT 
    p.gender,

    COUNT(*) AS total_patients,

    SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) AS recovery_success,
    SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) AS recovery_failure,

    ROUND(
        SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS recovery_success_rate_percent,

    ROUND(
        SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS recovery_failure_rate_percent

FROM patients p
JOIN encounters e ON p.patient_nbr = e.patient_nbr
JOIN outcomes o ON e.encounter_id = o.encounter_id

GROUP BY p.gender
ORDER BY recovery_success_rate_percent DESC;

-- Recovery Outcomes by Race
SELECT 
    p.race,

    COUNT(*) AS total_patients,

    SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) AS recovery_success,
    SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) AS recovery_failure,

    ROUND(
        SUM(CASE WHEN o.readmitted IN ('NO', '>30') THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS recovery_success_rate_percent,

    ROUND(
        SUM(CASE WHEN o.readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS recovery_failure_rate_percent

FROM patients p
JOIN encounters e ON p.patient_nbr = e.patient_nbr
JOIN outcomes o ON e.encounter_id = o.encounter_id

GROUP BY p.race
ORDER BY recovery_success_rate_percent DESC;
