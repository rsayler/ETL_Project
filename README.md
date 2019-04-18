# ETL_Project

## MEMBERS:

Scott McEachern   
Robert Sayler   
Connie Hu   


# Extract


![diagram](Images/Diagram_Extract.png)

## 1 Create RAW Database
Create MySQL database named 'SouthAmericaHappiness_Raw' that is to contain the extracted datasets.

- Source: 1_CreateRawDatabase.sql  
- Environment: MySQL Workbench  

## 2 Extract: World Bank Indicator
Extract the 'School Enrollment, primary and secondary (gross), gender parity index (GPI)' from the World Bank API.  The 'pandas_datareader' library is used to pull the data from the World Bank API into a DataFrame which is then loaded into the 'WorldBank_SE.ENR.PRSC.FM.ZS' table in the 'SouthAmericaHappiness_Raw' MySQL database. 

- Source: 2_Extract_WorldBank.ipynb
- Environment: Jupyter Notebook
  
## 3 Extract: Gallup World Happiness
The 'World_Happiness2016.csv' has been downloaded from the Gallup website and is then loaded into the 'Gallup_World_Happiness' table in the 'SouthAmericaHappiness_Raw' MySQL database.

- Source: 3_Extract_Gallup.ipynb
- Environment: Jupyter Notebook

## 4 Extract: Study Countries
The 'StudyCountry' table is created within the 'SouthAmericaHappiness_Raw' MySQL database that contains a list of all of the countries that are to be used in the study.  Wikipedia as the source for the list of the South American countries.

- Source: 4_Extract_StudyAreaCountries.ipynb
- Environment: Jupyter Notebook
  

# Transform
![diagram](Images/Diagram_Transform.png)
## 5 Transform: World Bank Data
A new table within the 'SouthAmericaHappiness_Raw' MySQL database named 'WorldBank_GenderParityIndex_2016' that contains the World Bank data for just the year 2016.  Then within this new table, the names have the countries are updated to ensure it matches the other data sources.

- Source: 5_Transform_WorldBank.sql
- Environment: MySQL Workbench

## 6 Transform: Join Datasets
A new table, 'HappinessResults' is to be created in the 'SouthAmericaHappiness_Raw' MySQL database that joins together the data form the 'WorldBank_GenderParityIndex_2016', 'StudyCountry' and 'Gallup_World_Happiness" tables.  Records that had NULL values for the World Bank Gender Parity Index are not include.  

- Source: 6_Transform_JoinTables.sql
- Environment: MySQL Workbench


# Load
## 6 Create Analysis Database
Create a new MySQL database named 'SouthAmericaHappiness_Analysis' that is to contain the datasets used for the analysis.

- Source: 6_CreateAnalysisDatabase.sql
- Environment: MySQL Workbench

## 7 Load: Results
Creates a new table, "HappinessResults", in the 'SouthAmericaHappiness_Analysis' MySQL database that contains the transformed data from the 'WorldBank_GenderParityIndex_2016', 'StudyCountry' and 'Gallup_World_Happiness" tables 
found in the 'SouthAmericaHappiness_Raw' MySQL database.

- Source: 7_Load_Results.sql
- Environment: MySQL Workbench 




