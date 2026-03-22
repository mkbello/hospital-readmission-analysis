# Hospital Readmission Analysis Report 

**Author:** Muktar Bello  
**Date:** February 22, 2026  

---

## Project Overview

The **Hospital Readmission Analysis Project** investigates patterns in patient recovery and hospital readmission using the **Diabetes 130-US Hospitals for Years 1999–2008 Dataset** from [Kaggle](https://www.kaggle.com/).

The project aims to:

1. Identify **the most effective diabetes treatments** for different patient groups.  
2. Analyze **factors influencing early hospital readmission**.  
3. Examine **how demographics (age, gender, race) affect recovery outcomes**.  

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

## Analysis & Findings

### Factors Influencing Early Readmission

**Length of Stay**
- Longer hospital stays are associated with higher early readmission rates.
- Likely reflects severity of illness or complications.

**Number of Diagnoses**
- Patients with multiple diagnoses show significantly higher readmission rates.
- Comorbidities increase treatment complexity.

**Number of Procedures**
- Procedure count alone does not consistently increase readmission risk.
- Suggests quality of care may be more influential than procedure volume.

**Number of Medications**
- Higher medication counts correlate with increased readmission likelihood.
- Complex regimens may affect adherence and recovery.

---

### Demographic Impact on Recovery

**Age**
- Younger patients demonstrate higher recovery success rates.
- Patients aged 80+ show lower recovery rates and higher readmission risk.

**Gender**
- Slight differences observed in recovery success between genders.

**Race**
- Recovery outcomes vary across racial groups.
- Indicates demographic influence on treatment effectiveness.

---

### Treatment Effectiveness

**Metformin**
- Generally associated with lower early readmission.
- Exception observed in patients aged 80+.

**Insulin**
- Non-use associated with lower readmission in most groups.
- Some subgroups benefit from reduced dosing.

**Glipizide**
- Non-use consistently corresponds to lower readmission rates.

These findings highlight the importance of personalized treatment strategies.

---

## Strategic Recommendations

1. Implement risk-based discharge planning for high-risk patients.
2. Develop age-specific treatment protocols, especially for elderly populations.
3. Personalize treatment strategies based on demographic patterns.
4. Strengthen medication reconciliation and simplify drug regimens.
5. Continuously monitor readmission trends using BI tools.

---

## Conclusion

Early hospital readmission is primarily influenced by patient complexity, age, and medication burden. 

Treatment effectiveness varies across demographic groups, emphasizing the need for data-driven and personalized healthcare strategies.

These insights support improved discharge planning and optimized treatment decisions.

---

## Limitations

1. **Observational Data** – Identifies associations, not causal relationships.  
2. **Historical Dataset** – Covers 1999–2008; findings may not reflect current clinical practices.  
3. **Small Subgroups** – Some demographic or treatment groups have few patients, which may exaggerate trends.  
4. **Limited Variables** – Lacks contextual factors like socioeconomic status, insurance, and post-discharge care.  
5. **Simplified Indicators** – Medication and treatment variables use simplified categories, which may not capture clinical nuance.  
6. **Generalizability** – Results reflect 130 U.S. hospitals and may not apply to other regions or populations.  

> Insights should be interpreted as patterns and associations, not definitive clinical conclusions.
