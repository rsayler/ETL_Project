/* Load the transformed data into the analysis database */


/* 1 Use Database
Set the working database
*/
USE SouthAmericaHappiness_Analysis;


/* 2 Drop Existing Table
Ensure that the new table is not already within the database
*/
DROP TABLE IF EXISTS HappinessResults;


/* 3 Create New Table  
New table is to contain data from the different datasources
*/
CREATE TABLE HappinessResults
SELECT 
	*
FROM
	SouthAmericaHappiness_Raw.HappinessResults;