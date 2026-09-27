-- overall attrition rate
SELECT
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
    COUNT(*) AS total_employees,
    ROUND(100.0 * COUNT(*) FILTER (WHERE attrition = 'Yes') / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees;

-- attrition rate by department
SELECT
    department,
    COUNT(*) AS headcount,
    COUNT(*) FILTER (WHERE attrition = 'Yes') AS left_count,
    ROUND(100.0 * COUNT(*) FILTER (WHERE attrition = 'Yes') / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees
GROUP BY department
ORDER BY attrition_rate_pct DESC;

-- attrition rate by job role
SELECT
    job_role,
    COUNT(*) AS headcount,
    ROUND(100.0 * COUNT(*) FILTER (WHERE attrition = 'Yes') / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees
GROUP BY job_role
ORDER BY attrition_rate_pct DESC;

-- attrition by over_time status
SELECT
    over_time,
    COUNT(*) AS headcount,
    ROUND(100.0 * COUNT(*) FILTER (WHERE attrition = 'Yes') / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees
GROUP BY over_time;

-- attrition by job satisfaction level
SELECT
    job_satisfaction_label,
    COUNT(*) AS headcount,
    ROUND(100.0 * COUNT(*) FILTER (WHERE attrition = 'Yes') / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees
GROUP BY job_satisfaction_label
ORDER BY attrition_rate_pct DESC;

-- average income by department vs attrition
SELECT
    department,
    attrition,
    ROUND(AVG(monthly_income), 0) AS avg_monthly_income
FROM hr_employees
GROUP BY department, attrition
ORDER BY department, attrition;

-- attrition by age band
SELECT
    age_band,
    COUNT(*) AS headcount,
    ROUND(100.0 * COUNT(*) FILTER (WHERE attrition = 'Yes') / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees
GROUP BY age_band
ORDER BY age_band;

-- years since promotion vs attrition
SELECT
    attrition,
    ROUND(AVG(years_since_last_promotion), 2) AS avg_years_since_promotion,
    ROUND(AVG(years_at_company), 2) AS avg_tenure
FROM hr_employees
GROUP BY attrition;