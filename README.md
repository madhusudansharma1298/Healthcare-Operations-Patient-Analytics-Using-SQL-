#  Healthcare Operations & Patient Analytics Using SQL

## Project Overview
Healthcare organizations generate massive amounts of operational and treatment data. This project applies SQL-based analytics to extract actionable insights related to patient demographics, disease distribution, hospital revenue performance, and treatment outcomes.

The goal of this analysis is to support data-driven decision-making in healthcare management.

---

## Business Problem
Hospital administrators often struggle with:
- Unequal workload distribution
- Lack of revenue visibility
- Poor cost management
- Inefficient capacity planning
- Limited treatment outcome evaluation

This project solves these issues using structured SQL analysis.

---

## Tools & Technologies Used
- MySQL
- SQL Joins (INNER JOIN)
- Aggregate Functions (SUM, COUNT, AVG)
- CASE Statements
- GROUP BY & ORDER BY
- Date Functions (DATEDIFF)
- Relational Data Modeling

---

## Database Schema

### Patients Table
- patient_id (Primary Key)
- name
- age
- gender
- city

### Hospitals Table
- hospital_id (Primary Key)
- hospital_name
- city
- bed_capacity

### Treatments Table
- treatment_id (Primary Key)
- patient_id (Foreign Key)
- hospital_id (Foreign Key)
- doctor
- disease
- admission_date
- discharge_date
- cost
- outcome

---

## Dataset Information

The project uses three relational datasets:

- patients.csv
- hospitals.csv
- treatments.csv

The datasets simulate healthcare operations data and are structured using primary and foreign key relationships.

---

## Key Analysis Performed

### Patient Demographics Analysis
Analyzed gender distribution and average age trends.

### Disease Frequency Analysis
Identified high-burden diseases affecting infrastructure demand.

### Revenue Contribution by Hospital
Evaluated hospital-wise revenue and patient volume.

### Treatment Cost Segmentation
Classified cases into Low / Medium / High cost categories.

### Treatment Success Rate Analysis
Measured recovery percentage across hospitals.

### Length of Stay (LOS) Analysis
Identified diseases driving higher bed occupancy.

---

## Key Business Insights
- Identified top revenue-generating hospitals
- Highlighted cost-intensive diseases
- Detected uneven doctor workload distribution
- Found high-LOS conditions impacting bed management
- Provided strategic recommendations for operational optimization

---

## Project Files
- Healthcare_Operations_SQL_Project.pdf (Detailed Case Study)
- healthcare_analysis_queries.sql (Complete SQL Queries)

---

## Future Enhancements
- Power BI Dashboard for visualization
- Predictive ML model for readmission risk
- Real-time hospital performance monitoring system

---

### Author: Madhusudan
### PGA – Data Science & Analytics  
