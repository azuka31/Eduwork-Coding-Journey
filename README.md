# Eduwork-Coding-Journey
Coding Compas : Navigating Through Coding
Desc : This is my notes for my students eduwork, documenting all basic to expert

Dear students, the notes below is our documentation of code that you can re-use to build your muscle memory.
So glad if you are able to contribute more to this notes.

# Meeting Notes

| Jul | Aug | Sep | Oct | Nov | Dec |
| --- | --- | --- | --- | --- | --- |
|[20240709 - Intro to Pandas](https://github.com/azuka31/Eduwork-Coding-Journey/blob/main/documentation/20240709%20-%20Introduction%20to%20Pandas.ipynb)|     |     |     |     |     |

# Day 1 : Python Introduction

Will be updated 

# Day 2 : Learning Function and Condition

Will be updated 

# Day 3 : Learning Iteration

Will be updated 

# Day 4 : Use case Python

Algorithm of Average Calculation using Python Iteration
```python
def cari_rata2(students_score):
    jumlah_score = 0
    jumlah_students = 0
    for nilai in students_score: # Nilai Tidak perlu di declare, in case dalam for
        jumlah_score += nilai
        jumlah_students += 1
        template = 'nilai {}, total score {}, jumlah students {}'
        print(template.format(nilai, jumlah_score, jumlah_students))
    average = jumlah_score / jumlah_students
    return average
```

Algorithm of Average Calculation using Python Iteration
```python

# Algoritma mencari max

students_score = [ 80, 81, 72, 43, 84, 85, 86, 67, 88, 89, 10,
    50, 81, 72, 43, 84, 85, 86, 67, 88, 89, 10,
    70, 81, 72, 53, 84, 85, 86, 67, 88, 89, 10,
    80, 81, 72, 43, 84, 87, 86, 63, 88, 89, 10,
    80, 81, 72, 43, 84, 85, 84, 67, 88, 89, 10]

MaxScore = 0
PrevScore = 0
for score in students_score: 
    template="score: {}, MaxScore: {}, PrevScore: {}"
    print(template.format(score,MaxScore,PrevScore))
    if score > PrevScore:
      MaxScore = score
    else:
      MaxScore = PrevScore
    PrevScore = score
```

# Day 5 - Mastering to Pandas


## Importing Data

You can use terminal if you want to sense programming experience using this code, you can download it by pasting this code in your terminal
```
curl -0 https://github.com/azuka31/Tsel-AAGM/blob/main/datasets/healtcare_stroke_data.csv
```

Or you can get data set to exercise here https://github.com/azuka31/Tsel-AAGM/tree/main/datasets
## Finding Trend
### Beginner-Friendly Insight Questions

1. **What is the total number of males and females in the dataset?**
2. **What is the average age of the participants?**
3. **How many people have hypertension?**
4. **How many people have heart disease?**
5. **How many people are married?**
6. **What are the different types of work categories in the dataset?**
7. **How many people live in urban areas versus rural areas?**
8. **What is the average glucose level of the participants?**
9. **What is the average BMI of the participants?**
10. **How many people are smokers, non-smokers, and former smokers?**
11. **How many people have had a stroke?**
12. **How many males have had a stroke?**
13. **How many females have had a stroke?**
14. **What is the average age of people who have had a stroke?**
15. **What is the most common work type among people who have had a stroke?**
16. **What is the average glucose level of people who have had a stroke?**
17. **What is the average BMI of people who have had a stroke?**
18. **How many people with hypertension have had a stroke?**
19. **How many people with heart disease have had a stroke?**
20. **What is the most common smoking status among people who have had a stroke?**

## Answer

Guys, you can do with your own wayy, no need to worry to be different

1. Gender Counts:
 gender
Female    2994
Male      2115
Other        1
Name: count, dtype: int64
2. Average Age: 43.226614481409
3. Hypertension Count: 498
4. Heart Disease Count: 276
5. Married Count: 3353
6. Work Types: ['Private' 'Self-employed' 'Govt_job' 'children' 'Never_worked']
7. Residence Counts:
 Residence_type
Urban    2596
Rural    2514
Name: count, dtype: int64
8. Average Glucose Level: 106.1476771037182
9. Average BMI: 28.893236911794666
10. Smoking Status Counts:
 smoking_status
never smoked       1892
Unknown            1544
formerly smoked     885
smokes              789
Name: count, dtype: int64
11. Stroke Count: 249
12. Males with Stroke: 108
13. Females with Stroke: 141
14. Average Age with Stroke: 67.72819277108434
15. Most Common Work Type with Stroke: Private
16. Average Glucose Level with Stroke: 132.54473895582328
17. Average BMI with Stroke: 30.471291866028707
18. Hypertension with Stroke Count: 66
19. Heart Disease with Stroke Count: 47
20. Most Common Smoking Status with Stroke: never smoked


# Day 6 - Pandas Questions with Programming

1.	Create a new column age_category that categorizes people into ‘Young’ (0-35 years), ‘Middle-aged’ (36-60 years), and ‘Senior’ (61+ years) using the apply function.
2.	Calculate the total number of people in each Residence_type (Urban and Rural) and store the results in a dictionary.
3.	Using the apply function, create a new column stroke_risk that is ‘High’ if a person has both hypertension and an average glucose level above 150, and ‘Low’ otherwise.
4.	Using a loop, identify and print out the id of individuals who are over 60 years old, have a BMI less than 25, and have never smoked.
5.	Create a new column glucose_level_status that categorizes the average glucose level into ‘Normal’ (<= 100), ‘Prediabetes’ (100-125), and ‘Diabetes’ (> 125) using the apply function


# Day 7 - Data Relation in Pandas

Guys, I do apologize that I can't attend the class today. But, I have prepared for you about data relation.
Please find the attachment about to table transaction.csv and customers.csv to solve these challenges

Question
1. How would you merge the `table_customers` and `table_transaction` tables to include all customer details along with their transaction details?
2. How can you filter the merged data to show only customers who have made a transaction?
3. Write a pandas command to calculate the total amount spent by each customer.
4. How can you find the customer who has spent the most based on the `Total` column in the `table_transaction`?
5. How would you join the two tables to include transactions for only those customers who are in a specific country, such as 'USA'?
6. Write a command to count the number of transactions made by each customer.
7. How can you list all customers along with the number of transactions and their total spending?
8. How can you update the `SupportRepId` in the `table_customers` based on certain conditions found in the `table_transaction`?
9. Write a command to create a DataFrame that lists all customers who have not made any transactions.
10. How can you extract and display the top 5 cities with the highest total transaction amounts?



# Day 8 - Data Visualization Challlenge

Dear students, please create data visualization using methods below, [sales_data](data/summary_sales.csv)

- line chart
- bar chart
- heatmap

Data Summary : Sales Monthly Product by Products 

you can choose one products, but you can challenge to visualized multiple products

# Day 9 - Data Cleansing Challenge

Create python function to transform this irregular data structure [data_correlation](data/data_correlation.csv) into CSV form, 

Input;
```
Data1A
Data1B
Data2A
Data2B
```
Output:
```
Data1A, Data1B
Data2A, Data2B
```
Use python programming, hint you can you modulus operation (%) learn about how to decide even and odd number

# Day 10 - Regular Expression

Challenge cleaning Data

# Additionl Neovim

## Mode
1. Normal (Esc, Ctrl + [)
    Condition: All keybindings are shortcut, you can't type in this mode
2. Insert (i, shift + a, shift + i)
    Condition: You can type in this mode
3. Visual (v, Shift + v, ctrl v)
    Condition: Blocking selected line, character

## Navigation 
Note : in normal mode
j : down
k : up
h : left
l : right

block paragraph : shift + [


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
- take 5 customers from different continents
- add column containing 3 segments
    - push app 
    - whatsapp 
    - control

Output
- pushapp 3 America 3 Europe
- WA 3 America 3 Europe
- control 3 America 3 Europe



## Advanced NVIM
### Autoincrement tutorial
- Block Vertical using ctrl v
- type g
- type ctrl a

