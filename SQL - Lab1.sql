--zad 5--
declare @id int
set @id = (select CategoryID from Categories where CategoryName = 'Meat/Poultry')

select * from Products where CategoryID = @id

SELECT Products.ProductName, Products.UnitPrice
FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Meat/Poultry'

--Like--


--2. Wyszukaj informacje o stanowisku pracowników, których nazwiska zaczynają się na literę z zakresu od B do L

SELECT Title
FROM Employees
WHERE firstname LIKE '[B-L]%'


--Napisz instrukcję select tak aby wybrać numer zlecenia, datę zamówienia, numer klienta dla wszystkich niezrealizowanych jeszcze zleceń, dla których krajem odbiorcy jest Argentyna
Select OrderID, OrderDate, CustomerID
from Orders
where (ShippedDate is Null or ShippedDate > GETDATE()) and ShipCountry = 'Argentina'

SELECT getdate() 

-- 2. Napisz polecenie które dla każdego dostawcy (supplier) pokaże pojedynczą kolumnę zawierającą nr telefonu i
-- nr faksu w formacie
-- (numer telefonu i faksu mają być oddzielone przecinkiem)
SELECT Suppliers.SupplierID,
       Suppliers.Phone + ',' + IIF(Suppliers.Fax IS NULL, '', Suppliers.Fax)
FROM Suppliers