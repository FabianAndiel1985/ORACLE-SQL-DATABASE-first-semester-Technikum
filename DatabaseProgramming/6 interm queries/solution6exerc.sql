-----1

select p.vorname, p.nachname, sum(g.gewicht) as gesamtgewicht, (sum(g.gewicht) - 20)*7.2 as preis
from person p
join gepaeck g
on p.personID = g.personID
group by p.personID, p.vorname, p.nachname, g.flugID
having sum(g.gewicht) > 20
order by 2,1;

-----2

select vorname,flugnummer, nachname, geburtsdatum, sitzplatznummer, to_char(geburtsdatum,'mmdd') as geburtsdatumComp
from person pe
join passagierliste pl
on pl.personID = pe.personID
join flug fl 
on fl.flugID = pl.flugID
where to_char(geburtsdatum,'mmdd') between to_char(abflugzeit-4,'mmdd') and to_char(abflugzeit+4,'mmdd');  
;


---------3

select vorname, nachname
from person pe 
join flugpersonal fl 
on pe.personID = fl.personID
left join passagierliste pl
on pl.personID = fl.personID
where pl.personID is null
order by 2,1;

-----------4

select flugnummer, bezeichnung, count(pl.personID) as Anzahl
from flug fl
join passagierliste pl
on fl.flugID = pl.flugID
join person pe  
on pe.personID = pl.personID
left join reisepass rp
on rp.personID = pe.personID
left join land la
on la.landID = rp.landID
where mod(substr(fl.flugnummer,3),2) != 0
group by flugnummer, bezeichnung
order by 1,2
;

------------------5

select to_char(abflugzeit + (dauer-ab.gmt_abweichung+an.gmt_abweichung)/24,'yyyy-mm-dd hh24:mi:ss' ) as ankunft from flug 
join flughafen ab 
on ab.flughafenID = flughafen_abflug
join flughafen an 
on an.flughafenID = flughafen_destination
where flugnummer = 'OS1467';

-----------------6

select vorname, nachname 
from person pe
join passagierliste pl 
on pe.personID = pl.personID 
join flug fl 
on pl.flugID = fl.flugID
join flughafen fh
on fl.flughafen_abflug = fh.flughafenID
where fh.bezeichnung = 'Madrid Borajas' 
and pe.personID in (
select pe.personID 
from person pe
join passagierliste pl
on pl.personID = pe.personID 
join flug fl 
on fl.flugID = pl.flugID
join flughafen fh 
on fh.flughafenID = fl.flughafen_abflug
where fh.bezeichnung = 'Amsterdam Flughafen Schipol'
);


------------------------------------------8

insert into flug(flugID, flugzeugID, gateid,flughafen_abflug,flughafen_destination,flugnummer,dauer,abflugzeit) 
select (select max(flugid)+1 from flugzeug), flugzeugid, gateid,flughafen_abflug,flughafen_destination,'OS1469',dauer,abflugzeit + 3/48
from flug 
where flugnummer = 'OS1467' ;

insert into passagierliste(flugid,personid,sitzplatznummer) 
select (select flugid from flug where flugnummer='OS1469'), 19,'10B' from dual;

insert into gepaeck 
select(select max(gepaeckID)+1 from gepaeck), 19, 2,(select gewicht from gepaeck where gepaeck.personID =19) from dual;

delete from gepaeck where flugid = 1; 




