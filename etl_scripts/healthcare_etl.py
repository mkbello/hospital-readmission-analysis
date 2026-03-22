"""
ETL Script: Diabetic Patients Data Pipeline

This script performs an ETL process for diabetic patient records:
1. EXTRACT: Loads raw CSV data.
2. TRANSFORM: Cleans, standardizes, and structures data.
3. LOAD: Inserts processed data into PostgreSQL database tables.

Tables created:
- patients
- encounters
- diagnoses
- treatments
- outcomes
"""

# ---------------------------
# IMPORT LIBRARIES
# ---------------------------
import pandas as pd
from sqlalchemy import create_engine
import urllib.parse

# ---------------------------
# EXTRACT
# ---------------------------
# Load raw data from CSV
df = pd.read_csv("diabetic_data.csv")

# ---------------------------
# TRANSFORM
# ---------------------------

# Handle missing values: Replace "?" with None
df = df.replace('?', None)

# Standardize formats: remove leading/trailing spaces from 'age' column
df['age'] = df['age'].str.strip()

# Clean gender column
df['gender'] = df['gender'].str.strip()

# Keep only valid genders
valid_genders = ['Male', 'Female']
df = df[df['gender'].isin(valid_genders)]

# Remove duplicate patients based on 'patient_nbr'
df = df.drop_duplicates(subset=['patient_nbr'])

# Extract Patients table (unique patient info)
patients = df[['patient_nbr', 'race', 'gender',
               'age', 'weight']].drop_duplicates()

# Extract Encounters table (hospital stay info)
encounters = df[['encounter_id', 'patient_nbr', 'admission_type_id',
                 'discharge_disposition_id', 'admission_source_id', 'time_in_hospital',
                 'payer_code', 'medical_specialty', 'number_outpatient',
                 'number_emergency', 'number_inpatient']]

# Extract Diagnoses table
diagnoses = df[['encounter_id', 'diag_1',
                'diag_2', 'diag_3', 'number_diagnoses']]

# Extract Treatments table
treatments = df[['encounter_id', 'metformin', 'insulin', 'glipizide', 'glyburide',
                 'change', 'diabetesMed']]

# Extract Outcomes table (readmission and lab results)
outcomes = df[['encounter_id', 'readmitted', 'max_glu_serum', 'A1Cresult']]

# ---------------------------
# LOAD (DATABASE)
# ---------------------------

# Encode password safely (handles special characters)
password = urllib.parse.quote_plus("Password123@_")

# Create database connection to PostgreSQL
engine = create_engine(
    f"postgresql+psycopg2://postgres:{password}@localhost:5432/healthcare_project"
)

# Load tables into database
patients.to_sql("patients", engine, if_exists="append", index=False)
encounters.to_sql("encounters", engine, if_exists="append", index=False)
diagnoses.to_sql("diagnoses", engine, if_exists="append", index=False)
treatments.to_sql("treatments", engine, if_exists="append", index=False)
outcomes.to_sql("outcomes", engine, if_exists="append", index=False)

print("ETL process completed successfully!")
