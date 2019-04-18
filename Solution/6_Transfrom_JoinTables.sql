/* Transform: Join Tables
Joining three tables together to create one while dropping Null values*/

Use SouthAmericaHappiness_Raw;

Drop TABLE if exists HappinessResults;

Create Table HappinessResults
SELECT c.Region,
	   d.country AS Country,
       d.`SE.ENR.PRSC.FM.ZS` AS Indicator,
		H.`Happiness Rank` AS Happiness_Rank,
        H.`Happiness Score` AS Happiness_Score,
        H.`Economy (GDP per Capita)` AS Influence_of_Economy,
        H.`Family` AS Influence_of_Family,
        H.`Freedom` AS Influence_of_Freedom
FROM StudyCountry c 
	LEFT JOIN `WorldBank_GenderParityIndex_2016` d ON (c.Country = d.Country)
    left join Gallup_World_Happiness H on (c.Country = H.Country)
    Where d.`SE.ENR.PRSC.FM.ZS` is not Null;


