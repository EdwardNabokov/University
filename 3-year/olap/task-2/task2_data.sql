INSERT INTO POSITION ("id_position", "position_name", "salary", "description")
SELECT rownum, 'Position-' || to_char(rownum), round(dbms_random.value(1.5, 11.5) * 1000), dbms_random.string('x', 10)
FROM dual
CONNECT BY LEVEL <= 10;
--
--SELECT * FROM position;
--
INSERT INTO SUPPLIER ("id_supplier", "supplier_name", "supplier_info")
SELECT rownum, 'Supplier-' || to_char(rownum), dbms_random.string('x', 10)
FROM dual
CONNECT BY LEVEL <= 10;
--
--SELECT * FROM SUPPLIER;
--
INSERT INTO PRODUCT_TYPE ("id_product_type", "product_type_name")
SELECT rownum, 'ProductType-' || to_char(rownum)
FROM dual
CONNECT BY LEVEL <= 10;
--
--SELECT * FROM PRODUCT_TYPE;
--
INSERT INTO PAYMENT_TYPE ("id_type", "payment_type_name", "description")
SELECT rownum, 'Payment-' || to_char(rownum), dbms_random.string('x', 10)
FROM dual
CONNECT BY LEVEL <= 10;
--
--SELECT * FROM PAYMENT_TYPE;
--
INSERT INTO UNIT ("id_unit", "unit_name", "description")
SELECT rownum, 'Unit-' || to_char(rownum), dbms_random.string('x', 10)
FROM dual
CONNECT BY LEVEL <= 10;
--
--SELECT * FROM UNIT;
--
INSERT INTO TYPE_OPER ("id_oper_type", "name_oper", "description")
SELECT rownum, 'OperationType-' || to_char(rownum), dbms_random.string('x', 10)
FROM dual
CONNECT BY LEVEL <= 10;
--
--SELECT * FROM TYPE_OPER;
--
--SELECT * FROM stuff;
--
INSERT INTO STUFF ("id_stuff", "name", "surname", "phone", "address", "id_position")
SELECT rownum, 'Stuff-' || to_char(rownum), dbms_random.string('x', 10),
'+380' || to_char(round(dbms_random.value(100000000, 999999999))),
dbms_random.string('x', 10), round(dbms_random.value(1, 10))
FROM dual
CONNECT BY LEVEL <= 10;
--
INSERT INTO PRODUCT ("id_product", "product_name", "description", "price", "id_product_type", "id_supplier")
SELECT rownum, 'TV-' || to_char(round(dbms_random.value(1, 75))),
dbms_random.string('x', 10), round((dbms_random.value(100, 5000)), 2), 1, round(dbms_random.value(1, 10))
FROM dual
CONNECT BY LEVEL <= 250;
--
INSERT INTO PRODUCT ("id_product", "product_name", "description", "price", "id_product_type", "id_supplier")
SELECT rownum + (SELECT idp FROM
                       (SELECT "id_product" AS idp FROM product ORDER BY "id_product" DESC)
                WHERE rownum = 1),
'Remote-' || to_char(round(dbms_random.value(1, 75))),
dbms_random.string('x', 10),
round((dbms_random.value(100, 5000)), 2),
2,
round(dbms_random.value(1, 10))
FROM dual
CONNECT BY LEVEL <= 250;
--
INSERT INTO PRODUCT ("id_product", "product_name", "description", "price", "id_product_type", "id_supplier")
SELECT rownum + (SELECT idp FROM
                       (SELECT "id_product" AS idp FROM product ORDER BY "id_product" DESC)
                WHERE rownum = 1),
'Lamp-' || to_char(round(dbms_random.value(1, 75))),
dbms_random.string('x', 10),
round((dbms_random.value(100, 5000)), 2),
5,
round(dbms_random.value(1, 10))
FROM dual
CONNECT BY LEVEL <= 250;
--
INSERT INTO PRODUCT ("id_product", "product_name", "description", "price", "id_product_type", "id_supplier")
SELECT rownum + (SELECT idp FROM
                       (SELECT "id_product" AS idp FROM product ORDER BY "id_product" DESC)
                WHERE rownum = 1),
