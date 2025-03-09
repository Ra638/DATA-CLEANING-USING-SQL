# 🏡 Nashville Housing Data Cleaning Project

Welcome to the **Nashville Housing Data Cleaning Project!** 🚀  
This project demonstrates a comprehensive **data cleaning process** using **SQL**, focusing on real estate data.  
The goal is to prepare raw housing data for analysis by **handling missing values, standardizing fields, removing duplicates, and optimizing data storage**.

---

## 🏗️ Data Cleaning Architecture  

This project follows a **structured approach** to data cleaning using **SQL best practices**:  

### 🔹 **Raw Data (Bronze Layer)**  
- **Source**: The dataset is ingested into a **SQL Server database**.  
- **Initial State**: Data contains inconsistencies, missing values, and duplicate records.  

### 🔸 **Transformed Data (Silver Layer)**  
- **Cleaning Operations**:  
  - Filling missing `PropertyAddress` values using `ParcelID`.  
  - Splitting `PropertyAddress` and `OwnerAddress` into separate columns for **Street, City, and State**.  
  - Standardizing `SoldAsVacant` values from `0/1` to `"No/Yes"`.  
  - Removing duplicate records using `ROW_NUMBER()`.  

### 🏅 **Business-Ready Data (Gold Layer)**  
- **Optimized Dataset**:  
  - Unnecessary columns (`OwnerAddress`, `TaxDistrict`, `PropertyAddress`) are removed.  
  - Data is now structured for efficient querying and analysis.  

---

## 📂 Repository Structure  
```

data-cleaning-project/
│
├── datasets/                           # Raw dataset (Nashville Housing Data)
│
├── scripts/                            # SQL scripts for data cleaning
│   ├── 01_missing_values.sql           # Handling missing property addresses
│   ├── 02_split_address.sql            # Breaking address fields into separate columns
│   ├── 03_standardize_values.sql       # Standardizing categorical fields
│   ├── 04_remove_duplicates.sql        # Removing duplicate records
│   ├── 05_optimize_schema.sql          # Dropping unused columns
│
├── docs/                               # Project documentation
│   ├── data_model.drawio               # ER diagram of cleaned dataset
│   ├── data_flow.drawio                # Data flow and cleaning process
│   ├── data_dictionary.md               # Metadata and field descriptions
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License for the project
└── .gitignore                          # Files ignored by Git

```

---

## 📊 SQL Techniques Used  

✅ **Joins (`JOIN`)** – Filling missing data  
✅ **String Functions (`SUBSTRING()`, `CHARINDEX()`, `PARSENAME()`)** – Extracting address components  
✅ **Conditional Updates (`CASE`, `ISNULL()`)** – Standardizing categorical fields  
✅ **CTE (`WITH ROW_NUMBER()`)** – Identifying duplicates  
✅ **DDL Commands (`ALTER TABLE`, `DROP COLUMN`)** – Optimizing schema  

---

## 🚀 How to Use  

1️⃣ Load the raw **Nashville Housing** dataset into a **SQL Server database**.  
2️⃣ Run the SQL scripts **step by step** in the `scripts/` folder.  
3️⃣ Validate the cleaned data using:  
4️⃣ Use the final cleaned dataset for analytics, reporting, or visualization.

## 🛡️ License
This project is licensed under the MIT License. Feel free to use, modify, and share it with proper attribution.

## 🌟 About Me
I am Aspiring data enthusiast lokking to Contritube to real world Problems and Passionate of working with Teams 
catch up with me or as they say Ping me on Linkdin : www.linkedin.com/in/rayanahmed2002/

