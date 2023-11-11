--Cwiczenia koncowe JOIN

--Cwiczenie 1--

--1. Dla każdego zamówienia podaj łączną liczbę zamówionych jednostek towaru oraz nazwę klienta
use northwind 
select od.OrderID,  sum(Quantity), c.CompanyName from [Order Details] as od
join Orders as o on od.OrderID = o.OrderID 
join Customers as c on o.CustomerID = c.CustomerID
GROUP BY od.OrderID, c.CompanyName

--2. Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których łączna liczbę zamówionych jednostek jest większa niż 250
use Northwind 
select od.OrderID,  sum(Quantity), c.CompanyName from [Order Details] as od
join Orders as o on od.OrderID = o.OrderID 
join Customers as c on o.CustomerID = c.CustomerID
GROUP BY od.OrderID, c.CompanyName
HAVING SUM(Quantity) > 250

--3. Dla każdego zamówienia podaj łączną wartość tego zamówienia oraz nazwę klienta.
use Northwind
select od.OrderID,  sum(Quantity*UnitPrice*(1-Discount)), c.CompanyName from [Order Details] as od
join Orders as o on od.OrderID = o.OrderID 
join Customers as c on o.CustomerID = c.CustomerID
GROUP BY od.OrderID, c.CompanyName

--4. Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których łączna liczba jednostek jest większa niż 250.
use Northwind
select od.OrderID,  sum(Quantity*UnitPrice*(1-Discount)), c.CompanyName from [Order Details] as od
join Orders as o on od.OrderID = o.OrderID 
join Customers as c on o.CustomerID = c.CustomerID
GROUP BY od.OrderID, c.CompanyName
HAVING sum(Quantity) > 250

--5. Zmodyfikuj poprzedni przykład tak żeby dodać jeszcze imię i nazwisko pracownika obsługującego zamówień
use Northwind
select od.OrderID,  sum(Quantity*UnitPrice*(1-Discount)), c.CompanyName as company, FirstName as e_name, LastName as e_lastname from [Order Details] as od
join Orders as o on od.OrderID = o.OrderID 
join Customers as c on o.CustomerID = c.CustomerID
join Employees as e on e.EmployeeID = o.EmployeeID
GROUP BY od.OrderID, c.CompanyName, LastName, FirstName
HAVING sum(Quantity) > 250

--Cwiczenie 2-- 

--1. Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych przez klientów jednostek towarów z tek kategorii.
use Northwind
select CategoryName, SUM(Quantity) from Categories as c
join Products as p on c.CategoryID = p.CategoryID
join [Order Details] as od on p.ProductID = od.ProductID
group by CategoryName

--2. Dla każdej kategorii produktu (nazwa), podaj łączną wartość zamówionych przez klientów jednostek towarów z tek kategorii.

use Northwind
select CategoryName, SUM((1-Discount)*od.UnitPrice*Quantity) from Categories as c
join Products as p on c.CategoryID = p.CategoryID
join [Order Details] as od on p.ProductID = od.ProductID
group by CategoryName

--3. Posortuj wyniki w zapytaniu z poprzedniego punktu wg:
-- a) łącznej wartości zamówień
-- b) łącznej liczby zamówionych przez klientów jednostek towarów.

use Northwind
select CategoryName, SUM((1-Discount)*od.UnitPrice*Quantity) from Categories as c
join Products as p on c.CategoryID = p.CategoryID
join [Order Details] as od on p.ProductID = od.ProductID
group by CategoryName
order by 2,  SUM(od.Quantity)

--4. Dla każdego zamówienia podaj jego wartość uwzględniając opłatę za przesyłkę
use Northwind
select o.OrderID, SUM((1-Discount)*od.UnitPrice*Quantity)+Freight from Orders as o 
join [Order Details] as od on o.OrderID = od.OrderID
group by o.OrderID, o.Freight

--Cwiczenie 3-- 

--1. Dla każdego przewoźnika (nazwa) podaj liczbę zamówień które przewieźli w 1997r
select CompanyName, count(OrderID) from Orders as o 
join Shippers as s on s.ShipperID = o.ShipVia
where YEAR(ShippedDate) = 1997
group by CompanyName


--3. Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień obsłużonych przez tego pracownika
select FirstName LastName, SUM((1-Discount)*od.UnitPrice*Quantity) from Employees as e
join Orders as o on o.EmployeeID = e.EmployeeID
join [Order Details] as od on od.OrderID = o.OrderID
where YEAR(ShippedDate) = 1997
group by FirstName, LastName










