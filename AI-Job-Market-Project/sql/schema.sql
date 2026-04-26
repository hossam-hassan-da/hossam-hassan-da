-- ========================================
-- 1. إنشاء قاعدة البيانات
-- ========================================
CREATE DATABASE AI_Job_Market_Trends;
USE AI_Job_Market_Trends;

-- ========================================
-- 2. إنشاء الجداول (Dimension Tables)
-- ========================================

-- جدول تفاصيل الوظيفة
CREATE TABLE job_description (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    job_title VARCHAR(25),
    remote_type VARCHAR(25),
    experience_level VARCHAR(25),
    education_level VARCHAR(25),
    years_experience INT NOT NULL,
    salary INT NOT NULL
);

-- جدول المهارات التقنية
CREATE TABLE technical_job_required_skills (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    skills_python INT NOT NULL,
    skills_sql INT NOT NULL,
    skills_ml INT NOT NULL,
    skills_deep_learning INT NOT NULL,
    skills_cloud INT NOT NULL
);

-- جدول تفاصيل الشركة
CREATE TABLE company_table (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_size VARCHAR(20),
    company_industry VARCHAR(20),
    country VARCHAR(20),
    hiring_urgency VARCHAR(20),
    job_openings INT NOT NULL
);

-- جدول التاريخ
CREATE TABLE date_table (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    job_posting_mounth VARCHAR(20),
    job_posting_year DATE
);

-- تعديل نوع البيانات في جدول التاريخ
ALTER TABLE date_table 
MODIFY job_posting_year INT NOT NULL;

-- ========================================
-- 3. إنشاء الجدول المركزي (Fact Table)
-- ========================================
CREATE TABLE fact_table (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    date_id INT,
    skill_id INT,
    job_id INT,
    job_title VARCHAR(25),
    salary INT,
    
    -- العلاقات (Foreign Keys)
    FOREIGN KEY (company_id) REFERENCES company_table(company_id),
    FOREIGN KEY (date_id) REFERENCES date_table(job_id),
    FOREIGN KEY (skill_id) REFERENCES technical_job_required_skills(job_id),
    FOREIGN KEY (job_id) REFERENCES job_description(job_id)
);

-- ========================================
-- 4. ملء الجدول المركزي بالبيانات
-- ========================================
INSERT INTO fact_table (company_id, date_id, skill_id, job_id, job_title, salary)
SELECT 
    C.company_id, 
    D.job_id, 
    S.job_id, 
    J.job_id, 
    J.job_title, 
    J.salary
FROM company_table C
JOIN date_table D ON C.company_id = D.job_id
JOIN technical_job_required_skills S ON C.company_id = S.job_id
JOIN job_description J ON C.company_id = J.job_id;