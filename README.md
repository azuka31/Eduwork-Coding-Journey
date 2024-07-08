# Eduwork-Coding-Journey
Coding Compas : Navigating Through Coding

Dear students, the notes below is our documentation of code that you can re-use to build your muscle memory.
So glad if you are able to contribute more to this notes.

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

# Day 5
---


# Importing Data

You can use terminal if you want to sense programming experience using this code, you can download it by pasting this code in your terminal
```
curl -0 https://github.com/azuka31/Tsel-AAGM/blob/main/datasets/healtcare_stroke_data.csv
```

Or you can get data set to exercise here https://github.com/azuka31/Tsel-AAGM/tree/main/datasets
# Finding Trend
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
