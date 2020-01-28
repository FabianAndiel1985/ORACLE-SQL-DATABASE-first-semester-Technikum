--1
select plz from ort 
where bezeichnung = 'Wien';

--2
select vorname, nachname 
from person 
where vorname = 'Alexander' and
(nachname like 'M%' or nachname like 'N%');

--3
select vorname,nachname 
from person
where nachname like 'Ma_er';

--4
select concat(concat(vorname,' '), nachname) as "Name" from
person;

--5
select gehaltsstufeID, monatsgehalt 
from gehaltsstufe 
where monatsgehalt between 2000 and 3000;

select gehaltsstufeID, monatsgehalt 
from gehaltsstufe 
where monatsgehalt > 1999.99 and monatsgehalt < 3000;

--6
select reisepassnr 
from reisepass 
where reisepassnr like '2%5%5%0';

--7
select distinct vorname 
from personen;

--8
select gehaltsstufeID as "Gehaltsstufe" , monatsgehalt*14 as "Jahresgehalt" 
from gehaltsstufe;

--9
select count(*) from abteilung;

--10
select bezeichnung 
from flugzeugtyp 
where flugstrecke_maximal > 10000 
and ( sitzplaetze between 100 and 160 );


-- 11
select kennzeichen, bezeichnung
from land 
where kennzeichen not like 'AUT' and 
kennzeichen not like 'GER';

-- <> and !=
select kennzeichen, bezeichnung 
from land
where bezeichnung <> 'Österreich' and bezeichnung <> 'Deutschland';

-- 12
select gepaeckid, personid, flugid, gewicht, (gewicht - 20)*2.5 as "Aufpreis" from gepaeck
where gewicht > 20;

select gepaeck.*, (gewicht -20)*2.5 as "Aufpreis"
from gepaeck
where gewicht > 20;
;

--13
select nachname, count(*) 
from person 
where nachname like '___' or nachname like '____'
group by nachname;

--14
select vorname, nachname, bezeichnung 
from person 
join reisepass
on person.personID = reisepass.personID
join land 
on land.landID = reisepass.landID 
where land.kennzeichen = 'AUT';

--15
select vorname, nachname, reisepassID 
from person
left join reisepass
on reisepass.personID = person.personID
where reisepassID is null
order by 2, 1 asc;





