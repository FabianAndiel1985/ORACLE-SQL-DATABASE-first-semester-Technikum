--------------------- 3

select dr.bezeichnung, nachname, vorname, fi.bezeichnung, count(cr.flugID) as Anzahl, sum(dauer) as gesamtdauer
from person pe
join personal pl
on pl.personID = pe.personID
join flugpersonal fg
on fg.personID = pe.personID
join dienstrang dr
on dr.dienstrangID = fg.dienstrangID
join crew cr 
on pl.personID = cr.personID
join flug fl 
on cr.flugID = fl.flugID
join flugzeug fz
on fz.flugzeugID = fl.flugzeugID
join fluglinie fi 
on fi.fluglinieID = fz.fluglinieID
group by dr.bezeichnung, nachname, vorname, fi.bezeichnung
order by 2 asc, 1 asc, gesamtdauer desc;

-------------------------------------------4

select 'Bodenpersonal' as gruppe, ab.bezeichnung, vorname,nachname,sozversnr, reisepassnr 
from person pe 
join personal pl 
on pe.personID = pl.personID
join bodenpersonal bl 
on bl.personID = pl.personID
join abteilung ab
on ab.abteilungsID = bl.abteilungsID
left join reisepass rp 
on pe.personID = rp.personID

union

select 'Flugpersonal' as gruppe, dr.bezeichnung, vorname,nachname,sozversnr, reisepassnr 
from person pe 
join personal pl 
on pe.personID = pl.personID
join flugpersonal fl 
on fl.personID = pl.personID
join dienstrang dr
on dr.dienstrangID = fl.dienstrangID
left join reisepass rp 
on pe.personID = rp.personID

order by 1,2,4,3;

----------------------------- 6


select  fg.bezeichnung, ft.bezeichnung, flugstunden_gesamt + flugstunden_pro_wartung-flugstunden_letzte_wartung as restzeit
from fluglinie fg
join flugzeug fl 
on fl.fluglinieID = fg.fluglinieID
join flugzeugtyp ft
on ft.flugzeugtypID = fl.flugzeugtypID;













