--PODZAPYTANIA--

--CWICZENIE1--
--1. Podaj łączną wartość zamówienia o numerze 10250 (uwzględnij cenę za przesyłkę)
select (select SUM((1-Discount)*UnitPrice*Quantity) from [Order Details] where OrderID = 10250) + Freight
from orders
where OrderID =10250

--2. Podaj łączną wartość każdego zamówienia (uwzględnij cenę za przesyłkę)
select (select SUM((1-Discount)*UnitPrice*Quantity) from [Order Details] where OrderID = o_out.OrderID) + Freight
from orders as o_out

--3. Dla każdego produktu podaj maksymalną wartość zakupu tego produktu
select (select MAX(UnitPrice) from [Order Details] where OrderID = o_out.OrderID) + Freight
from orders as o_out

--4. Dla każdego produktu podaj maksymalną wartość zakupu tego produktu w 1997r
select (select MAX(UnitPrice) from [Order Details] where OrderID = o_out.OrderID and ) + Freight
from orders as o_out

