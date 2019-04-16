SELECT * FROM LatinAmericaHappiness_Raw.StudyCountry;


/* Join and get data for country 

RESULT: found that not all countries have results for the year.  Option to remove or develop query that just uses most
recent data
*/

SELECT c.Region,
	   d.country AS Country,
       d.`SE.ENR.PRSC.FM.ZS` AS Indicator
FROM StudyCountry c 
	LEFT JOIN `WorldBank_SE.ENR.PRSC.FM.ZS` d ON (c.Country = d.country)
WHERE 
	d.year = 2017;