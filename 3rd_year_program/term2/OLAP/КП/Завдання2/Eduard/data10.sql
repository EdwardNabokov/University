insert into POSITION ("id_position", "position_name", "salary", "description")
select rownum, 'Position-' || to_char(rownum), round(dbms_random.value(1.5, 11.5) * 1000), dbms_random.string('x', 10)
from dual
connect by level <= 10;
select * from position

insert into SUPPLIER ("id_supplier", "supplier_name", "supplier_info")
select rownum, 'Supplier-' || to_char(rownum), dbms_random.string('x', 10)
from dual
connect by level <= 10;

insert into PRODUCT_TYPE ("id_product_type", "product_type_name")
select rownum, 'ProductType-' || to_char(rownum)
from dual
connect by level <= 10

insert into PAYMENT_TYPE ("id_type", "payment_type_name", "description")
select rownum, 'Payment-' || to_char(rownum), dbms_random.string('x', 10)
from dual
connect by level <= 10;

insert into UNIT ("id_unit", "unit_name", "description")
select rownum, 'Unit-' || to_char(rownum), dbms_random.string('x', 10)
from dual
connect by level <= 10;

insert into TYPE_OPER ("id_oper_type", "name_oper", "description")
select rownum, 'OperationType-' || to_char(rownum), dbms_random.string('x', 10)
from dual
connect by level <= 10;

select * from stuff
insert into STUFF ("id_stuff", "name", "surname", "phone", "address", "id_position")
select rownum, 'Stuff-' || to_char(rownum), dbms_random.string('x', 10), 
'+380' || to_char(round(dbms_random.value(100000000, 999999999))), 
dbms_random.string('x', 10), round(dbms_random.value(1, 10))
from dual
connect by level <= 10;

insert into PRODUCT ("id_product", "product_name", "description", "price", "id_product_type", "id_supplier")
select rownum, 'TV-' || to_char(round(dbms_random.value(1, 75))), 
dbms_random.string('x', 10), 
round((dbms_random.value(100, 5000)), 2), 
1, 
round(dbms_random.value(1, 10))
from dual
connect by level <= 250;

insert into PRODUCT ("id_product", "product_name", "description", "price", "id_product_type", "id_supplier")
select rownum + (select idp from 
                       (select "id_product" as idp from product order by "id_product" desc)
                where rownum = 1), 
'Remote-' || to_char(round(dbms_random.value(1, 75))), 
dbms_random.string('x', 10), 
round((dbms_random.value(100, 5000)), 2), 
2, 
round(dbms_random.value(1, 10))
from dual
connect by level <= 250;

insert into PRODUCT ("id_product", "product_name", "description", "price", "id_product_type", "id_supplier")
select rownum + (select idp from 
                       (select "id_product" as idp from product order by "id_product" desc)
                where rownum = 1), 
'Lamp-' || to_char(round(dbms_random.value(1, 75))), 
dbms_random.string('x', 10), 
round((dbms_random.value(100, 5000)), 2), 
5, 
round(dbms_random.value(1, 10))
from dual
connect by level <= 250;

insert into PRODUCT ("id_product", "product_name", "description", "price", "id_product_type", "id_supplier")
select rownum + (select idp from 
                       (select "id_product" as idp from product order by "id_product" desc)
                where rownum = 1), 
'Clock-' || to_char(round(dbms_random.value(1, 75))), 
dbms_random.string('x', 10), 
round((dbms_random.value(100, 5000)), 2), 
4, 
round(dbms_random.value(1, 10))
from dual
connect by level <= 250;

/*insert into STORE ("id_store", "shelf", "date_oper", "quantity", "id_oper_type")
select rownum, round(dbms_random.value(1, 20)), 
to_date(trunc(dbms_random.value(to_char(DATE '2017-01-01'))))dbms_random.string('x', 10)
from dual
connect by level <= 10;*/

insert into INVOICE_DETAIL ("id_invoice", "id_product", "quantity", "description")
select rownum, round(dbms_random.value(1, 1000)),
round(dbms_random.value(1, 25)), 
dbms_random.string('x', 10)
from dual
connect by level <= 1000;

insert into INVOICE ("id_invoice", "id_paiment_type", "purchase_time", "id_invoice_detail", "id_stuff")
select rownum, round(dbms_random.value(1, 10)),
(TO_DATE('2015-01-01 0:0:0','YYYY-MM-DD HH24:MI:SS') + dbms_random.value(0,86400*(to_date('2017-12-31 0:0:0', 'YYYY-MM-DD HH24:MI:SS') - to_date('2015-01-01 0:0:0', 'YYYY-MM-DD HH24:MI:SS'))+1)/86400), 
round(dbms_random.value(1, 1000)),
round(dbms_random.value(1, 10))
from dual
connect by level <= 1000;

insert into CLIENT ("id_client", "name", "surname", "phone", "address")
select rownum, dbms_random.string('u', 1) || dbms_random.string('l', 5),
dbms_random.string('u', 1) || dbms_random.string('l', 6),
'+380' || to_char(round(dbms_random.value(100000000, 999999999))), 
dbms_random.string('x', 10)
from dual
connect by level <= 100;

update INVOICE
set "id_client" = (
select round(dbms_random.value(1, 100))
from dual
)

update INVOICE
set "id_client" = round(dbms_random.value(1, 100))

update store
set "id_product" = round(dbms_random.value(1, 1000))

insert into STORE ("id_store", "shelf", "date_oper", "quantity", "id_oper_type", "id_product")
select 1, 1,
(TO_DATE('2015-01-01 0:0:0','YYYY-MM-DD HH24:MI:SS') + dbms_random.value(0,86400*(to_date('2017-12-31 0:0:0', 'YYYY-MM-DD HH24:MI:SS') - to_date('2015-01-01 0:0:0', 'YYYY-MM-DD HH24:MI:SS'))+1)/86400), 
round(dbms_random.value(1, 20)), 
round(dbms_random.value(1, 10)), 
round(dbms_random.value(1, 1000))
from dual
connect by level <= 50;

insert into STORE ("id_store", "shelf", "date_oper", "quantity", "id_oper_type", "id_product")
select 1, 2,
(TO_DATE('2015-01-01 0:0:0','YYYY-MM-DD HH24:MI:SS') + dbms_random.value(0,86400*(to_date('2017-12-31 0:0:0', 'YYYY-MM-DD HH24:MI:SS') - to_date('2015-01-01 0:0:0', 'YYYY-MM-DD HH24:MI:SS'))+1)/86400), 
round(dbms_random.value(1, 20)), 
round(dbms_random.value(1, 10)), 
round(dbms_random.value(1, 1000))
from dual
connect by level <= 50;

insert into STORE ("id_store", "shelf", "date_oper", "quantity", "id_oper_type", "id_product")
select 2, 1,
(TO_DATE('2015-01-01 0:0:0','YYYY-MM-DD HH24:MI:SS') + dbms_random.value(0,86400*(to_date('2017-12-31 0:0:0', 'YYYY-MM-DD HH24:MI:SS') - to_date('2015-01-01 0:0:0', 'YYYY-MM-DD HH24:MI:SS'))+1)/86400), 
round(dbms_random.value(1, 20)), 
round(dbms_random.value(1, 10)), 
round(dbms_random.value(1, 1000))
from dual
connect by level <= 50;

insert into STORE
values(2, 2, TO_DATE('2016-04-06 22:14:45','YYYY-MM-DD HH24:MI:SS'), 5, 1, 1);

insert into STORE
values(2, 2, TO_DATE('2016-04-06 22:14:45','YYYY-MM-DD HH24:MI:SS'), 7, 2, 3);

alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS'
