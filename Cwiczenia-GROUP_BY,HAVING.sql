--1. Podaj liczbę produktów o cenach mniejszych niż 10$ lub większych niż 20$
SELECT count(*) from Products 
where UnitPrice < 10 OR UnitPrice >=20

--2. Podaj maksymalną cenę produktu dla produktów o cenach poniżej 20$
SELECT MAX(UnitPrice) from Products
WHERE UnitPrice < 20

--3. Podaj maksymalną i minimalną i średnią cenę produktu dla produktów o produktach sprzedawanych w butelkach (‘bottle’)
SELECT MAX(UnitPrice) MAX, MIN(UnitPrice) MIN, AVG(UnitPrice) AVG from Products
WHERE QuantityPerUnit LIKE '%bottles%'

--4. Wypisz informację o wszystkich produktach o cenie powyżej średniej
SELECT ProductName, UnitPrice from Products
WHERE UnitPrice > (Select AVG(UnitPrice) from Products)

--5. Podaj sumę/wartość zamówienia o numerze 10250
SELECT sum(UnitPrice*Quantity*(1-Discount)) FROM [Order Details]
WHERE OrderID = 10250

--GROUP BY--

--1. Podaj maksymalną cenę zamawianego produktu dla każdego zamówienia
SELECT OrderID, MAX(UnitPrice) from [Order Details]
GROUP BY OrderID

--2. Posortuj zamówienia wg maksymalnej ceny produktu
SELECT OrderID, MAX(UnitPrice)  from [Order Details]
GROUP BY OrderID 
ORDER BY 2 DESC

--3. Podaj maksymalną i minimalną cenę zamawianego produktu dla każdego zamówienia
SELECT MIN(UnitPrice) AS MIN, MAX(UnitPrice) AS MAX from [Order Details]
GROUP BY OrderID 

--4. Podaj liczbę zamówień dostarczanych przez poszczególnych spedytorów (przewoźników)
SELECT ShipVia, COUNT(OrderID) from Orders
GROUP BY ShipVia

--5. Który z spedytorów był najaktywniejszy w 1997 roku
SELECT TOP 1 ShipVia, COUNT(OrderID) from Orders
WHERE YEAR(ShippedDate) = 1997
GROUP BY ShipVia
ORDER BY 2 DESC

--HEAVING

--1. Wyświetl zamówienia dla których liczba pozycji zamówienia jest większa niż 5
SELECT OrderID from [Order Details]
GROUP BY OrderID
HAVING COUNT(ProductID) > 5

--2. Wyświetl klientów dla których w 1998 roku zrealizowano więcej niż 8 zamówień (wyniki posortuj malejąco wg łącznej kwoty za dostarczenie zamówień dla każdego z klientów)

select CustomerID from Orders 
WHERE YEAR(ShippedDate) = 1998 
GROUP BY CustomerID 
HAVING COUNT(OrderID) > 8
ORDER BY SUM(Freight) DESC