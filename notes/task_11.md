
# Day 11 - Window Function

Example Window Function Formula

```sql
select
    firstname, count(customerid) over(partition by coutry order by random()) rn
from your_table
```

Exercise

Create segmentation with 3 different treatments
Source : Music.DB

Background

```
Example : Music Start Up 
Problem Definition: Finding the optimum campaign method to offer concert music
Target Audience : All customers base in continent America and Europe
```

- make sure homogen based on continents
- take 6 customers from 2 continents (3 cust each continents)
- add column containing 3 segments
    - push app 
    - whatsapp 
    - control

Output
- pushapp 3 America 3 Europe
- WA 3 America 3 Europe
- control 3 America 3 Europe (Continent Based)
