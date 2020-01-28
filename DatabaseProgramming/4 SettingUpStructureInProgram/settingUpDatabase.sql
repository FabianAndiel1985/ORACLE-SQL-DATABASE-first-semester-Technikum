create sequence plz1 
start with 1010
increment by 10 
minvalue 1010
maxvalue 1230;

create sequence hausnummer1 
start with 1
increment by 1 
minvalue 1
maxvalue 300;

create sequence addrid1 
start with 1
increment by 1 
minvalue 1
nomaxvalue;

create sequence fkaddrid1 
start with 1
increment by 1 
minvalue 1
nomaxvalue;

create sequence f_id1
start with 1
increment by 1 
minvalue 1
nomaxvalue;


create sequence uid1 
start with 1000000000
increment by 1 
minvalue 1
nomaxvalue;

create sequence tel1 
start with 1265781
increment by 1 
minvalue 1
nomaxvalue;


insert into ort1 values(plz1.nextval, 'Wien');

insert into ort1 values(plz1.nextval, 'Wien');

insert into ort1 values(plz1.nextval, 'Wien',);

select * from adressen1;

insert into adressen1 values(addrid1.nextval,'Classic',1010, hausnummer1.nextval);
insert into adressen1 values(addrid1.nextval,'Classic',1020, hausnummer1.nextval);
insert into adressen1 values(addrid1.nextval,'Classic',1030, hausnummer1.nextval);
insert into adressen1 values(addrid1.nextval,'Classic',1040, hausnummer1.nextval);


select * from filialen1;

insert all 
into filialen1 values(f_id1.nextval,uid1.nextval,'Classic',tel1.nextval,11,'1',fkaddrid1.nextval)
into filialen1 values(f_id1.nextval,uid1.nextval,'Classic',tel1.nextval,11,'1',fkaddrid1.nextval)
into filialen1 values(f_id1.nextval,uid1.nextval,'Classic',tel1.nextval,11,'1',fkaddrid1.nextval)
select * from dual;

insert into filialen1 values(f_id1.nextval,uid1.nextval,'Classic',tel1.nextval,11, 1 ,fkaddrid1.nextval);
insert into filialen1 values(f_id1.nextval,uid1.nextval,'Classic',tel1.nextval,11, 1 ,fkaddrid1.nextval);
insert into filialen1 values(f_id1.nextval,uid1.nextval,'Classic',tel1.nextval,10, 0 ,fkaddrid1.nextval);
insert into filialen1 values(f_id1.nextval,uid1.nextval,'Classic',tel1.nextval,14, 0 ,fkaddrid1.nextval);
insert into filialen1 values(1,uid1.nextval,'Classic',tel1.nextval,14, 0 ,1);

select * from ort1;
select * from adressen1;
select * from filialen1;

alter table rechnungen1
add fk_f_id int not null references filialen1 (f_id); 


create sequence rechn_nr1 
start with 1001 
increment by 1 
minvalue 1001;

create sequence fk_f_id1  
start with 1 
increment by 1
minvalue 1
maxvalue 4
cache 3
cycle;

select * from rechnungen1;

insert into rechnungen1 values(rechn_nr1.nextval,to_date('02.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('02.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('02.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('02.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('02.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('02.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('03.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('03.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('03.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('04.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('04.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('05.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('06.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);
insert into rechnungen1 values(rechn_nr1.nextval,to_date('07.01.2020', 'dd.mm.yy'), fk_f_id1.nextval);

select* from produkte1;




create sequence preis1 
start with 1
increment by 2 
minvalue 1
maxvalue 20
cache 9;

Drop sequence ausgelaufen1;

create sequence ausgelaufen1 
start with 0
increment by 1
minvalue 0
maxvalue 1
cycle
cache 2;

select * from produkte1;

create table produkte1 ( 
produkt_id int primary key, 
"name" varchar(20) not null,
preis number(10,2) not null check(preis >0),
mwst number(4,2) not null check(mwst in ('0.10','0.20')),
ausgelaufen char(1)not null check(ausgelaufen in ('1','0'))
);

insert into produkte1 values(produkt_id1.nextval,'Produkt1',10.10,0.1,ausgelaufen1.nextval);
insert into produkte1 values(produkt_id1.nextval,'Produkt2',11.10,0.1,ausgelaufen1.nextval);
insert into produkte1 values(produkt_id1.nextval,'Produkt3',13.10,0.2,1);
insert into produkte1 values(produkt_id1.nextval,'Produkt4',13.10,0.2,0);
insert into produkte1 values(produkt_id1.nextval,'Produkt5',13.10,0.2,0);
insert into produkte1 values(produkt_id1.nextval,'Produkt6',13.10,0.1,0);
insert into produkte1 values(produkt_id1.nextval,'Produkt7',1.10,0.1,0);
insert into produkte1 values(produkt_id1.nextval,'Produkt8',1.10,0.1,0);
insert into produkte1 values(produkt_id1.nextval,'Produkt9',1.10,0.1,0);
insert into produkte1 values(produkt_id1.nextval,'Produkt10',1.10,0.1,0);

create table rechn_prod1 ( 
id int primary key,
fk_rechnn_nr int references rechnungen1 (rechn_nr),
fk_produkt_id int references produkte1 (produkt_id),
preis number(10,2) not null check(preis >0),
mwst number(4,2) not null check(mwst in ('0.10','0.20'))
);

create sequence id1 
start with 1
increment by 1 
minvalue 1
maxvalue 15
cycle
cache 9;

create sequence produkt_id1 
start with 1
increment by 1 
minvalue 1
maxvalue 10
cycle
cache 9;

create sequence rechn_nr1 
start with 1001 
increment by 1 
minvalue 1001;

select * from rechn_prod1;

select * from rechn_prod1;

insert into rechn_prod1 values (1,1002,1,(select preis from produkt1 where ) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,11.00 , 0.10) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,13.20 , 0.20) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,12.30 , 0.10) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,12.40 , 0.20) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,12.00 , 0.10) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,19.60 , 0.10) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,12.00 , 0.20) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,13.00 , 0.10) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,12.00 , 0.10) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,11.00 , 0.20) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,10.50 , 0.10) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,12.10 , 0.20) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,12.00 , 0.10) ;
insert into rechn_prod1 values (id1.nextval,rechn_nr1.nextval,produkt_id1.nextval,12.00 , 0.10) ;
) ;
