# Hospital Readmission Analysis Project

## Project Overview
The **Hospital Readmission Analysis Project** explores patterns in patient recovery and hospital readmissions using the **Diabetes 130-US Hospitals for Years 1999–2008 Dataset** from [Kaggle](https://www.kaggle.com/).  

The project aims to:

1. Identify **the most effective diabetes treatments** for different patient groups.  
2. Analyze **factors influencing early hospital readmission**.  
3. Examine **how demographics (age, gender, race) affect recovery outcomes**.  

Insights from this analysis can help healthcare providers optimize treatments, reduce preventable readmissions, and improve patient recovery outcomes.  

---

## Dataset
- **Source:** Kaggle – Diabetes 130-US Hospitals for Years 1999–2008  
- **Scope:** 130 U.S. hospitals, patient encounters from 1999–2008  
- **Key Features:**  
  - Patient demographics: `age`, `gender`, `race`  
  - Hospital stay: `time_in_hospital`, `num_procedures`, `num_medications`, `number_diagnoses`, `number_emergency`  
  - Treatment information: `metformin`, `glipizide`, `insulin`  
  - Outcomes: `readmitted` (<30 days, >30 days, NO), `successful_recovery`  

---

## Project Structure
```
hospital-readmission-analysis/
│
├── data/ # Raw and cleaned datasets
│ ├── raw/ # Original dataset 
│ └── cleaned/ # Cleaned dataset
├── etl_script/ # Data cleaning, preprocessing, and ETL workflow
├── notebooks/ # Python notebook
│ └── analysis.ipynb
├── powerbI/ # Power BI dashboard file (.pbix)
├── reports/ # Report.md
├── sql/ # SQL scripts for data exploration and aggregation
└── README.md # Project overview

```

---

## Methodology

1. **Data Cleaning & Preprocessing**
   - Handled missing values and standardized formats (e.g., removed leading/trailing spaces in `age` and `gender`).
   - Removed invalid or unknown gender values to ensure accurate demographic analysis.
   - Engineered key variables:
     - `early_readmission` (flag for readmission <30 days)
     - `successful_recovery` (flag for no or late readmission)
     - Age groups (e.g., Young, Middle, Senior, Elderly)
     - Hospital stay categories (Short, Medium, Long, Very Long)
     - Treatment combinations for key diabetes medications

2. **Exploratory Data Analysis**
   - Used Python libraries (Pandas, Numpy, Matplotlib, Seaborn) to summarize and visualize patterns.
   - Calculated early readmission rates, recovery success rates, and treatment effectiveness.

3. **SQL Analysis**
   - Used SQL queries to aggregate data, explore patterns, and validate insights.

4. **Dashboard & Visualization**
   - Created an interactive **Power BI dashboard** to visualize treatment effectiveness, demographic outcomes, and factors influencing readmission.

---

## Power BI Dashboard Pages
- **Page 1: Executive Overview** – Key KPIs: total patients, early readmission rate, recovery rate, and overall trends.  
- **Page 2: Treatment Outcomes** – Medication effectiveness and treatment combinations impacting readmission and recovery.  
- **Page 3: Hospital Factors** – Impact of length of stay, diagnoses count, procedures, and medication burden on readmission risk.  
- **Page 4: Demographics Outcomes** – Recovery and treatment effectiveness by Age, Gender, and Race.  
- **Page 5: Key Insights & Recommendations** – Summary of findings and strategic actions to reduce early readmissions.

---

## Key Insights

### Readmission Drivers
- Longer hospital stays are associated with higher early readmission rates.
- Patients with multiple diagnoses (comorbidities) show significantly increased readmission risk.
- Higher medication counts correlate with greater readmission likelihood.
- Number of procedures alone does not consistently determine readmission risk.

### Demographic Impact
- Younger patients demonstrate higher recovery success rates.
- Patients aged 80+ show lower recovery outcomes and higher readmission rates.
- Recovery patterns vary slightly across gender and racial groups.

### Treatment Effectiveness
- **Metformin** is generally linked to lower early readmission (except for patients aged 80+).
- Reduced or no use of **Insulin** is associated with lower readmission in most groups.
- **Glipizide** non-use consistently corresponds to lower readmission rates.

---

## Recommendations

- Implement risk-based discharge planning for high-complexity patients.
- Develop age-specific treatment strategies, especially for elderly populations.
- Personalize medication plans based on demographic trends.
- Strengthen medication reconciliation and simplify complex regimens.
- Continuously monitor trends using BI dashboards.


---

## Tools & Technologies
- **Python:** Pandas, Numpy, Matplotlib, Seaborn  
- **SQL:** PostgreSQL   
- **Power BI:** Interactive dashboard for visualization  
- **ETL Process:** For cleaning and preparing the dataset  

---

## How to Explore
1. Open notebooks in `notebooks/` to view Python analysis and data preprocessing.  
2. Open `powerbi/Healthcare_Patient_Outcomes_Dashboard.pbix` in Power BI to explore the interactive dashboard.  
3. Open `sql/queries.sql` to see SQL scripts for data aggregation and exploration.  
4. The cleaned dataset is available in `data/cleaned/cleaned_diabetic_dataset.csv` for reproducibility.  

## Author
Muktar Bello  
Date: February 22, 2026

## License
MIT License
