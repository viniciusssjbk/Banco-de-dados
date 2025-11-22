/*/CONSULTAS SQL/*/

/*/questão 1/*/

select ArtistId, Name from tarefabd.artist;

/*/questão 2/*/

select COUNT(g.GenreId) as quant_genero from tarefabd.genre as g;

/*/questao 3/*/

select FirstName,LastName,Email from tarefabd.Customer;

/*/questao 4/*/

select Name from tarefabd.MediaType;

/*/questao 5/*/

select Title,ArtistId from tarefabd.album;

/*/questao 6/*/

select COUNT(EmployeeId) as quant_func from tarefabd.employee;

/*/questao 7/*/

select Name from tarefabd.playlist;

/*/questao 8/*/

select UnitPrice from tarefabd.track where TrackId = 10;

/*/questao 9/*/

select distinct Country from tarefabd.customer;

/*/questao 10/*/

select COUNT(InvoiceId) as quant_fatura from tarefabd.invoice;

/*/questao 11/*/

select FirstName,LastName from tarefabd.Customer where Country = 'Brazil';

/*/questao 12/*/

select*from tarefabd.track where UnitPrice > 1;

/*/questao 13/*/

select*from tarefabd.employee where HireDate between '2002-01-01' and '2003-01-01';

/*/questao 14/*/

select*from tarefabd.track where genreId=1;

/*/questao 15/*/

select*from tarefabd.employee where Title='Sales Manager';

/*/questiao 16/*/

select COUNT(InvoiceId) as client_fatu from tarefabd.invoice where CustomerId = 1;

/*/questiao 17/*/

select*from tarefabd.track where milliseconds > 300000;

/*/questiao 18/*/

select*from tarefabd.album where artistid =1;

/*/questiao 19/*/

select*from tarefabd.customer where supportrepid = null;

/*/questiao 20/*/

select count(trackid) from tarefabd.PlaylistTrack where playlistid = 1;

/*/questiao 21/*/

select t.name as nome_track, g.name as nome_genre from tarefabd.track as t, tarefabd.genre as g where t.genreid = g.genreid;

/*/questiao 22/*/

select c.firstname,c.lastname, i.total from tarefabd.customer as c, tarefabd.invoice as i where c.customerid = i.customerid;

/*/questiao 23/*/

select a.name, l.title from tarefabd.artist as a, tarefabd.album as l where a.artistid = l.artistid;

/*/questiao 24/*/

select  t.name as name_track, a.name as nome_artista,*   from tarefabd.track as t  
left join tarefabd.album as l 
on t.albumid = l.albumid  
left join tarefabd.artist as a 
on a.artistid = l.artistid;

/*/questao 25/*/ 
SELECT t.name, m.name AS type_name  FROM
tarefabd.track AS t 
JOIN tarefabd.mediatype AS m
ON t.mediatypeid = m.mediatypeid

/*/questao 26/*/

SELECT 
c.firstname AS Nome_cliente,
f.firstname AS Nome_func 
FROM tarefabd.customer as c 
JOIN tarefabd.employee as f
ON c.supportrepid = f.employeeid

/*/questao 27/*/
SELECT 
composer, name, unitprice 
FROM tarefabd.track as t where t.composer IS NOT NULL 

/*/questao 28/*/

SELECT p.name, COUNT(t.trackid) as quantidade_faixa
FROM tarefabd.playlist as p
JOIN tarefabd.playlisttrack as t
ON p.playlistid = t.playlistid
group by p.playlistid 

/*/questao 29/*/
SELECT firstname from tarefabd.employee 
where reportsto IS NOT NULL

/*/ questao 30/*/
SELECT c.firstname, f.invoicedate from tarefabd.customer as c
JOIN tarefabd.invoice as f 
on c.customerid = f.customerid

/*/ questao 31 /*/
SELECT SUM(i.total) as total FROM tarefabd.invoice as i

/*/ questao 32 /*/
SELECT AVG(unitprice) as medio_preco from tarefabd.track

/*/ questao 33 /*/

