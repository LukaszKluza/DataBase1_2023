--CWICZENIE--

--1.Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza library). Interesuje nas imię, nazwisko i data urodzenia dziecka.
select firstname, lastname, birth_date 
from member m join  juvenile j on m.member_no = j.member_no

--2. Napisz polecenie, które podaje tytuły aktualnie wypożyczonych książek
select distinct title 
from title t join loan l on t.title_no = l.title_no

--3. Podaj informacje o karach zapłaconych za przetrzymywanie książki o tytule ‘Tao Teh Kingʼ. Interesuje nas data oddania książki, ile dni była przetrzymywana i jaką zapłacono karę


--4. Napisz polecenie które podaje listę książek (mumery ISBN) zarezerwowanych przez osobę o nazwisku: Stephen A. Graff
select distinct isbn 
from reservation r join member m 
on r.member_no = m.member_no
where lastname = 'Graff' and firstname = 'Stephen' and middleinitial = 'A'

--JOIN kilku tabel--

--1. Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza library). Interesuje nas imię, nazwisko, data urodzenia dziecka i adres zamieszkania dziecka.
select firstname, lastname, birth_date, city, zip from juvenile as j
join member as m on j.member_no = m.member_no
join adult as a on j.adult_member_no = a.member_no 

--2. Napisz polecenie, które wyświetla listę dzieci będących członkami biblioteki (baza library). Interesuje nas imię, nazwisko, data urodzenia dziecka, adres zamieszkania
--dziecka oraz imię i nazwisko rodzica.
select mc.firstname AS child_firstnam4, mc.lastname AS child_lastname, j.birth_date AS child_birth_date, ma.firstname AS parent_firstname, ma.lastname AS parent_lastname, city, zip
from juvenile AS j
join member AS mc ON j.member_no = mc.member_no
join member AS ma ON j.adult_member_no = ma.member_no
join adult AS a ON j.adult_member_no = a.member_no;

--SELF JOIN--

-- 3. Napisz polecenie, które wyświetla adresy członków biblioteki, którzy mają dzieci urodzone przed 1 stycznia 1996 (baza library)
select DISTINCT ma.firstname as parent_firstname, ma.lastname as parent_lastname, city, zip
from juvenile as j
join member as mc on j.member_no = mc.member_no
join member as ma on j.adult_member_no = ma.member_no
join adult as a on j.adult_member_no = a.member_no
where YEAR(birth_date) < 1996

--4. Napisz polecenie, które wyświetla adresy członków biblioteki, którzy mają dzieci urodzone przed 1 stycznia 1996. 
--Interesują nas tylko adresy takich członków biblioteki, którzy aktualnie nie przetrzymują książek. (baza library)
select DISTINCT ma.firstname as parent_firstname, ma.lastname as parent_lastname, city, zip
from juvenile as j
join member as mc on j.member_no = mc.member_no
join member as ma on j.adult_member_no = ma.member_no
join adult as a on j.adult_member_no = a.member_no
left join loan as l on mc.member_no = l.member_no
where YEAR(birth_date) < 1996 and l.member_no is NULL










