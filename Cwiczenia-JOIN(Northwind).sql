--Cwiczenia--

--1. Wybierz nazwy i ceny produktów (baza northwind) o cenie jednostkowej pomiędzy 20.00 a 30.00, dla każdego produktu podaj dane adresowe dostawcy
select ProductName, UnitPrice
from Products join Suppliers on Products.SupplierID = Suppliers.SupplierID
where UnitPrice > 20 and UnitPrice < 30

--2. Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów dostarczanych przez firmę ‘Tokyo Tradersʼ
select ProductName, UnitsInStock
from Products p join Suppliers s on p.SupplierID = s.SupplierID
where s.CompanyName = 'Tokyo Traders'

--3. Czy są jacyś klienci którzy nie złożyli żadnego zamówienia w 1997 roku, jeśli tak to pokaż ich dane adresowe
select address from customers as c
left outer join orders as o
on c.CustomerID = o.CustomerID and YEAR(o.OrderDate) = 1997 
where o.OrderID is null

--4. Wybierz nazwy i numery telefonów dostawców, dostarczających produkty, których aktualnie nie ma w magazynie.
select CompanyName, Phone
from Products p join Suppliers s on p.SupplierID = s.SupplierID
where p.UnitsInStock = 0

--JOIN kilku tabel--

-- 1. Wybierz nazwy i ceny produktów (baza northwind) o cenie jednostkowej pomiędzy 20.00 a 30.00, dla każdego produktu podaj dane adresowe dostawcy, interesują nas
-- tylko produkty z kategorii ‘Meat/Poultryʼ
select ProductName, UnitPrice, Address from Products as p
join Suppliers as s on p.SupplierID = s.SupplierID
join Categories as c on p.CategoryID = c.CategoryID
where CategoryName = 'Meat/Poultry' and UnitPrice >= 20 and UnitPrice <=30

--2. Wybierz nazwy i ceny produktów z kategorii ‘Confectionsʼ dla każdego produktu podaj nazwę dostawcy.
select ProductName, UnitPrice, CompanyName from Products as p
join Suppliers as s on p.SupplierID = s.SupplierID
join Categories as c on p.CategoryID = c.CategoryID
where CategoryName = 'Confections'


--3. Wybierz nazwy i numery telefonów klientów , którym w 1997 roku przesyłki dostarczała firma ‘United Packageʼ
select DISTINCT c.CompanyName, c.Phone  from Orders as o 
join Customers as c on o.CustomerID = c.CustomerID
join Shippers as s on o.ShipVia = s.ShipperID
where YEAR(ShippedDate) = 1997 and s.CompanyName = 'United Package'


--4. Wybierz nazwy i numery telefonów klientów, którzy kupowali produkty z kategorii ‘Confectionsʼ
select DISTINCT CompanyName, Phone from Customers as c 
join Orders as o on c.CustomerID = o.CustomerID
join [Order Details] as od on o.OrderID = od.OrderID
join Products as p on od.ProductID = p.ProductID
join Categories as ca on p.CategoryID = ca.CategoryID
where CategoryName = 'Confections'

--SELF JOIN--

--1. Napisz polecenie, które wyświetla pracowników oraz ich podwładnych (baza northwind)
select a.EmployeeID, a.LastName, b.EmployeeID, b.LastName from Employees as a
join Employees as b on a.ReportsTo = b.EmployeeID

--2. Napisz polecenie, które wyświetla pracowników, którzy nie mają podwładnych (baza northwind)
select a.EmployeeID, a.LastName
from Employees as a
left join Employees as b on a.EmployeeID = b.ReportsTo
where b.EmployeeID is null;

--DODATKOWE--
-- Napisz polecenie zwracające listę produktów które nie były zamawiane w dniu 1996-07-08
select DISTINCT ProductID from Products 
where ProductID NOT IN 
(select DISTINCT p.ProductID from Products as p 
join [Order Details] as od on p.ProductID = od.ProductID 
join Orders as o on od.OrderID = o.OrderID
where OrderDate = '1996-07-08')

--nie działa--

-- Napisz polecenie zwracające listę produktów które nie były zamawiane w dniu 1996-07-08
select DISTINCT p.ProductID from Products as p 
join [Order Details] as od on p.ProductID = od.ProductID 
join Orders as o on od.OrderID = o.OrderID and o.OrderDate = '1996-07-08' 
LEFT join Products as pr on pr.ProductID = p.ProductID
where o.OrderDate is NULL


--1. Napisz polecenie, które wyświetla pracowników, którzy mają podwładnych (baza northwind)
select DISTINCT b.EmployeeID, b.LastName from Employees as a
join Employees as b on a.ReportsTo = b.EmployeeID














