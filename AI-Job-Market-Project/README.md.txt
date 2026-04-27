# 📊 AI Job Market Trends 2026 | End-to-End Data Analysis Project

> **Overview:** A comprehensive analysis of the global AI job market, transforming raw CSV data into an interactive Power BI dashboard. The project highlights salary benchmarks, in-demand technical skills, geographic opportunities, and hiring trends to support data-driven career and recruitment decisions.

---

##  Project Objective
To analyze 52,000+ AI-related job postings and extract actionable insights on:
- Salary distribution across roles, experience levels, and regions
- Most requested technical and soft skills per job title
- Hiring urgency trends and market demand patterns
- Strategic recommendations for job seekers and hiring managers

---

## 🛠️ Tools & Technologies
| Category | Tools |
|----------|-------|
| **Data Storage & Modeling** | MySQL (Star Schema Design, Relational Modeling) |
| **Data Analysis** | SQL (Aggregations, Joins, Window Functions), DAX |
| **Visualization** | Power BI (Interactive Dashboards, Custom Formatting, UX Design) |
| **Data Preparation** | CSV Cleaning, Data Type Standardization, Missing Value Handling |

---

##  Methodology & Workflow

### 1. Data Preparation & Cleaning
- Imported raw job market datasets (CSV format) containing role titles, salaries, locations, required skills, and experience levels.
- Standardized inconsistent job titles, cleaned missing values, and normalized skill tags for accurate aggregation.

### 2. Database Design & SQL Modeling
- Designed a **Star Schema** in MySQL to optimize query performance and support dimensional analysis:
  - **Fact Table:** `fact_job_postings` (core metrics: salary, job openings, posting dates)
  - **Dimension Tables:** `dim_roles`, `dim_locations`, `dim_skills`, `dim_experience`
- Established primary/foreign key relationships and applied data constraints for integrity.

### 3. Analytical Querying
- Developed SQL queries to calculate KPIs, rank top-paying roles, and map skill demand frequency:
  ```sql
  -- Example: Top skills demand by role category
  SELECT r.job_title, s.skill_name, COUNT(js.job_id) as demand_count
  FROM fact_job_postings f
  JOIN dim_roles r ON f.role_id = r.role_id
  JOIN job_skills js ON f.job_id = js.job_id
  JOIN dim_skills s ON js.skill_id = s.skill_id
  GROUP BY r.job_title, s.skill_name
  ORDER BY demand_count DESC;
### 4. Power BI Dashboard Development
- Connected Power BI to the MySQL database and built a fully interactive report.
- Implemented DAX measures for dynamic KPIs (Total Jobs, Avg Salary, Skill % Distribution).
- Designed a clean, responsive layout with cross-filtering capabilities (Country, Experience Level, Job Title).
- Applied consistent color theming and accessibility-focused visual hierarchy.
## 📈 Key Insights & Findings
- ✅ Salary Benchmarks:
Average market salary: $113.44K across 52K+ active opportunities.
AI Engineers and Machine Learning Engineers command the highest compensation, significantly outperforming traditional analyst roles.
- ✅ Skills in Demand:
The top 5 most requested competencies across all roles: Cloud Platforms, Deep Learning, ML Algorithms, Python, and SQL.
Skill distribution is highly consistent, indicating a baseline expectation of full-stack data capabilities.
- ✅ Experience & Hiring Trends:
Senior-level roles show the highest salary premiums, especially in high-urgency hiring markets.
Mid-to-Senior positions dominate the market, highlighting a growing demand for experienced practitioners over entry-level candidates.
- ✅ Geographic Distribution:
High-opportunity markets include Germany, UK, USA, Canada, Australia, India, and Singapore, each showing distinct salary-to-opportunity ratios.
## 💼 Business Impact & Recommendations
🎯 For Job Seekers:
Prioritize upskilling in Cloud Infrastructure and Machine Learning to access top-tier compensation bands.
Target markets like Germany and Canada for balanced opportunity density and competitive salaries.
🎯 For Recruiters & Companies:
Align compensation packages with the $113K+ market average to remain competitive for Mid/Senior talent.
Develop structured graduate/junior programs to bridge the entry-level experience gap observed in the market.
🎯 For Training & Education Providers:
Focus curricula on the core triad: Python + SQL + Cloud/ML fundamentals.
Integrate real-world hiring urgency metrics to prepare students for actual market demands.
## 📂 Project Structure
📁 AI-Job-Market-Analysis-2026/
├── 📄 README.md                  ← Project documentation & case study
├── 📁 SQL/
│   ├── schema_design.sql         ← Star schema DDL statements
│   └── analysis_queries.sql      ← KPI & insight extraction queries
├── 📁 PowerBI/
│   ├── dashboard.pbix            ← Power BI source file
│   └── dashboard_export.pdf      ← Static high-res export
└──  Assets/
    └── dashboard_preview.png     ← High-quality screenshot
Live Links
🌐 [Interactive Power BI Dashboard](https://app.powerbi.com/links/l0JBrwZxmB?ctid=5bf578da-db20-4df2-b8d2-c2357607e377&pbi_source=linkShare)
💻 [GitHub Repository] (Link to be added after repo creation)
📄 [Full Portfolio] (Link to be added after Notion/Website launch)