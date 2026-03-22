-- Patients table
CREATE TABLE patients (
    patient_nbr BIGINT PRIMARY KEY,
    race VARCHAR(50),       
    gender VARCHAR(20),     
    age VARCHAR(20),        
    weight VARCHAR(20)      
);

-- Encounters table
CREATE TABLE encounters (
    encounter_id BIGINT PRIMARY KEY,
    patient_nbr BIGINT REFERENCES patients(patient_nbr),
    admission_type_id INT,
    discharge_disposition_id INT,
    admission_source_id INT,
    time_in_hospital INT,
    payer_code VARCHAR(20),
    medical_specialty VARCHAR(100),
    number_outpatient INT,
    number_emergency INT,
    number_inpatient INT
);

-- Diagnoses table
CREATE TABLE diagnoses (
    encounter_id BIGINT REFERENCES encounters(encounter_id),
    diag_1 VARCHAR(20),
    diag_2 VARCHAR(20),
    diag_3 VARCHAR(20),
    number_diagnoses INT
);

-- Treatments table
CREATE TABLE treatments (
    encounter_id BIGINT REFERENCES encounters(encounter_id),
    metformin VARCHAR(10),
    insulin VARCHAR(10),
    glipizide VARCHAR(10),
    glyburide VARCHAR(10),
    change VARCHAR(10),
    "diabetesMed" VARCHAR(10)   -- quoted to preserve exact case from CSV
);

-- Outcomes table
CREATE TABLE outcomes (
    encounter_id BIGINT REFERENCES encounters(encounter_id),
    readmitted VARCHAR(20),     
    max_glu_serum VARCHAR(20),
    "A1Cresult" VARCHAR(20)     
);
