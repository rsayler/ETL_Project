/*
Transform: World Bank Data

The following transformations are to be done
1 Only include 2016 data
2 Rename primary key values found in the country column; before 'Venezuela, RB' to 'Venezuela'
/*


/* 1 Create New Table  
New table is to only include the data from 2016 and will be used in the data cleaning
*/
CREATE TABLE WorldBank_GenderParityIndex_2016
SELECT 
	s.country AS Country,
    s.year AS Year,
    s.`SE.ENR.PRSC.FM.ZS`
FROM
	`WorldBank_SE.ENR.PRSC.FM.ZS` s
WHERE
	(Year = 2016);


/* 2 Rename Values
Rename primary key values found in the country column; before 'Venezuela, RB' to 'Venezuela'

NOTE: set the "SQL_SAFE_UPDATES" to off to update table that does not have primary key
*/

SET SQL_SAFE_UPDATES = 0;

UPDATE 
	WorldBank_GenderParityIndex_2016
SET
	Country = 'Venezuela'
WHERE
	Country = 'Venezuela, RB';
