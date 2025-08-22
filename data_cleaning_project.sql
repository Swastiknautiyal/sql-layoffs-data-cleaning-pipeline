-- ============================================
-- SQL DATA CLEANING PROJECT: LAYOFFS DATASET
-- Author: Swastik Nautiyal
-- Source: https://www.kaggle.com/datasets/swaptr/layoffs-2022
-- ============================================

-- ============================================
-- step1: Project Initialization – SQL Data Cleaning Starting point of the project with basic setup.
-- ============================================

select count(*) from layoffs;


-- ============================================
-- STEP 3: Create Stagging Table (Preserve Raw Data for Safety) Copy raw data into a staging table to keep the original dataset untouched.
-- ============================================


create table layoffs_stagging like layoffs;
insert into layoffs_stagging 
select * from layoffs;


-- ============================================
-- STEP 4: Identify Potential Duplicates Using ROW_NUMBER() Assign row numbers within partitions to detect duplicate records.
-- ============================================



select * , row_number() over (partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_stagging;


-- ============================================
-- STEP 5: Create CTE to Extract Duplicate Records Use a Common Table Expression to filter out rows flagged as duplicates.
-- ============================================



with duplicate_row as
(
select * , row_number() over (partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_stagging
)
select* from duplicate_row
where row_num>1;


-- ============================================
-- STEP 6: Create Secondary Staging Table for Data Cleaning Build a new table (layoffs_staging2) 
-- with an extra column (row_num) to support duplicate removal and transformations.
-- ============================================




CREATE TABLE `layoffs_stagging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
alter table layoffs_stagging2 add column row_num int;
select * from layoffs_stagging2;
insert into layoffs_stagging2
select * , row_number() over (partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_stagging;
select * from layoffs_stagging2
where row_num>1;



-- ============================================
-- STEP 7:Remove Duplicate Records from Staging Table
-- Delete all rows where row_num > 1, keeping only the first occurrence.
-- ============================================




delete from layoffs_stagging2
where row_num>1;
select* from layoffs_stagging2;




-- ============================================
-- STEP 8: Standardize Text Fields (Company, Location, Country)
-- Apply TRIM() to clean extra spaces, correct country names, and prepare text data for consistency.
-- ============================================



select distinct company, trim(company) as trimmed from layoffs_stagging2;
update layoffs_stagging2 set company=trim(company) ;




-- ============================================
--  LOOKS GOOD
-- ============================================


select distinct location from layoffs_stagging2
order by 1;
select industry from  layoffs_stagging2
order by 1;



-- ============================================
-- STEP 09: Check for Null or Empty Industry Values
-- Identify rows where industry is missing or blank for further treatment.
-- ============================================
select *from layoffs_stagging2 
where industry is null or industry='';


-- ============================================
-- STEP 10: Verify Industry Information from Known Companies (e.g., Airbnb)
-- Manually check specific companies to confirm missing industry data can be derived.
-- ============================================


select * from layoffs_stagging2 
where company='airbnb';


-- ============================================
-- STEP 11: Use Self-Join to Populate Missing Industry Values
-- Join the table to itself on company to pull valid industry values from other rows.
-- ============================================



select t1.company,t1.industry,t2.industry,t2.company 
from layoffs_stagging2 t1
join layoffs_stagging2 t2 
on t1.company=t2.company 
where (t1.industry is null or t1.industry = '')
 and t2.industry is not null;
 
 
 
 
-- ============================================
-- STEP 12: Replace Blank Industry Fields with Inferred Values
-- Convert empty strings to NULL and update missing industries using the self-join results.
-- ============================================


update layoffs_stagging2 set industry = null where industry='';
update layoffs_stagging2 t1
join layoffs_stagging2 t2 
on t1.company=t2.company 
set t1.industry=t2.industry 
where  (t1.industry is null or t1.industry = '')
 and t2.industry is not null;



-- ============================================
-- STEP 13: Format Dates into Standard SQL DATE Format
-- Convert MM/DD/YYYY strings into proper DATE datatype using STR_TO_DATE().
-- ============================================




select `date`
 from layoffs_stagging2;
update layoffs_stagging2
 set `date`= str_to_date(`date`,'%m/%d/%Y');
 
 
alter table layoffs_stagging2 modify column `date` date;
select distinct country from layoffs_stagging2 order by 1;


-- ============================================
-- STEP 14:Fix Country Field (Remove Trailing Dots or Typos)
-- Standardize country names by trimming unwanted characters (e.g., United States. → United States).
-- ============================================




update layoffs_stagging2 set country =trim(trailing '.' from country);
select distinct industry from layoffs_stagging2 ;


-- ============================================
-- STEP 15: Standardize Industry Names (Merge Variants of ‘Crypto’)
-- Normalize inconsistent naming conventions (e.g., crypto, cryptocurrency, crypto currency → Crypto).
-- ============================================




update layoffs_stagging2 
set industry ='Crypto' 
where industry like 'crypto%';


-- ============================================
-- STEP 16: Identify Rows with Missing Layoff Data
-- Locate records where both total_laid_off and percentage_laid_off are NULL, as they add no analytical valu
-- ============================================




select * from layoffs_stagging2 
where total_laid_off is null 
and percentage_laid_off is null;



-- ============================================
-- STEP 17: Delete Irrelevant Records with No Layoff Data
-- Remove all rows identified in Step 16 to keep dataset relevant and clean.
-- ============================================




delete from layoffs_stagging2
 where  total_laid_off is null 
 and percentage_laid_off is null;
 
 
 
-- ============================================
-- STEP 18:Drop Helper Column (row_num) Used for Duplicate Removal
-- Clean up schema by dropping the temporary row_num column once duplicates are removed.
-- ============================================




alter table layoffs_stagging2 
drop column row_num ; 



-- ============================================
-- STEP 19: Final Validation of Cleaned Dataset
-- Perform final check to ensure dataset is consistent, standardized, and ready for analysis.
-- ============================================



select * from layoffs_stagging2;