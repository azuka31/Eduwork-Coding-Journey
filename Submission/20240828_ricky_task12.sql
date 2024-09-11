--DISCLAIMER: Please DELETE -- comment sign to apply corresponding queries.
--CUSTOMERS TABLE

SELECT *
FROM customers

--DISCLAIMER: Total 59 baris (CustomerID 1-59 rapi tidak ada missing)

--1.	List All Customers:
--	•	Write a query to list all customers’ first names, last names, and email addresses.

SELECT firstname, lastname, email
FROM customers

--2.	Find Customers by State:
--	•	Write a query to find all customers located in the state of ‘California’ (CA).

SELECT firstname, lastname, state
FROM customers
WHERE state == 'CA'; 

--3.	Search Customers by Company:
--	•	Write a query to retrieve all customers working for the company 'Google Inc.'

SELECT firstname, lastname, company
FROM customers
WHERE company == 'Google Inc.'; 

--4.	Count Customers in Each City:
--	•	Write a query to count the number of customers in each city.

SELECT city, COUNT (DISTINCT customerid) AS CustomerQTY --pakai distinct utk assurance agar tidak ada yg double
FROM customers
GROUP BY city; 

--5.	Identify Customers Without Fax:
--	•	Write a query to find customers who do not have a fax number listed.

SELECT firstname, lastname, fax
FROM customers
WHERE fax IS NULL;

--6.	Find Customers by Support Rep:
--	•	Write a query to list all customers assigned to the support representative with SupportRepId = 5.

SELECT firstname, lastname, supportrepid
FROM customers
WHERE supportrepid == 5;

--7.	Filter Customers by Country:
--	•	Write a query to list all customers from 'USA'
    
SELECT firstname, lastname, country
FROM customers
WHERE country == 'USA';

--8.	Search by Postal Code:
--	•	Write a query to find all customers with the postal code '94043-1351'

SELECT firstname, lastname, postalcode
FROM customers
WHERE postalcode == '94043-1351';

--9.	Find Duplicate Customers:
--	•	Write a query to identify if there are any customers with the same first name, last name, and email address.

<<<<<<< HEAD
--SELECT firstname, lastname, email, COUNT(*)
--FROM customers
--GROUP BY email
--HAVING COUNT(*) > 0;
=======
SELECT firstname, lastname, email, COUNT(*)
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;
>>>>>>> aea39b942f8390a475ad57652bff7d07b121c24a

--DISCLAIMER: Seharusnya tidak ada yg duplicate, sdh ditest bila HAVING COUNT(*) > 0 isinya 1 semua

--ini utk duplikat firstname saja

--SELECT firstname, COUNT(*)
--FROM customers
--GROUP BY firstname
--HAVING COUNT(*) > 1;

--10.	Top Cities by Customer Count:
--	•	Write a query to list the top 5 cities with the highest number of customers.

SELECT city, COUNT(customerid) as CustomerQTY
FROM customers
GROUP BY city
ORDER BY CustomerQTY DESC
LIMIT 5

----------------------------------------------------------------------------------------------------------
--EMPLOYEES TABLE

--	11.	List All Employees:
--	•	Write a query to list all employees’ first names, last names, titles, and email addresses.

SELECT firstname, lastname, title, email
FROM employees

--	12.	Find Employees by Title:
--	•	Write a query to find all employees with the title ‘Sales Manager’.

SELECT firstname, lastname, title, email
FROM employees
WHERE title == 'Sales Manager';

--	13.	Search Employees by Hire Date:
--	•	Write a query to find employees who were hired after January 1, 2003.

--FROM w3schools: SUBSTR(string, start, length) (space) newname
--To numerize a date use julianday(columnname), example: julianday(hiredate1)

