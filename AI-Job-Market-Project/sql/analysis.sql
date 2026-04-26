-- ========================================
-- Analysis 1: Job Count by Remote Type
-- ========================================
SELECT remote_type,
       COUNT(remote_type) as number_of_jobs
FROM job_description
GROUP BY remote_type
ORDER BY number_of_jobs DESC;

-- ========================================
-- Analysis 2: Required Skills by Job Title
-- ========================================
SELECT J.job_title,
       SUM(S.skills_python) AS number_of_required_python,
       SUM(S.skills_sql) AS number_of_required_sql,
       SUM(S.skills_ml) AS number_of_required_ml,
       SUM(S.skills_deep_learning) AS number_of_required_deep_learning,
       SUM(S.skills_cloud) AS number_of_required_cloud
FROM job_description J
JOIN technical_job_required_skills S ON J.job_id = S.job_id
GROUP BY J.job_title
ORDER BY J.job_title;

-- ========================================
-- Analysis 3: Average Salary by Job Title and Education Level
-- ========================================
SELECT job_title, education_level,
       ROUND(AVG(salary), 0) as avg_salary_per_job
FROM job_description
GROUP BY job_title, education_level
ORDER BY job_title, avg_salary_per_job DESC;

-- ========================================
-- Analysis 4: Average Salary by Company Size
-- ========================================
SELECT C.company_size,
       ROUND(AVG(J.salary), 0) AS AVG_SALARY
FROM company_table C
JOIN job_description J ON C.company_id = J.job_id
GROUP BY C.company_size
ORDER BY AVG_SALARY DESC;

-- ========================================
-- Analysis 5: Average Salary by Company Industry
-- ========================================
SELECT C.company_industry,
       COUNT(C.company_id) as job_opportunities,
       ROUND(AVG(J.salary), 0) AS salary
FROM company_table C
JOIN job_description J ON C.company_id = J.job_id
GROUP BY C.company_industry
ORDER BY job_opportunities DESC;

-- ========================================
-- Analysis 6: Average Salary by Country
-- ========================================
SELECT C.country,
       COUNT(C.company_id) as job_opportunities,
       ROUND(AVG(J.salary), 0) AS salary
FROM company_table C
JOIN job_description J ON C.company_id = J.job_id
GROUP BY C.country
ORDER BY job_opportunities DESC;

-- ========================================
-- Analysis 7: Job Opportunities and Salary by Year
-- ========================================
SELECT D.job_posting_year,
       SUM(C.job_openings) AS job_opportunities,
       ROUND(AVG(J.salary), 0) AS salary
FROM date_table D
JOIN company_table C ON D.job_id = C.company_id
JOIN job_description J ON D.job_id = J.job_id
GROUP BY D.job_posting_year
ORDER BY D.job_posting_year;

-- ========================================
-- Analysis 8: Average Salary by Hiring Urgency
-- ========================================
SELECT C.hiring_urgency,
       ROUND(AVG(J.salary), 0) as salary
FROM company_table C
JOIN job_description J ON C.company_id = J.job_id
GROUP BY C.hiring_urgency
ORDER BY salary DESC;