-- SQL Question

Questions About the Customers Table

```
	1.	List All Customers:
	•	Write a query to list all customers’ first names, last names, and email addresses.
	2.	Find Customers by State:
	•	Write a query to find all customers located in the state of ‘California’ (CA).
	3.	Search Customers by Company:
	•	Write a query to retrieve all customers working for the company 'Google Inc.'
	4.	Count Customers in Each City:
	•	Write a query to count the number of customers in each city.
	5.	Identify Customers Without Fax:
	•	Write a query to find customers who do not have a fax number listed.
	6.	Find Customers by Support Rep:
	•	Write a query to list all customers assigned to the support representative with SupportRepId = 5.
	7.	Filter Customers by Country:
	•	Write a query to list all customers from 'USA'
	8.	Search by Postal Code:
	•	Write a query to find all customers with the postal code '94043-1351'
	9.	Find Duplicate Customers:
	•	Write a query to identify if there are any customers with the same first name, last name, and email address.
	10.	Top Cities by Customer Count:
	•	Write a query to list the top 5 cities with the highest number of customers.
```

Questions About the Employees Table

```
	11.	List All Employees:
	•	Write a query to list all employees’ first names, last names, titles, and email addresses.
	12.	Find Employees by Title:
	•	Write a query to find all employees with the title ‘Sales Manager’.
	13.	Search Employees by Hire Date:
	•	Write a query to find employees who were hired after January 1, 2023.
	14.	Employees Reporting to a Manager:
	•	Write a query to list all employees who report to the employee with EmployeeId = 2.
	15.	Count Employees by Department:
	•	Write a query to count the number of employees under each manager (using ReportsTo).
	16.	List Employees by Birth Date:
	•	Write a query to list all employees born in the month of December.
	17.	Find Longest-Serving Employees:
	•	Write a query to list the top 5 employees with the earliest hire dates.
	18.	Search Employees by Address:
	•	Write a query to find employees living in the address 'Bowness Road'
	19.	Filter Employees by Last Name:
	•	Write a query to find all employees with the last name vocal character
	20.	Find Employees Without a Manager:
	•	Write a query to list all employees who do not report to anyone (ReportsTo IS NULL).
```

Question About Joining Tables

```
1. Find Customers and Their Support Reps:
m employees;
   - Write a query to list each customer's first name, last name, and the first name and last name of their assigned support representative.

2. Count Customers per Support Rep:
   - Write a query to count how many customers are assigned to each support representative (i.e., each employee who acts as a support rep).

3. List Customers with the Same City as Their Support Rep:
   - Write a query to find all customers who live in the same city as their assigned support representative.

4. Find Support Reps for Customers in a Specific State:
   - Write a query to list all support representatives who have customers in the state of 'Texas'.

5. Find Customers and Their Reps by Title:
   - Write a query to list customers along with the title of their assigned support representative.

6. Top 5 Support Reps by Number of Customers:
   - Write a query to identify the top 5 support representatives based on the number of customers they manage.

7. Find Reps Hired Before Their Customers Joined:
   - Write a query to list all customers along with their support representatives who were hired before the customer joined (assuming the `HireDate` in `Employees` table is before the customer was added to the `Customers` table).

8. Identify Longest-Serving Support Reps:
   - Write a query to list customers and their support representatives, sorted by the hire date of the support representatives (earliest first).

9. Find Customers and Their Reps in Different States:
   - Write a query to list all customers who live in a different state than their support representative.

10. Average Number of Customers per Rep:
    - Write a query to calculate the average number of customers assigned to each support representative.
```

