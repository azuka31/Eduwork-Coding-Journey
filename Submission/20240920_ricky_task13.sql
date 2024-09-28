/*
1. Basic Inner Join:  
   Write a query to list all the tracks along with their respective album titles. 
   Ensure that the track name and album title are displayed.
*/


SELECT
--trk.trackid,
trk.name TrackName,
--abm.albumid,
abm.title AlbumTitle
FROM
(
  SELECT albumid, title 
  FROM albums 
) abm
INNER JOIN
(
  SELECT trackid, name, albumid 
  FROM tracks 
) trk
ON abm.albumid = trk.albumid
;


/*
2. Inner Join with Multiple Tables:  
   Write a query to display the track name, artist name, 
   and genre for each track by joining the `tracks`, `albums`, `artists`, and `genres` tables.
*/

--NOTE: Inner Join AlbumId dari tabel tracks dan albums, ArtistId dari tabel albums dan artists,
--      lalu Inner Join GenreId dari tabel tracks dan genres

SELECT
trk.name TrackName,
art.name Artist,
gen.name genres
FROM
(
  SELECT trackid, name, albumid, genreid  
  FROM tracks 
) trk
INNER JOIN
(
  SELECT albumid, title, artistid
  FROM albums 
) abm
ON trk.albumid = abm.albumid
INNER JOIN
(
  SELECT artistid, name 
  FROM artists 
) art
ON abm.artistid = art.artistid
INNER JOIN
(
  SELECT genreid, name 
  FROM genres 
) gen
ON trk.genreid = gen.genreid
;

/*
3. Join with Filtering:  
   Write a query to find all the customers who have purchased tracks from the genre "Rock". 
   Show the customer’s first name, last name, and genre.
*/

--NOTE: Alur Inner Join: invoice -(InvoiceId)-> invoice_items -(TrackId)-> tracks -(GenreId)-> genres
--		lalu INNER JOIN invoice -(CustomerId)-> customers

SELECT
cust.firstname,
cust.lastname,
gen.name
FROM
(
  SELECT invoiceid, customerid  
  FROM invoices 
) inv
INNER JOIN
(
  SELECT invoiceid, trackid  
  FROM invoice_items 
) itm
ON inv.invoiceid = itm.invoiceid
INNER JOIN
(
  SELECT trackid, name, albumid, genreid  
  FROM tracks 
) trk
ON itm.trackid = trk.trackid
INNER JOIN
(
  SELECT albumid, title, artistid
  FROM albums 
) abm
ON trk.albumid = abm.albumid
INNER JOIN
(
  SELECT genreid, name 
  FROM genres
  WHERE name = 'Rock'
) gen
ON trk.genreid = gen.genreid
INNER JOIN
(
  SELECT customerid, firstname, lastname 
  FROM customers
) cust
ON inv.customerid = cust.customerid
;


/*
4. Left Join Example:  
   Create a query to list all tracks along with the media type name. 
   Ensure that all tracks are displayed, even if some media types do not have a corresponding name.
*/

--NOTE: LEFT JOIN mediatypeid pada tabel tracks (LEFT) dan media_types

SELECT
trk.trackid TrackID,
trk.name TrackName,
med.name MediaType
FROM
(
  SELECT trackid, name, mediatypeid
  FROM tracks
) trk
LEFT JOIN
(
  SELECT mediatypeid, name
  FROM media_types
) med
ON trk.mediatypeid = med.mediatypeid
;

/*
5. Right Join Equivalent in SQLite
   List all albums along with the track names. Ensure that even albums with no tracks are included.
*/

--NOTE: Left Join AlbumId dari tabel albums (LEFT) dan tracks

SELECT
trk.name TrackName,
abm.title AlbumTitle
FROM
(
  SELECT albumid, title 
  FROM albums 
) abm
LEFT JOIN
(
  SELECT trackid, name, albumid 
  FROM tracks 
) trk
ON abm.albumid = trk.albumid
;

/*
6. Join and Aggregate:  
   Write a query to find the total revenue (sum of unit price * quantity) 
   generated for each track. Include the track name and total revenue.
*/

-- NOTE: Kurang yakin dengan jawaban

SELECT
trk.name TrackName,
(itm.unitprice*itm.quantity) TotalRevenue
FROM
(
  SELECT trackid, name, unitprice
  FROM tracks
) trk
INNER JOIN
(
  SELECT trackid, unitprice, quantity
  FROM invoice_items
) itm
ON trk.trackid = itm.trackid
;

/*
7. Joining with Conditions:  
   Write a query to display all the tracks that were composed by the same composer. 
   Include the composer’s name, track name, and album title.
*/

/*
--NOTE: LEFT JOIN albumid pada tabel tracks (LEFT) dan albums, LEFT pada tracks karena fokus disini adalah
--		composer dan track mereka, album bila ada saja. Composer IS NOT NULL saya include bila dibutuhkan.

SELECT
trk.composer ComposerName,
trk.name TrackName,
abm.title AlbumTitle
FROM
(
  SELECT composer, name, albumid
  FROM tracks
  WHERE composer IS NOT NULL --Optional sesuai kebutuhan
  ORDER BY composer ASC
) trk
LEFT JOIN
(
  SELECT albumid, title
  FROM albums
) abm
ON trk.albumid = abm.albumid
;
*/

/*
8. Self-Join Example:  
   Use a self-join on the `employees` table to display each employee's first name along with their 
   manager’s first name.
*/

SELECT
b.firstname SubordinateName,
b.title SubordinateTitle,
a.firstname SupervisorName,
a.title SupervisorName
FROM
(
  SELECT employeeid, firstname, title, reportsto
  FROM employees
) a
LEFT JOIN
(
  SELECT employeeid, firstname, title, reportsto
  FROM employees
) b
ON a.employeeid = b.reportsto
WHERE b.reportsto IS NOT NULL
ORDER BY a.firstname ASC

/*
9. Join with Date Filtering:  
   Write a query to display all the invoices that were created in the year 2010
   Include the invoice ID, customer’s full name, and invoice date.
*/

--NOTE: Tidak ada invoice di tahun 2023, jadi kita asumsi menggunakan tahun 2010

SELECT
inv.invoiceid,
cust.firstname,
cust.lastname,
inv.invoicedatemade --SUBSTR(invoicedate,1,10) di sini digunakan untuk dipanggil karena yang dibutuhkan invoicedate
FROM
(
  SELECT invoiceid, SUBSTR(invoicedate,1,10) invoicedatemade, customerid
  FROM invoices
  WHERE SUBSTR(invoicedatemade,1,4) == '2010'
) inv
LEFT JOIN
(
  SELECT customerid, firstname, lastname
  FROM customers
) cust
ON inv.customerid = cust.customerid
;

--- RICK888

/*
10. Complex Join with Multiple Conditions:  
   Write a query to list the names of all customers who have purchased more than 5 tracks. Include the customer’s full name, number of tracks purchased, and total revenue they generated.
*/   

--Yang ini saya tidak terbayang
