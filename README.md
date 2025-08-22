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

## 📸 Demo
## 📸 Demo

### 🔁 Removing Duplicates
| Before | After |
|--------|-------|
| ![Duplicates Before](docs/screenshots/duplicates_before.png) | ![Duplicates After](docs/screenshots/duplicates_after.png) |

### 🧹 Data Cleaning
| Before | After |
|--------|-------|
| ![Cleaning Before](docs/screenshots/cleaning_before.png) | ![Cleaning After](docs/screenshots/cleaning_after.png) |

### 🏷️ Industry Normalization
| Before | After |
|--------|-------|
| ![Industry Before](docs/screenshots/industry_before.png) | ![Industry After](docs/screenshots/industry_after.png) |

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
