--CWICZENIE 1--

--1. Napisz polecenie, które oblicza wartość sprzedaży dla każdego zamówienia w tablicy order details i zwraca wynik posortowany w malejącej kolejności (wg wartości sprzedaży).
SELECT OrderID, sum(UnitPrice*[Quantity]) from [Order Details]
GROUP BY OrderID
ORDER BY 2 DESC

--2. Zmodyfikuj zapytanie z poprzedniego punktu, tak aby zwracało pierwszych 10 wierszy
SELECT TOP 10 OrderID, sum(UnitPrice*[Quantity]) from [Order Details]
GROUP BY OrderID
ORDER BY 2 DESC

--CWICZENIE 2--

--1. Podaj liczbę zamówionych jednostek produktów dla produktów, dla których productid < 3
SELECT ProductID, COUNT(OrderID) from [Order Details] 
WHERE ProductID < 3
GROUP BY ProductID

--2. Zmodyfikuj zapytanie z poprzedniego punktu, tak aby podawało liczbę zamówionych jednostek produktu dla wszystkich produktów
SELECT ProductID, COUNT(OrderID) from [Order Details] 
GROUP BY ProductID

--3. Podaj nr zamówienia oraz wartość zamówienia, dla zamówień, dla których łączna liczba zamawianych jednostek produktów jest > 250 
SELECT OrderID, SUM(UnitPrice*Quantity) from [Order Details] 
GROUP BY OrderID
HAVING SUM(Quantity) > 250

--CWICZENIE 3--

--1. Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień
SELECT EmployeeID, count(OrderID) from Orders
GROUP BY EmployeeID

--2. Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę" przewożonych przez niego zamówień
SELECT ShipVia, sum(Freight) from Orders
Group BY ShipVia

--3. Dla każdego spedytora/przewoźnika podaj wartość "opłata za przesyłkę" przewożonych przez niego zamówień w latach o 1996 do 1997
SELECT ShipVia, sum(Freight) from Orders
WHERE YEAR(ShippedDate) = 1997 or YEAR(ShippedDate) = 1996
Group BY ShipVia

--CWICZENIE 4--
--1. Dla każdego pracownika podaj liczbę obsługiwanych przez niego zamówień z podziałem na lata i miesiące
SELECT EmployeeID, YEAR(OrderDate) AS YEAR, MONTH(OrderDate) AS MONTH, count(OrderID) from Orders
GROUP BY EmployeeID, YEAR(OrderDate), MONTH(OrderDate)
WITH ROLLUP

--2. Dla każdej kategorii podaj maksymalną i minimalną cenę produktu w tej kategorii
SELECT CategoryID, MIN(UnitPrice), MAX(UnitPrice) from Products
GROUP BY CategoryID
