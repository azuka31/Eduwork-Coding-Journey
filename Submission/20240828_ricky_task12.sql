--DISCLAIMER: Please DELETE -- comment sign to apply corresponding queries.

--CUSTOMERS TABLE

--SELECT *
--FROM customers

--DISCLAIMER: Total 59 baris (CustomerID 1-59 rapi tidak ada missing)

--1.	List All Customers:
--	•	Write a query to list all customers’ first names, last names, and email addresses.

--SELECT firstname, lastname, email
--FROM customers

--2.	Find Customers by State:
--	•	Write a query to find all customers located in the state of ‘California’ (CA).

--SELECT firstname, lastname, state
--FROM customers
--WHERE state == 'CA'; 

--3.	Search Customers by Company:
--	•	Write a query to retrieve all customers working for the company 'Google Inc.'

--SELECT firstname, lastname, company
--FROM customers
--WHERE company == 'Google Inc.'; 

--4.	Count Customers in Each City:
--	•	Write a query to count the number of customers in each city.

--SELECT city, COUNT (DISTINCT customerid) AS CustomerQTY --pakai distinct utk assurance agar tidak ada yg double
--FROM customers
--GROUP BY city; 

--5.	Identify Customers Without Fax:
--	•	Write a query to find customers who do not have a fax number listed.

--SELECT firstname, lastname, fax
--FROM customers
--WHERE fax IS NULL;

--6.	Find Customers by Support Rep:
--	•	Write a query to list all customers assigned to the support representative with SupportRepId = 5.

--SELECT firstname, lastname, supportrepid
--FROM customers
--WHERE supportrepid == 5;

--7.	Filter Customers by Country:
--	•	Write a query to list all customers from 'USA'
    
--SELECT firstname, lastname, country
--FROM customers
--WHERE country == 'USA';

--8.	Search by Postal Code:
--	•	Write a query to find all customers with the postal code '94043-1351'

--SELECT firstname, lastname, postalcode
--FROM customers
--WHERE postalcode == '94043-1351';

--9.	Find Duplicate Customers:
--	•	Write a query to identify if there are any customers with the same first name, last name, and email address.

--SELECT firstname, lastname, email, COUNT(*)
--FROM customers
--GROUP BY email
--HAVING COUNT(*) > 1;

--DISCLAIMER: Seharusnya tidak ada yg duplicate, sdh ditest bila HAVING COUNT(*) > 0 isinya 1 semua

--10.	Top Cities by Customer Count:
--	•	Write a query to list the top 5 cities with the highest number of customers.

--SELECT city, COUNT(customerid) as CustomerQTY
--FROM customers
--GROUP BY city
--ORDER BY CustomerQTY DESC
--LIMIT 5

--EMPLOYEES TABLE

--	11.	List All Employees:
--	•	Write a query to list all employees’ first names, last names, titles, and email addresses.

--SELECT firstname, lastname, title, email
--FROM employees

--	12.	Find Employees by Title:
--	•	Write a query to find all employees with the title ‘Sales Manager’.

--SELECT firstname, lastname, title, email
--FROM employees
--WHERE title == 'Sales Manager';

--	13.	Search Employees by Hire Date:
--	•	Write a query to find employees who were hired after January 1, 2023.

--FROM w3schools: SUBSTR(string, start, length) (space) newname
--To numerize a date use julianday(columnname), example: julianday(hiredate1)

--SELECT *
--FROM
--(
--SELECT firstname, lastname, SUBSTR(hiredate,1,10) hiredate1, '2023-01-01' hireafter
--FROM employees
--)
--WHERE julianday(hiredate1) > julianday(hireafter);

--DISCLAIMER: There is no one hired after 1 Jan 2023, at most it's 2004

--	14.	Employees Reporting to a Manager:
--	•	Write a query to list all employees who report to the employee with EmployeeId = 2.

--SELECT employeeid, firstname, lastname, title, reportsto
--FROM employees
--WHERE reportsto == 2;

--	15.	Count Employees by Department:
--	•	Write a query to count the number of employees under each manager (using ReportsTo).

--DISCLAIMER: jawabannya aku beri nama column 'Subordinates'

--SELECT title, COUNT(reportsto) Subordinates
--FROM employees
--GROUP BY reportsto

--	16.	List Employees by Birth Date:
--	•	Write a query to list all employees born in the month of December.

--SELECT firstname, lastname, SUBSTR(birthdate, 1, 10) Birthdate1, SUBSTR(birthdate, 6, 2) BirthMonth
--FROM employees
--WHERE BirthMonth == '12';

--	17.	Find Longest-Serving Employees:
--	•	Write a query to list the top 5 employees with the earliest hire dates.

--SELECT firstname, lastname, SUBSTR(hiredate,1,10) HireDate1
--FROM employees
--ORDER BY hiredate1 ASC
--LIMIT 5

--	18.	Search Employees by Address:
--	•	Write a query to find employees living in the address 'Bowness Road'

--SELECT firstname, lastname, address
--FROM employees
--WHERE address REGEXP 'Bowness Road';

--	19.	Filter Employees by Last Name:
--	•	Write a query to find all employees with the last name vocal character

--SELECT firstname, lastname, SUBSTR(lastname,1,1) FirstLetter
--FROM employees 
--WHERE FirstLetter == 'A'
--OR FirstLetter == 'I'
--OR FirstLetter == 'U'
--OR FirstLetter == 'E'
--OR FirstLetter == 'O';

--	20.	Find Employees Without a Manager:
--	•	Write a query to list all employees who do not report to anyone (ReportsTo IS NULL).

--SELECT employeeid, firstname, lastname, title, reportsto
--FROM employees
--WHERE reportsto IS NULL;