# DATA-CLEANING-USING-SQL
SQL Data Cleaning for Nashville Housing Dataset
Overview

This SQL script performs data cleaning and preprocessing on the Nashveil_housing dataset within the project_portfolio database. It ensures data consistency, improves data structure, and removes redundancy to enhance data usability for analysis.

Features & Steps

1. Initial Data Exploration

Fetches all records from the dataset for review.

Identifies missing or inconsistent values.

2. Populating Missing Property Addresses

Finds missing PropertyAddress values.

Uses self-joins and the ISNULL function to fill missing values based on matching ParcelID.

Updates the table with the corrected values.

3. Breaking Down Address Components

Splits PropertyAddress into PropertySplitAddress (street) and PropertySplitCity (city) using SUBSTRING and CHARINDEX.

Splits OwnerAddress into OwnerSplitAddress, OwnerSplitCity, and OwnerSplitState using PARSENAME after replacing commas.

4. Converting Binary Values to Readable Text

Converts the SoldAsVacant field from 0 and 1 to 'No' and 'Yes'.

Alters the column data type from BIT to VARCHAR(3).

Updates values accordingly.

5. Removing Duplicates

Uses a Common Table Expression (CTE) with ROW_NUMBER() to identify duplicate records.

Filters out rows where row_num > 1.

6. Deleting Unused Columns

Drops unnecessary columns like OwnerAddress, TaxDistrict, and PropertyAddress to optimize storage and performance.

Usage

Ensure you have access to the project_portfolio database.

Run the script step by step to clean and preprocess the dataset.

Verify results by querying the modified dataset.

Technologies Used

SQL Server

T-SQL Functions: ISNULL, CHARINDEX, SUBSTRING, PARSENAME, ROW_NUMBER()

Joins & CTEs for data transformation and deduplication

License

This project is open-source and available for educational and analytical use.

Feel free to contribute or suggest improvements!

