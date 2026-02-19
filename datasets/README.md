# Dataset Description

This project uses three relational datasets structured to simulate healthcare operations data.

---

##  patients.csv
Contains demographic information of patients.

Columns:
- patient_id (Primary Key)
- name
- age
- gender
- city

---

##  hospitals.csv
Contains hospital information.

Columns:
- hospital_id (Primary Key)
- hospital_name
- city
- bed_capacity

---

##  treatments.csv
Contains treatment-level transactional data.

Columns:
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

The tables are connected using primary and foreign key relationships.

