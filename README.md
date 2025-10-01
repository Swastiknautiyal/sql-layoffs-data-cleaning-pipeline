# sql-layoffs-data-cleaning-pipeline
End-to-end SQL project cleaning and standardizing a layoffs dataset (duplicates removal, null handling, date formatting, standardization, and final cleaned dataset ready for analysis).
<h1 align="center">🧹 SQL Layoffs Data Cleaning Pipeline</h1>
<p align="center">
  End-to-end SQL project to clean, standardize, and prepare a layoffs dataset for analysis using <b>MySQL</b>.
</p>

<p align="center">
  <img alt="SQL" src="https://img.shields.io/badge/SQL-Data%20Cleaning-orange">
  <img alt="MySQL" src="https://img.shields.io/badge/Database-MySQL-blue?logo=mysql">
  <img alt="Kaggle" src="https://img.shields.io/badge/Data-Kaggle-lightblue?logo=kaggle">
  <img alt="GitHub" src="https://img.shields.io/badge/Version%20Control-GitHub-black?logo=github">
  <img alt="Status" src="https://img.shields.io/badge/Status-Completed-brightgreen">
  <img alt="License" src="https://img.shields.io/badge/License-MIT-yellow">
</p>

---

## 📖 Overview
This project focuses on analyzing the global tech layoffs dataset from Kaggle
. The workflow covers the end-to-end data journey — starting from raw data, performing SQL-based data cleaning, exploring patterns with EDA, and finally building an interactive Power BI dashboard for visualization.

The goal is to create a clean, reliable dataset and use it to uncover insights into how layoffs varied across companies, industries, geographies, and time.

---

## 📊 Cleaning Pipeline (Step Highlights)
1. **Create Staging Table** – preserve raw data safely  
2. **Remove Duplicates** – applied `ROW_NUMBER()`  
3. **Standardize Fields** – trim spaces, fix text fields  
4. **Handle Nulls** – infer industries using self-join  
5. **Format Dates** – convert to proper SQL `DATE`  
6. **Normalize Categories** – standardize inconsistent industries  
7. **Delete Irrelevant Rows** – remove rows with no layoff data  
8. **Final Cleanup** – drop helper columns, validate dataset  

---

### 🔁 Removing Duplicates
| Before | After |
|--------|-------|
| ![Duplicates Before](https://github.com/Swastiknautiyal/sql-layoffs-data-cleaning-pipeline/blob/main/before_duplicates.png) | ![Duplicates After](https://github.com/Swastiknautiyal/sql-layoffs-data-cleaning-pipeline/blob/main/after_deletingduplicates.png ) |

### 🧹 Data Cleaning
| Before | After |
|--------|-------|
| ![Cleaning Before](https://github.com/Swastiknautiyal/sql-layoffs-data-cleaning-pipeline/blob/main/before_cleaning.png) | ![Cleaning After](https://github.com/Swastiknautiyal/sql-layoffs-data-cleaning-pipeline/blob/main/after_cleaning.png) |

### 🏷️ Industry Normalization
| Before | After |
|--------|-------|
| ![Industry Before](https://github.com/Swastiknautiyal/sql-layoffs-data-cleaning-pipeline/blob/main/before_industry.png) | ![Industry After](https://github.com/Swastiknautiyal/sql-layoffs-data-cleaning-pipeline/blob/main/after_industry.png) |

---

## 🎯 Future Improvements
- Automate the SQL pipeline using Python + MySQL connector  
- Build an interactive dashboard in **Power BI** or **Tableau**  
- Extend cleaning logic to other datasets for scalability  

---

## 📬 Contact
👤 **Swastik Nautiyal**  
🔗 [LinkedIn](https://www.linkedin.com/in/swastik-nautiyal-/) 
📧 nautiyalswastik@gmail.com
