# 🏥 Healthcare Analytics Dashboard | End-to-End Data Analysis

> **Overview:** A professional healthcare analytics dashboard designed to visualize key performance indicators regarding medical costs, patient distribution, and insurance provider metrics. The dashboard utilizes a **Dark Mode** interface for enhanced readability and focuses on actionable insights for cost optimization.

---

## 🎯 Project Objective
To analyze a dataset of **55,000 healthcare cases** and **$1.42 Billion in medical costs** to uncover patterns in:
- **Cost Drivers:** Breakdown of expenses by admission type (Elective, Urgent, Emergency).
- **Patient Demographics:** Case volume distribution across different age groups.
- **Medication Analysis:** Prescription percentages across various medical conditions.
- **Provider Performance:** Comparative analysis of Insurance Providers (Cost vs. Case Volume).

---

## 🛠️ Tools & Technologies
| Category | Tools |
|----------|-------|
| **Data Modeling** | SQL (Star Schema), MySQL |
| **Visualization** | Power BI (Advanced DAX, Matrix Visuals, Combo Charts) |
| **Design** | Custom Dark Theme, UX Optimization |

---

## 📊 Key Findings & Insights

✅ **High-Level Metrics (KPIs):**
- **Total Medical Cost:** $1.42 Billion.
- **Total Cases Analyzed:** 55,000 cases across the 2019-2024 period.

✅ **Admission Cost Analysis:**
- Costs are evenly distributed across the three main admission types:
  - **Urgent Care:** $477.54M (33.69%) - Highest contributor.
  - **Emergency:** $473.98M (33.44%).
  - **Elective:** $465.77M (32.86%).
- *Insight:* The balanced split suggests a need for resource allocation strategies that address all three areas equally, rather than focusing solely on emergency care.

✅ **Medication Trends (Matrix Analysis):**
- Analyzed top 5 medications (Lipitor, Ibuprofen, Aspirin, Paracetamol, Penicillin) against 6 conditions (Arthritis, Asthma, Cancer, Diabetes, Hypertension, Obesity).
- Prescription rates are highly consistent (~16% - 17%) across all conditions, indicating standardized treatment protocols or a potential opportunity for more targeted medication strategies based on specific conditions.

✅ **Patient Demographics:**
- **Under 30 Age Group:** Represents the highest volume of cases.
- **80+ Age Group:** Shows the lowest case volume.
- *Action:* High volume in younger demographics may indicate a need for preventive care programs or sports/injury-related interventions.

✅ **Insurance Provider Analysis:**
- Utilized a **Combo Chart** to compare Medical Cost (Columns) vs. Case Number (Line) across major providers (Cigna, Medicare, Blue Cross, United, Aetna).
- *Insight:* This visualization highlights efficiency gaps—identifying providers with high costs but low case volumes (or vice versa), which is critical for contract negotiations.

---

## 💼 Business Impact & Recommendations

🎯 **For Hospital Management:**
- **Resource Balancing:** Since costs are split almost equally (33% each) between Emergency, Urgent, and Elective, ensure staffing and bed availability are distributed proportionally to avoid bottlenecks in any specific department.

🎯 **For Financial Officers:**
- **Provider Negotiations:** Use the "Insurance Provider vs. Costs" chart to renegotiate contracts with providers showing a high cost-per-case ratio.

🎯 **For Clinical Operations:**
- **Age-Targeted Programs:** Develop specific health awareness campaigns for the "Under 30" demographic, as they represent the highest inflow of cases.

---

## 📂 Project Structure:**
📁 Healthcare-Analytics-Project/
├── 📄 README.md ← Project documentation & insights
├── 📁 SQL/
│ ├── schema.sql ← Database creation & relationships
│ └── analysis.sql ← Complex queries for insights
├── 📁 PowerBI/
│ └── healthcare_dashboard.pbix ← Source file
└── 📁 Images/
├── healthcare_schema.png ← Star Schema Diagram
└── healthcare_dashboard.png ← Dashboard Screenshot

---

## 🔗 Live Links
🌐 [Interactive Dashboard] *(https://app.powerbi.com/links/FwD5AWfFyo?ctid=5bf578da-db20-4df2-b8d2-c2357607e377&pbi_source=linkShare)*  
💻 [Source Code] *(https://github.com/hossam-hassan-da/hossam-hassan-da)*  
📄 [Full Portfolio] *(https://hossam-hassan-da.github.io/hossam-hassan-da/)*