SELECT a.name, COUNT(t.trackid)
FROM tarefabd.artist as a
join tarefabd.album as ab
on a.artistid = ab.artistid
join tarefabd.track as t
on t.albumid = ab.albumid
group by a.artistid

/*/ questao 34 /*/
SELECT g.name, SUM(t.milliseconds) as milliseconds
FROM tarefabd.genre as g
join tarefabd.track as t
ON t.genreid = g.genreid
group by g.genreid

/*/ questao 35 /*/
SELECT a.title, COUNT(t.trackid) as quant_faixa
FROM tarefabd.album as a
join tarefabd.track as t
ON a.albumid = t.albumid
group by a.albumid

/*/questao 36/*/
SELECT MAX(total) as maior
FROM tarefabd.invoice

/*/ questao 37/*/
SELECT t.name, COUNT(p.playlistid) as quant_playlist
FROM tarefabd.track as t
join tarefabd.playlisttrack as p
ON p.trackid = t.trackid
group by t.trackid

/*/ questao 38/*/
SELECT country, COUNT(country)
FROM tarefabd.customer
group by country

/*/ questao 39/*/
SELECT c.firstname, AVG(i.total)
FROM tarefabd.customer as c
JOIN tarefabd.invoice as i
ON c.customerid = i.customerid
group by c.customerid

/*/ questao 40 /*/
SELECT m.name, COUNT(t.trackid) from
tarefabd.mediatype as m
join tarefabd.track as t
on m.mediatypeid = t.mediatypeid
group by m.mediatypeid

/*/ questao 41 /*/
SELECT a.name FROM tarefabd.artist as a
JOIN tarefabd.album as al 
on al.artistid = a.artistid
join tarefabd.track as t 
on t.albumid = al.albumid
group by a.artistid
order by COUNT(t.trackid) DESC limit 5

/*/ questao 42 /*/

SELECT c.firstname FROM tarefabd.customer as c
join tarefabd.invoice as i
on i.customerid = c.customerid
where total>(
  select AVG(total) from tarefabd.invoice

) 

/*/ questao 43 /*/

SELECT g.name
FROM tarefabd.genre as g
JOIN tarefabd.track as t
ON t.genreid = g.genreid
GROUP BY g.genreid
ORDER BY COUNT(t.trackid) DESC
LIMIT 10;

/*/ questao 44 /*/
SELECT t.name
from tarefabd.track as t
join tarefabd.playlisttrack as p
on p.trackid = t.trackid 
group by t.trackid
having COUNT(p.playlistid)>1

/*/ questao 45/*/
SELECT c.firstname
FROM tarefabd.customer as c
join tarefabd.invoice as i 
on i.customerid = c.customerid
where i.total=(
select MAX(total) from tarefabd.invoice
)

/*/ questao 46 /*/
select f.firstname, COUNT(c.supportrepid) as quant_cliente
from tarefabd.employee as f 
join tarefabd.customer as c 
on c.supportrepid = f.employeeid
group by employeeid

/*/ questao 47 /*/
select a.title from tarefabd.album as a 
join tarefabd.track as t
on t.albumid = a.albumid
join tarefabd.genre as g 
on g.genreid = t.genreid
group by a.albumid
having COUNT(distinct g.genreid)>1

/*/ questao 48/*/
select c.firstname
FROM tarefabd.customer as c 
join tarefabd.invoice as i 
    ON i.customerid = c.customerid
group by c.customerid, c.firstname
having COUNT(distinct i.billingcountry) > 1;

/*/ questao 49 /*/

select g.name as genre, tr.name from
tarefabd.track as tr 
join tarefabd.genre as g
on tr.genreid = g.genreid
where tr.unitprice = (
  select MAX(t.unitprice) from tarefabd.track as t
  where t.genreid = g.genreid
)

/*/questao 50/*/
select DATE_TRUNC('month', invoicedate) as mes_ano, SUM(total) as total_vendas
from tarefabd.invoice
gruop by DATE_TRUNC('month', invoicedate)
order by mes_ano;


