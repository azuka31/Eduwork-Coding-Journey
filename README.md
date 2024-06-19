# Eduwork-Coding-Journey
Coding Compas : Navigating Through Coding

Dear students, the notes below is our documentation of code that you can re-use to build your muscle memory.
So glad if you are able to contribute more to this notes.

# Day 1 : Python Introduction

# Day 2 : Learning Function and Condition

# Day 3 : Learning 

# Day 4 : Use case Python
---

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
