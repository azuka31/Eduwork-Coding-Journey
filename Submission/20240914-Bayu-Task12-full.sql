-----------------------------------CUSTOMERS TABLE-----------------------------------------

--1.	List All Customers:
--Write a query to list all customers’ first names, last names, and email addresses.

--SELECT firstname, lastname, email
--FROM customers

--2.	Find Customers by State:
--Write a query to find all customers located in the state of ‘California’ (CA).

--SELECT firstname, lastname, state
--FROM customers
--WHERE state == 'CA'; 

--3.	Search Customers by Company:
--Write a query to retrieve all customers working for the company 'Google Inc.'

--SELECT firstname, lastname, company
--FROM customers
--WHERE company == 'Google Inc.'; 

--4.	Count Customers in Each City:
--Write a query to count the number of customers in each city.

--SELECT city, COUNT (DISTINCT customerid) AS CustomerQTY 
--FROM customers
--GROUP BY city; 

--5.	Identify Customers Without Fax:
--Write a query to find customers who do not have a fax number listed.

--SELECT firstname, lastname, fax
--FROM customers
--WHERE fax IS NULL;

--6.	Find Customers by Support Rep:
--Write a query to list all customers assigned to the support representative with SupportRepId = 5.

--SELECT firstname, lastname, supportrepid
--FROM customers
--WHERE supportrepid == 5;

--7.	Filter Customers by Country:
--Write a query to list all customers from 'USA'
    
--SELECT firstname, lastname, country
--FROM customers
--WHERE country == 'USA';

--8.	Search by Postal Code:
--Write a query to find all customers with the postal code '94043-1351'

--SELECT firstname, lastname, postalcode
--FROM customers
--WHERE postalcode == '94043-1351';

--9.	Find Duplicate Customers:
--Write a query to identify if there are any customers with the same first name, last name, and email address.

--SELECT firstname, lastname, email, COUNT(*)
--FROM customers
--GROUP BY email
--HAVING COUNT(*) > 0;

--10.	Top Cities by Customer Count:
--	•	Write a query to list the top 5 cities with the highest number of customers.

--SELECT city, COUNT(customerid) as CustomerQTY
--FROM customers
--GROUP BY city
--ORDER BY CustomerQTY DESC
--LIMIT 5

-----------------------------------------EMPLOYEES TABLE--------------------------------------------------

--	11.	List All Employees:
--Write a query to list all employees’ first names, last names, titles, and email addresses.

--SELECT firstname, lastname, title, email
--FROM employees

--	12.	Find Employees by Title:
--Write a query to find all employees with the title ‘Sales Manager’.

--SELECT firstname, lastname, title, email
--FROM employees
--WHERE title == 'Sales Manager';

--	13.	Search Employees by Hire Date:
--Write a query to find employees who were hired after January 1, 2003.

--SELECT *
--FROM employees
--WHERE Hiredate > '2003-01-01';

--	14.	Employees Reporting to a Manager:
--Write a query to list all employees who report to the employee with EmployeeId = 2.

--SELECT employeeid, firstname, lastname, title, reportsto
--FROM employees
--WHERE reportsto == 2;

--	15.	Count Employees by Department:
--Write a query to count the number of employees under each manager (using ReportsTo).

--SELECT ReportsTo as ManagerID,Count(*) AS NumberofEmployees
--FROM employees
--GROUP BY ReportsTo
--ORDER BY ManageID;

--	16.	List Employees by Birth Date:
--Write a query to list all employees born in the month of December.

--SELECT *
--FROM employees
--WHERE BirthMonth == '12';

--	17.	Find Longest-Serving Employees:
--Write a query to list the top 5 employees with the earliest hire dates.

--SELECT *
--FROM employees
--ORDER BY Hiredate ASC
--LIMIT 5

--	18.	Search Employees by Address:
--Write a query to find employees living in the address 'Bowness Road'

--SELECT firstname, lastname, address
--FROM employees
--WHERE address REGEXP 'Ave';

--	19.	Filter Employees by Last Name:
--Write a query to find all employees with the last name vocal character

--SELECT firstname, lastname, SUBSTR(lastname,1,1) FirstLetter
--FROM employees 
--WHERE FirstLetter IN ('A','I','E','U','O') 

--	20.	Find Employees Without a Manager:
--Write a query to list all employees who do not report to anyone (ReportsTo IS NULL).

--SELECT employeeid, firstname, lastname, title, reportsto
--FROM employees
--WHERE reportsto IS NULL;



-----------------------------------JOINING TABLE-----------------------------------------

--1. Find Customers and Their Support Reps:
--Write a query to list each customer's first name, last name, and the first name
-- and Last Name of their assigned support representative.

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

--2. Count Customers per Support Rep:
-- Write a query to count how many customers are assigned to each support representative 
-- (i.e., each employee who acts as a support rep).

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

--3. List Customers with the Same City as Their Support Rep:
-- Write a query to find all customers who live in the same city as their assigned support representative.

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
*

--4. Find Support Reps for Customers in a Specific State:
-- Write a query to list all support representatives who have customers in the state of 'Texas'.

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


--5. Find Customers and Their Reps by Title:
--Write a query to list customers along with the title of their assigned support representative.

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

--6. Top 5 Support Reps by Number of Customers:
--Write a query to identify the top 5 support representatives based on the number of customers they manage.

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

--7. Find Reps Hired Before Their Customers Joined:
-- Write a query to list all customers along with their support representatives who were hired before the customer joined (assuming the `HireDate` in `Employees` table is before the customer was added to the `Customers` table).

SELECT 
    a.CustomerFirstName,
    a.CustomerLastName,
    b.FirstName AS RepFirstName,
    b.LastName AS RepLastName
FROM 
    Customers a
JOIN 
    Employees b ON a.SupportRepID = b.EmployeeID
WHERE 
    b.HireDate < a.JoinDate;


--8. Identify Longest-Serving Support Reps:
-- Write a query to list customers and their support representatives, sorted by the hire date of the support representatives (earliest first).

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

--9. Find Customers and Their Reps in Different States:
--Write a query to list all customers who live in a different state than their support representative.

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

--10. Average Number of Customers per Rep:
--Write a query to calculate the average number of customers assigned to each support representative.

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
