SELECT 
    customerid,
    firstname,
    country,
    continent,
    CASE
        WHEN row_num <= 3 THEN 'Blast Push App'
        WHEN row_num <= 6 THEN 'Blast WA'
        WHEN row_num <= 9 THEN 'Control Group'
    END AS broadcast_channel
FROM
(
    SELECT *,
           COUNT(customerid) OVER (PARTITION BY continent) AS total,
           ROW_NUMBER() OVER (PARTITION BY continent ORDER BY RANDOM()) AS row_num
    FROM
    (
        SELECT customerid, firstname, lastname, country,
        CASE -- Disini kita pakai case utk klasifikasi negara menjadi continent
            WHEN country IN ('Brazil', 'Canada', 'USA', 'Argentina', 'Chile') THEN 'America'
            WHEN country IN ('Germany', 'Norway', 'Czech Republic', 'Austria', 'Belgium', 
                             'Denmark', 'Portugal', 'France', 'Finland', 'Hungary', 
                             'Ireland', 'Italy', 'Netherlands', 'Poland', 'Spain', 
                             'Sweden', 'United Kingdom') THEN 'Europe'
            ELSE 'Other' -- Other ini bbrp negara yg tidak masuk seperti India dan Australia
        END AS continent -- kita beri nama header sbg continent
        FROM customers
    )
) AS subquery
WHERE row_num <= 9
  AND continent != 'Other'; -- INI PENTING: Line ini utk exclude continent "Other"