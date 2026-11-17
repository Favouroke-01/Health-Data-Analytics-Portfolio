# Healthcare Disease Burden and Service Utilisation Analysis

## Project Overview

This project explores healthcare encounter patterns, disease distribution, patient demographics, healthcare facility utilisation and treatment costs using a synthetic healthcare dataset containing 2,000 encounter records.

The analysis uses Excel, MySQL and Power BI to demonstrate data cleaning, validation, exploratory data analysis and dashboard development.

**Important:** The dataset is entirely synthetic. It does not contain real patient records or represent actual healthcare statistics from Nigeria.

## Business Problem

Healthcare managers need organised information to understand recorded disease patterns, patient service utilisation and treatment costs.

This project examines these areas through structured data analysis and interactive visualisation.

## Project Objectives

- Identify diagnoses with the highest recorded encounter counts.
- Examine encounter distribution across age groups.
- Compare recorded encounters across locations.
- Identify facilities with the highest encounter volumes.
- Examine monthly encounter trends.
- Compare average and total treatment costs.
- Examine encounter outcomes.

## Dataset Description

The dataset contains 2,000 synthetic healthcare encounter records covering January 2024 to December 2025.

It includes:

- 2,000 unique encounter IDs.
- 1,500 unique fictional patient IDs.
- Five fictional LGAs.
- Ten fictional healthcare facilities.
- Six diagnosis categories.

### Dataset Variables

Encounter_ID, Patient_ID, Age, Sex, LGA, Facility, Diagnosis, Admission_Date, Encounter_Type, Outcome and Treatment_Cost.

## Tools Used

| Tool | Application |
|---|---|
| Microsoft Excel | Data inspection and cleaning |
| MySQL Workbench | Data cleaning, validation and SQL analysis |
| Power BI Desktop | Interactive dashboard development |

## Data Cleaning and Preparation

The following activities were completed:

- Checked all 11 columns for missing values.
- Checked for duplicate records.
- Verified unique encounter and patient IDs.
- Checked age ranges and categorical consistency.
- Converted admission dates into usable date values in MySQL.
- Converted treatment costs from formatted text into numeric values.
- Validated the cleaned dataset.

The final dataset contained 2,000 records with no missing values identified during the checks.

## Exploratory Data Analysis

Eight analytical areas were investigated:

1. Recorded encounters by diagnosis.
2. Recorded encounters by age group.
3. Recorded encounters by LGA.
4. Recorded encounters by healthcare facility.
5. Monthly encounter trends.
6. Average and total treatment cost by diagnosis.
7. Average and total treatment cost by facility.
8. Distribution of encounter outcomes.

## Key Findings

### Disease Distribution

| Diagnosis | Encounters |
|---|---:|
| Malaria | 694 |
| Hypertension | 351 |
| Respiratory infection | 325 |
| Diabetes | 234 |
| Diarrhoeal disease | 200 |
| Typhoid | 196 |

Malaria recorded the highest number of encounters.

### Age Group Distribution

| Age Group | Encounters |
|---|---:|
| Older adults | 821 |
| Middle-aged adults | 449 |
| Young adults | 377 |
| Children | 353 |

Older adults accounted for the largest share of recorded encounters.

### Healthcare Facility Utilisation

New Layout Primary Clinic recorded the highest encounter volume, with 241 encounters.

### Monthly Trends

August 2025 recorded the highest monthly encounter count at 100. November 2025 recorded the lowest at 68.

### Treatment Costs

- Diabetes had the highest average treatment cost at ₦27,711.97.
- Malaria had the highest total treatment cost at ₦8,608,800.
- Akwu General Hospital had the highest average facility treatment cost at ₦21,592.68.

### Encounter Outcomes

- Discharged: 1,848
- Referred: 79
- Admitted: 73

Discharged encounters represented 92.4% of the dataset.

## Power BI Dashboard

The interactive dashboard contains:

- Eight analytical charts.
- Four KPI cards.
- Three interactive slicers for LGA, Diagnosis and Facility.

### Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Encounters | 2,000 |
| Unique Patients | 1,500 |
| Average Treatment Cost | ₦15,569.45 |
| Total Treatment Cost | ₦31,138,900 |

## Project Structure

```text
Healthcare_EDA_Portfolio_Project/
│
├── 01_Raw_Data/
├── 02_Cleaned_Data/
├── 03_SQL_Queries/
│   ├── 01_Data_Cleaning.sql
│   └── 02_Exploratory_Data_Analysis.sql
│
├── 04_Excel_Analysis/
├── 05_PowerBI_Dashboard/
│   └── Healthcare_Disease_Burden_Dashboard.pbix
│
└── 06_Reports_and_Presentation/
```

## Limitations

- The dataset is synthetic and does not represent real healthcare activity.
- Encounter counts do not establish disease prevalence.
- The analysis does not measure population-level disease risk.
- Cost differences do not establish the reasons for differences in healthcare expenditure.
- Encounter outcomes do not independently measure quality of care or treatment effectiveness.

## Conclusion

This project demonstrates the use of Excel, MySQL and Power BI to clean, validate, analyse and visualise healthcare encounter data.

It provides a practical demonstration of healthcare data analytics, exploratory analysis and interactive reporting.

**Project Type:** Healthcare Data Analytics / Exploratory Data Analysis

**Dataset:** Synthetic healthcare encounter data