<<<<<<< HEAD
--SELECT *
--FROM
--(
--SELECT firstname, lastname, SUBSTR(hiredate,1,10) hiredate1, '2003-01-01' hireafter
--FROM employees
--)
--WHERE julianday(hiredate1) > julianday(hireafter);
=======
SELECT *
FROM
(
SELECT firstname, lastname, SUBSTR(hiredate,1,10) hiredate1, '2023-01-01' hireafter
FROM employees
)
WHERE julianday(hiredate1) > julianday(hireafter);
>>>>>>> aea39b942f8390a475ad57652bff7d07b121c24a

--DISCLAIMER: There is no one hired after 1 Jan 2023, at most it's 2004. So we change the question to 2003.

--	14.	Employees Reporting to a Manager:
--	•	Write a query to list all employees who report to the employee with EmployeeId = 2.

SELECT employeeid, firstname, lastname, title, reportsto
FROM employees
WHERE reportsto == 2;

--	15.	Count Employees by Department:
--	•	Write a query to count the number of employees under each manager (using ReportsTo).
--DISCLAIMER: jawabannya aku beri nama column 'Subordinates'

<<<<<<< HEAD
--Hasil harusnya: General Manager 2 DirectSubordinateCount, Sales Manager 3, IT Manager 2

--SELECT employeeid, firstname, title, reportsto
--from employees

--SELECT a.employeeid ManagerID, a.title ManagerTitle, COUNT(b.ReportsTo) DirectSubordinateCount
--FROM employees a
--LEFT JOIN employees b 
--ON a.employeeid = b.reportsto
--WHERE b.reportsto IS NOT NULL
--GROUP BY a.employeeid, a.title;

--Kuncinya di sini ada 2:
--1. Yang akan kita count di sini adalah ReportsTo dan akan kita samarkan nama kolomnya menjadi ManagerID
--2. Di sini kita akan LEFT JOIN tabel employees dengan tabel employees itu sendiri
--   tujuannya adalah agar angka ID yang mncul pada ReportsTo pada tabel employees kanan akan membaca 
--   employeeid pada tabel employees kiri, jgn lupa kondisi WHERE utk ReportsTo tabel kanan IS NOT NULL

=======
SELECT title, COUNT(reportsto) Subordinates
FROM employees
GROUP BY reportsto

-- perlu direcheck
>>>>>>> aea39b942f8390a475ad57652bff7d07b121c24a

--	16.	List Employees by Birth Date:
--	•	Write a query to list all employees born in the month of December.

<<<<<<< HEAD
--SELECT employeeid, firstname, birthdate
--FROM employees

--SELECT firstname, lastname, SUBSTR(birthdate, 1, 10) Birthdate1, SUBSTR(birthdate, 6, 2) BirthMonth
--FROM employees
--WHERE BirthMonth == '12';
=======
SELECT firstname, lastname, SUBSTR(birthdate, 1, 10) Birthdate1, SUBSTR(birthdate, 6, 2) BirthMonth
FROM employees
WHERE BirthMonth == '12';
>>>>>>> aea39b942f8390a475ad57652bff7d07b121c24a

--	17.	Find Longest-Serving Employees:
--	•	Write a query to list the top 5 employees with the earliest hire dates.

SELECT firstname, lastname, SUBSTR(hiredate,1,10) HireDate1
FROM employees
ORDER BY hiredate1 ASC
LIMIT 5

--	18.	Search Employees by Address:
--	•	Write a query to find employees living in the address 'Bowness Road'

<<<<<<< HEAD
--SELECT firstname, lastname, address
--FROM employees
--WHERE address REGEXP 'Ave';
=======
SELECT firstname, lastname, address
FROM employees
WHERE address REGEXP 'Bowness Road';
>>>>>>> aea39b942f8390a475ad57652bff7d07b121c24a

--	19.	Filter Employees by Last Name:
--	•	Write a query to find all employees with the last name vocal character

