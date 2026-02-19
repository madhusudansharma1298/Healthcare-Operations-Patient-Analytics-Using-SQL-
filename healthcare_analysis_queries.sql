use sql_project
select * from hospitals
select * from patients
select * from treatments

-- Identify who the hospital is serving the most (age + gender)

SELECT gender,
       COUNT(*) AS total_patients,
       ROUND(AVG(age),0) AS avg_age
FROM patients
GROUP BY gender;

-- Determine which cities generate the highest patient inflow

SELECT city, COUNT(*) AS patient_volume
FROM patients
GROUP BY city
ORDER BY patient_volume DESC;

-- Identify diseases with the highest hospitalisation count.

SELECT disease, COUNT(*) AS total_cases
FROM treatments
GROUP BY disease
ORDER BY total_cases DESC;

-- Identify which diseases require the greatest financial resources.

SELECT disease, ROUND(AVG(cost),2) AS avg_treatment_cost
FROM treatments
GROUP BY disease
ORDER BY avg_treatment_cost DESC;

-- Find whether patient allocation is balanced across doctors.

SELECT doctor, COUNT(*) AS total_patients
FROM treatments
GROUP BY doctor
ORDER BY total_patients DESC;

-- Some Advanced Case Studies

-- Identify which hospitals generate the highest revenue

SELECT 
    h.hospital_name,
    SUM(t.cost) AS total_revenue,
    COUNT(t.treatment_id) AS total_cases
FROM hospitals h
JOIN treatments t USING(hospital_id)
GROUP BY h.hospital_name
ORDER BY total_revenue DESC;

-- Compare pricing across hospitals.

SELECT 
    h.hospital_name,
    ROUND(AVG(t.cost),2) AS avg_cost,
    MIN(t.cost) AS min_cost,
    MAX(t.cost) AS max_cost
FROM hospitals h
JOIN treatments t USING(hospital_id)
GROUP BY h.hospital_name
ORDER BY avg_cost DESC;

-- Measure healthcare effectiveness across hospitals.

SELECT 
    h.hospital_name,
    COUNT(*) AS total_cases,
    SUM(CASE WHEN outcome = 'Recovered' THEN 1 ELSE 0 END) AS recovered_count,
    ROUND(
        SUM(CASE WHEN outcome='Recovered' THEN 1 ELSE 0 END)*100.0/COUNT(*),
        2
    ) AS success_rate
FROM treatments t 
JOIN hospitals h USING(hospital_id)
GROUP BY h.hospital_name
ORDER BY success_rate DESC;


-- Analyse treatment cost distribution across the dataset.

SELECT 
    CASE
        WHEN cost < 30000 THEN 'Low Cost'
        WHEN cost BETWEEN 30000 AND 70000 THEN 'Medium Cost'
        ELSE 'High Cost'
    END AS cost_category,
    COUNT(*) AS case_count,
    ROUND(AVG(cost),2) AS avg_cost
FROM treatments
GROUP BY cost_category
ORDER BY avg_cost DESC;

-- Which cities bring the highest revenue and patient traffic to the hospital network?

SELECT 
    p.city,
    COUNT(t.treatment_id) AS total_visits,
    SUM(t.cost) AS total_revenue,
    ROUND(AVG(t.cost), 2) AS avg_revenue_per_visit
FROM patients p
JOIN treatments t USING (patient_id)
GROUP BY p.city
ORDER BY total_revenue DESC;

-- Which diseases keep patients admitted for longer, increasing bed occupancy and cost?

SELECT
    t.disease,
    COUNT(*) AS total_cases,
    ROUND(AVG(DATEDIFF(t.discharge_date, t.admission_date)), 2) AS avg_stay_days,
    ROUND(AVG(t.cost), 2) AS avg_cost
FROM treatments t
WHERE t.discharge_date IS NOT NULL
GROUP BY t.disease
ORDER BY avg_stay_days DESC;
