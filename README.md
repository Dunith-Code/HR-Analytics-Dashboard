# 📊 HR Analytics Dashboard - Employee Attrition Analysis

![Python](https://img.shields.io/badge/Python-3.12-blue?logo=python&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-336791?logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Pandas](https://img.shields.io/badge/pandas-Data%20Cleaning-150458?logo=pandas&logoColor=white)
[![Excel](https://img.shields.io/badge/Excel-Power_Query-217346?logo=microsoftexcel&logoColor=white)](https://www.microsoft.com/en-us/microsoft-365/excel)
[![DAX](https://img.shields.io/badge/DAX-Measures-yellow?logo=powerbi&logoColor=black)](https://learn.microsoft.com/en-us/dax/)
[![Status](https://img.shields.io/badge/Status-Complete-brightgreen)]()
![License](https://img.shields.io/badge/license-MIT-lightgrey)

An end-to-end data analytics project exploring employee attrition patterns using Python, PostgreSQL, and Power BI. The pipeline takes a raw HR dataset from cleaning through modeling to an interactive, multi-page dashboard that surfaces the key drivers behind why employees leave.

---

## 🎯 Project Overview
 
Employee attrition is costly and often preventable if the right patterns are understood early. This project analyzes 1,470 employee records to answer:
 
* What is the overall attrition rate, and how does it vary by department and job role?
* What factors most strongly predict whether an employee leaves: overtime, job satisfaction, age, tenure?
* Where should HR focus retention efforts first?

---

## 🛠️ Tech Stack
 
* Data Cleaning and Transformation: Python (pandas)
* Data Storage: PostgreSQL
* Querying and Analysis: SQL
* Visualization: Power BI (DAX)

---

## 🔑 Key Findings
 
* Overall attrition rate: 16.12% (237 of 1,470 employees)
* Overtime is the strongest driver: employees working overtime leave at 30.5%, nearly 3x the rate of those who don't (10.4%)
* Sales Representative has the highest attrition by job role at 39.8%, compared to just 2.5% for Research Directors
* Younger employees (18 to 25) leave at 35.8%, more than triple the rate of the 36 to 45 age group (9.2%)
* Job satisfaction shows a clear gradient: attrition drops steadily from "Bad" (22.8%) to "Very High" (11.3%) satisfaction
* Employees who leave earn less on average in every department and have fewer years since their last promotion

---

## 📁 Project Structure
 
```
HR-Analytics-Dashboard/
│
├── data/
│   ├── raw/                            Original Kaggle dataset (not redistributed, see Dataset section)
│   └── processed/                      Cleaned dataset after Python processing
│
├── python/
│   ├── 02_cleaning.py                  Cleans raw data, adds labels & derived bands
│   └── 03_load_to_postgres.py          Loads cleaned data into PostgreSQL
│
├── sql/
│   ├── create_tables.sql               Database schema
│   └── analysis_queries.sql            Exploratory attrition analysis queries
│
├── powerbi/
│   └── HR-Analytics-Dashboard.pbix     Main Power BI report (3 pages)
│
├── docs/
│   └── screenshots/                    Dashboard page screenshots
│
└── README.md
```

---

## 🏗️ Architecture
 
```mermaid
flowchart LR
    A[Kaggle CSV<br/>Raw Dataset] --> B[Python<br/>Cleaning & Transformation]
    B --> C[PostgreSQL<br/>Structured Storage]
    C --> D[SQL<br/>Exploratory Analysis]
    C --> E[Power BI<br/>DAX Measures & Dashboard]
    E --> F[End User<br/>HR Insights]
```
 
The pipeline moves data through four stages: raw ingestion, Python-based cleaning, PostgreSQL storage, and Power BI visualization, with SQL used in parallel for exploratory validation before building the dashboard.

---

## 📈 Dashboard Pages
 
### 1. Overview
Headcount, attrition rate, average income KPIs; attrition rate by department and job role.
 
![Overview](docs/screenshots/overview.png)
 
### 2. Attrition Drivers
Attrition by overtime, job satisfaction, and age band, with written insights.
 
![Attrition Drivers](docs/screenshots/attrition_drivers.png)
 
### 3. Demographics
Headcount by department/role, age distribution, gender split, education field breakdown, plus an interactive decomposition tree.
 
![Demographics](docs/screenshots/demographics.png)

---


## 📂 Dataset
 
This project uses the **IBM HR Analytics Employee Attrition & Performance** dataset (1,470 rows, 35 columns), available on [Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset).
 
The raw file isn't redistributed in this repo - download it directly from Kaggle and place it in `data/raw/` to reproduce the pipeline.

---

## ▶️ How to Run
 
1. **Download the dataset** from Kaggle (link above) into `data/raw/`
2. **Clean the data**:
```bash
   cd python
   pip install pandas
   python 02_cleaning.py
```
3. **Set up PostgreSQL**:
   - Create a database named `hr_analytics`
   - Run `sql/create_tables.sql` to create the schema
4. **Load the cleaned data**:
```bash
   pip install sqlalchemy psycopg2-binary
   python 03_load_to_postgres.py
```
   (update the `DB_CONFIG` credentials in the script first)
5. **Explore with SQL** (optional): run `sql/analysis_queries.sql` against the database
6. **Open the dashboard**: launch `powerbi/HR-Analytics-Dashboard.pbix` in Power BI Desktop, and point the PostgreSQL connection to your local database

---

👤 **Dunith Desitha Athukorala**