<<<<<<< HEAD
--SELECT firstname, lastname, SUBSTR(lastname,1,1) FirstLetter
--FROM employees 
--WHERE FirstLetter IN ('A','I','E','U','O') --pakai IN tanpa '==', tidak perlu OR manual satu-satu lg
=======
SELECT firstname, lastname, SUBSTR(lastname,1,1) FirstLetter
FROM employees 
WHERE 
  FirstLetter == 'A'
  OR FirstLetter == 'I'
  OR FirstLetter == 'U'
  OR FirstLetter == 'E'
  OR FirstLetter == 'O'
;
>>>>>>> aea39b942f8390a475ad57652bff7d07b121c24a

--	20.	Find Employees Without a Manager:
--	•	Write a query to list all employees who do not report to anyone (ReportsTo IS NULL).

<<<<<<< HEAD
--SELECT employeeid, firstname, lastname, title, reportsto
--FROM employees
--WHERE reportsto IS NULL;


----------------------------------------------------------------------------------------------------------
-- QUESTION ABOUT JOINING TABLE

--1. Find Customers and Their Support Reps:
--   - Write a query to list each customer's first name, last name, and the first name and last 
--   name of their assigned support representative.

/*DELETETHIS
SELECT 
a.firstname CustFirstName, 
a.lastname CustLastName,
b.employeeid Sales_ID,
b.firstname SalesFirstName,
b.lastname SalesLastName
FROM
(
SELECT firstname, lastname, supportrepid
FROM customers
) a
LEFT JOIN 
(
SELECT firstname, lastname, employeeid
FROM employees
) b 
ON a.supportrepid = b.employeeid
;
DELETETHIS*/

--2. Count Customers per Support Rep:
--   - Write a query to count how many customers are assigned to each support representative 
--   (i.e., each employee who acts as a support rep).

/*

SELECT
emplo.employeeid Sales_ID,
emplo.firstname Sales_Name,
COUNT(cust.SupportRepId) CustomersHandled
FROM
(
SELECT customerid, firstname, supportrepid
FROM customers
) cust
left JOIN
(
SELECT employeeid, firstname, lastname
FROM employees
) emplo
ON cust.supportrepid = emplo.employeeid
WHERE cust.supportrepid IS NOT NULL
GROUP BY cust.supportrepid
;

*/

--NOTE: Esensinya sama seperti no 15, di sini yang di sync supportrepid = employeeid, supportrepid di COUNT dan
--      disamarkan menjadi CustomersHandled (Jumlah customer yang dihandle CS)

--3. List Customers with the Same City as Their Support Rep:
--   - Write a query to find all customers who live in the same city as their assigned support representative.

/*
SELECT
cust.firstname CustomerName,
cust.country CustomerCountry,
emplo.employeeid Sales_ID,
emplo.firstname Sales_Name,
emplo.title Sales_Title,
emplo.country Sales_Country
FROM
(
  SELECT firstname, lastname, country, supportrepid
  FROM customers
) cust
LEFT JOIN
(
  SELECT employeeid, firstname, title, country
  FROm employees
) emplo
ON cust.supportrepid = emplo.employeeid
WHERE cust.country = emplo.country
ORDER BY cust.supportrepid ASC
;
*/

--DISCLAIMER: No Customers lived on the same city with any Sales Support Agent on the employees table, so
--            instead of same city, we will go with same country instead.

--4. Find Support Reps for Customers in a Specific State:
--   - Write a query to list all support representatives who have customers in the state of 'Texas'.
/*
SELECT
cust.State CustomerState,
cust.FirstName CustomerName,
cust.supportrepid Sales_ID,
emplo.FirstName Sales_Name
FROM
(
  SELECT state, firstname, lastname, customerid, supportrepid
  FROM customers
) cust
LEFT JOIN
(
  SELECT employeeid, firstname, lastname
  FROM employees
) emplo
ON cust.supportrepid = emplo.employeeid
WHERE cust.State = 'TX'
;
*/

