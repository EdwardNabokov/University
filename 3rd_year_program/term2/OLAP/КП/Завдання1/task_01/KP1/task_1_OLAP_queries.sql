-- 1 query
SELECT *
FROM STORE
WHERE PRODUCT
NOT IN (SELECT PRODUCT FROM STORE GROUP BY PRODUCT HAVING COUNT(*) > 1)
ORDER BY PRODUCT;

-- 2 query
SELECT SHELF, SUM(QUANTITY) AS TOTAL
FROM (SELECT * FROM STORE WHERE REGEXP_LIKE(QUANTITY, '^\d+$'))
GROUP BY SHELF
HAVING SUM(QUANTITY) > 30
ORDER BY SHELF;

-- 3 query
SELECT *
FROM STORE
WHERE REGEXP_LIKE(STORE_DATE, '^(3[01]|[12]\d|0?[1-9])\.(1[012]|0?[1-9])\.((?:19|20)\d{2})$')
AND NOT (STORE_DATE BETWEEN TO_DATE('01.01.2011', 'DD.MM.YYYY') AND TO_DATE('31.05.2014', 'DD.MM.YYYY'));

-- 4 query
SELECT *
FROM INVOICE
WHERE NOT REGEXP_LIKE(E_MAIL, '^[A-Za-z]+[A-Za-z\d.]+@shop.com$');

-- 5 query
SELECT *
FROM INVOICE
WHERE ID_STUFF
IN (SELECT ID_STUFF FROM INVOICE GROUP BY ID_STUFF HAVING COUNT(DISTINCT STAFF_NAME) = 1 AND COUNT(DISTINCT E_MAIL) = 1)
ORDER BY ID_STUFF;

-- 6 query
SELECT *
FROM STORE
WHERE UPPER(OPER_TYPE) != 'IN' AND UPPER(OPER_TYPE) != 'OUT';

-- 7 query
SELECT * FROM INVOICE WHERE PRICE < 1000;

-- 8 query
SELECT *
FROM INVOICE
WHERE INVOICE IS NULL OR NOT REGEXP_LIKE(INVOICE, '^INV-\d+$');

-- 9 query
SELECT *
FROM INVOICE
WHERE PRODUCT IS NULL OR NOT REGEXP_LIKE(PRODUCT, '^TV-\d+$');
