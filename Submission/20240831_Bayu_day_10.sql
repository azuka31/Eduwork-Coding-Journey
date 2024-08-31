SELECT	
	customerid,
 	firstname,
 	country,
 	continent,
     CASE
    	WHEN row_number <= 3 THEN 'Blash Push App'
     	WHEN row_number <= 6 THEN 'Blash WA'
     	WHEN row_number <= 9 THEN 'control group'
     End as broadcast_chanel
 FROM
 ( 
    SELECT
   		customerid,
        firstname,
        country,
        continent,
    	count(customerid) over(partition by continent) as total,
    	Row_Number() over(partition by continent order by random()) as row_number
	from
    (
    	SELECT 
    	customerid, 
    	firstname,  
    	country,
        CASE 
            WHEN country IN ('Austria', 'Belgium','Czech Republic', 'Denmark','France', 'Finland', 'Germany', 'Hungary', 
                             'Ireland', 'Italy', 'Norway', 'Netherlands', 'Portugal', 'Poland', 'Spain', 
                             'Sweden', 'United Kingdom' ) THEN 'Europe'
     	    WHEN country IN ( 'Argentina', 'Brazil',  'Chile' , 'Canada', 'USA' ) THEN 'America'
            ELSE 'Other'
      END AS continent 
      FROM customers
   ) AS subquery
 ) AS ranked
WHERE row_number <= 9
  AND continent != 'Other'; 