--5. Find Customers and Their Reps by Title:
--   - Write a query to list customers along with the title of their assigned support representative.

/*
SELECT 
cust.firstname CustFirstName, 
cust.lastname CustLastName,
emplo.employeeid Sales_ID,
emplo.title SalesTitle
FROM
(
SELECT firstname, lastname, supportrepid
FROM customers
) cust
LEFT JOIN 
(
SELECT firstname, lastname, employeeid, title
FROM employees
) emplo 
ON cust.supportrepid = emplo.employeeid
;
*/

--6. Top 5 Support Reps by Number of Customers:
--   - Write a query to identify the top 5 support representatives based on the number of customers they manage.

--DISCLAIMER: There are only 3 support rep, so instead of top 5, we are going to use top 1

/*
SELECT
emplo.employeeid Sales_ID,
emplo.firstname Sales_Name,
COUNT(cust.SupportRepId) CustomersHandled
FROM
(
SELECT customerid, firstname, supportrepid
FROM customers
) cust
left JOIN
(
SELECT employeeid, firstname, lastname
FROM employees
) emplo
ON cust.supportrepid = emplo.employeeid
WHERE cust.supportrepid IS NOT NULL
GROUP BY cust.supportrepid
ORDER BY COUNT(cust.SupportRepId) DESC
LIMIT 1
;
*/

--7. Find Reps Hired Before Their Customers Joined:
--   - Write a query to list all customers along with their support representatives who were hired before the customer joined (assuming the `HireDate` in `Employees` table is before the customer was added to the `Customers` table).

--Ini saya tidak tahu, terutama cara mengetahui kapan Customer dimasukkan ke tabel (The date customer joined)

--8. Identify Longest-Serving Support Reps:
--   - Write a query to list customers and their support representatives, sorted by the hire date of the support representatives (earliest first).

/*
SELECT
cust.customerid Customer_ID,
cust.firstname CustomerName,
cust.supportrepid Sales_ID,
emplo.firstname SalesName,
SUBSTR(emplo.hiredate,1,10) SalesHireDate
FROM
(
SELECT customerid, firstname, supportrepid
FROM customers
) cust
left JOIN
(
SELECT employeeid, firstname, lastname, hiredate
FROM employees
) emplo
ON cust.supportrepid = emplo.employeeid
WHERE cust.supportrepid IS NOT NULL 
ORDER BY julianday(SalesHireDate) ASC
;
*/

--9. Find Customers and Their Reps in Different States:
--   - Write a query to list all customers who live in a different state than their support representative.

/*
SELECT
cust.firstname CustomerName,
cust.state CustomerState,
emplo.employeeid Sales_ID,
emplo.firstname SalesName,
emplo.state SalesState
FROM
(
  SELECT firstname, lastname, state, supportrepid
  FROM customers
) cust
LEFT JOIN
(
  SELECT employeeid, firstname, title, state
  FROm employees
) emplo
ON cust.supportrepid = emplo.employeeid
WHERE cust.state != emplo.state
ORDER BY cust.supportrepid ASC
;
*/

--10. Average Number of Customers per Rep:
--    - Write a query to calculate the average number of customers assigned to each support representative.

/*
SELECT AVG(CustomersHandled) AverageCustomerHandled
FROM
(
SELECT
emplo.employeeid Sales_ID,
emplo.firstname Sales_Name,
COUNT(cust.SupportRepId) CustomersHandled
FROM
(
SELECT customerid, firstname, supportrepid
FROM customers
) cust
left JOIN
(
SELECT employeeid, firstname, lastname
FROM employees
) emplo
ON cust.supportrepid = emplo.employeeid
WHERE cust.supportrepid IS NOT NULL
GROUP BY cust.supportrepid
)
*/
=======
SELECT employeeid, firstname, lastname, title, reportsto
FROM employees
WHERE reportsto IS NULL;
>>>>>>> aea39b942f8390a475ad57652bff7d07b121c24a
