
/*Q-1*/

select (upper(LEFT(fname, 1))+LOWER(SUBSTRING(fname,2,LEN(fname)))+' '+upper(LEFT(sname, 1))+LOWER(SUBSTRING(sname,2,LEN(sname)))+' '+upper(LEFT(surname, 1))+LOWER(SUBSTRING(surname,2,LEN(surname)))) as 'Full Name' from student
 where fname Like '%h' and admitdate between '2006-01-01' AND '2006-08-01'

/*Q-2*/
1.
declare @totalcount int
select @totalcount = count(customerid) from customer 
SELECT salesreps.name as 'Sales Rep. Name', salesreps.hiredate as 'Hired on', office.city as 'Office City', @totalcount as 'No. of Customers',
FROM ((salesreps
INNER JOIN office ON salesreps.officeid = office.officeid)
INNER JOIN customer ON salesreps.salesrepsid = customer.salesrepsid)
where office.city like '%pur' and salesreps.hiredate > '2006-01-01' and salesreps.age > 20 and  @totalcount > 1


2.
select customer.company as 'Company Name', salesreps.name as 'Sales Rep. Name', offices.city as 'Office City', customer.creditlimit as 'Company Credit' 
  FROM  ((salesreps 
  INNER JOIN office ON salesreps.officeid = office.officeid) 
  INNER JOIN customer ON salesreps.salesrepsid = customer.salesrepsid)


3.
declare @total int 
select @total = count(salesrepsid) from salesreps
declare @diff int
select @diff =  (cast (targetsales as int)- cast (actualsales as int))  from office 
print @diff
SELECT offices.city as 'Office City',@total as 'No. of Sales Rep.',salesreps.sales as 'Total Sale', office.targetsales, office.actualsales ,@diff As Difference
FROM  office INNER JOIN salesreps ON office.officeid = salesreps.officeid


4.
declare @total int 
select @total = COUNT(orderid) from orders
declare @price int 
select @price = price from product
declare @quantity int
select @quantity = cast (qty as int) from orders
declare @amount int
set @amount = @price * @quantity
print @amount
SELECT salesreps.designation, products.price, products.qtyonhand, @total as Orders, orders.qty ,@amount As 'Total Amount'
FROM  ((salesreps 
	INNER JOIN orders ON salesreps.salesrepid = orders.salesrepid) 
	INNER JOIN dbo.Products ON orders.productid = products.productid)


5.
declare @price int 
select @price = Price from products
declare @quantity int
select @quantity = cast (qty as int) from orders
declare @amount int
set @amount = @price * @quantity
print @amount
select company , @quantity as 'Total Quantity Ordered', @amount as 'Total Amount'  from customer


6.
declare @date date
set @date = dateAdd(year,-5,getdate())
select name, hiredate, quota, sales from salesreps where hiredate > @date


7.
select @totalcount = count(customerid) from customer 
select products.description, @totalcount as 'Total Customer' from products 