'Clock-' || to_char(round(dbms_random.value(1, 75))),
dbms_random.string('x', 10),
round((dbms_random.value(100, 5000)), 2),
4,
round(dbms_random.value(1, 10))
FROM dual
CONNECT BY LEVEL <= 250;
--
/*insert into STORE ("id_store", "shelf", "date_oper", "quantity", "id_oper_type")

select rownum, round(dbms_random.value(1, 20)),

to_date(trunc(dbms_random.value(to_char(DATE '2017-01-01'))))dbms_random.string('x', 10)

from dual

connect by level <= 10;*/
--
INSERT INTO INVOICE_DETAIL ("id_invoice", "id_product", "quantity", "description")
SELECT rownum, round(dbms_random.value(1, 1000)),
round(dbms_random.value(1, 25)),
dbms_random.string('x', 10)
FROM dual
CONNECT BY LEVEL <= 1000;
--
INSERT INTO INVOICE ("id_invoice", "id_paiment_type", "purchase_time", "id_invoice_detail", "id_stuff")
SELECT rownum, round(dbms_random.value(1, 10)),
(TO_DATE('2015-01-01 0:0:0','YYYY-MM-DD HH24:MI:SS') +
dbms_random.value(0,86400*(to_date('2017-12-31 0:0:0', 'YYYY-MM-DD HH24:MI:SS') -
to_date('2015-01-01 0:0:0', 'YYYY-MM-DD HH24:MI:SS'))+1)/86400),
round(dbms_random.value(1, 1000)),
round(dbms_random.value(1, 10))
FROM dual
CONNECT BY LEVEL <= 1000;
--
INSERT INTO CLIENT ("id_client", "name", "surname", "phone", "address")
SELECT rownum, dbms_random.string('u', 1) || dbms_random.string('l', 5),
dbms_random.string('u', 1) || dbms_random.string('l', 6),
'+380' || to_char(round(dbms_random.value(100000000, 999999999))),
dbms_random.string('x', 10)
from dual
CONNECT BY LEVEL <= 100;
--
UPDATE INVOICE
SET "id_client" = (
SELECT round(dbms_random.value(1, 100))
FROM dual
);
--
UPDATE INVOICE
SET "id_client" = round(dbms_random.value(1, 100));
--
UPDATE store
SET "id_product" = round(dbms_random.value(1, 1000));
--
INSERT INTO STORE ("id_store", "shelf", "date_oper", "quantity", "id_oper_type", "id_product")
SELECT 1, 1,
(TO_DATE('2015-01-01 0:0:0','YYYY-MM-DD HH24:MI:SS') +
dbms_random.value(0,86400*(to_date('2017-12-31 0:0:0', 'YYYY-MM-DD HH24:MI:SS') -
to_date('2015-01-01 0:0:0', 'YYYY-MM-DD HH24:MI:SS'))+1)/86400),
round(dbms_random.value(1, 20)),
round(dbms_random.value(1, 10)),
round(dbms_random.value(1, 1000))
FROM dual
CONNECT BY LEVEL <= 50;
--
INSERT INTO STORE ("id_store", "shelf", "date_oper", "quantity", "id_oper_type", "id_product")
SELECT 1, 2,
(TO_DATE('2015-01-01 0:0:0','YYYY-MM-DD HH24:MI:SS') +
dbms_random.value(0,86400*(to_date('2017-12-31 0:0:0', 'YYYY-MM-DD HH24:MI:SS') -
to_date('2015-01-01 0:0:0', 'YYYY-MM-DD HH24:MI:SS'))+1)/86400),
round(dbms_random.value(1, 20)),
round(dbms_random.value(1, 10)),
round(dbms_random.value(1, 1000))
FROM dual
CONNECT BY LEVEL <= 50;
--
INSERT INTO STORE ("id_store", "shelf", "date_oper", "quantity", "id_oper_type", "id_product")
SELECT 2, 1,
(TO_DATE('2015-01-01 0:0:0','YYYY-MM-DD HH24:MI:SS') + 
dbms_random.value(0,86400*(to_date('2017-12-31 0:0:0', 'YYYY-MM-DD HH24:MI:SS') -
to_date('2015-01-01 0:0:0', 'YYYY-MM-DD HH24:MI:SS'))+1)/86400),
round(dbms_random.value(1, 20)),
round(dbms_random.value(1, 10)),
round(dbms_random.value(1, 1000))
FROM dual
CONNECT BY LEVEL <= 50;
--
INSERT INTO STORE
values(2, 2, TO_DATE('2016-04-06 22:14:45','YYYY-MM-DD HH24:MI:SS'), 5, 1, 1);
--
INSERT INTO STORE
values(2, 2, TO_DATE('2016-04-06 22:14:45','YYYY-MM-DD HH24:MI:SS'), 7, 2, 3);
--
ALTER session SET nls_date_format = 'YYYY-MM-DD HH24:MI:SS'
