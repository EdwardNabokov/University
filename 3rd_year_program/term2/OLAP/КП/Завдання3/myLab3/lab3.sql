-- 1 Показати ранг кожного товару у групі (відповідно до зменшення ціни в групі).
-- Запит реалізувати через функції rank() та dense_rank(). Порівняти результати виконання.

SELECT p.id_product, p.id_product_type, p.price,
       rank() OVER(PARTITION by p.id_product_type ORDER by p.price desc) rank_ex,
       dense_rank() OVER(PARTITION by p.id_product_type ORDER by p.price desc) dense_rank_ex
FROM product p;

-- 2 Вивести список із двох найдешевших товарів у кожній групі.
SELECT p_type, prod, p_price
FROM
(
    SELECT p.id_product_type p_type, p.id_product prod, p.price p_price,
           dense_rank() OVER(PARTITION by p.id_product_type ORDER by p.price) rank_prod
    FROM product p
)
WHERE rank_prod <= 2;

-- 3 Показати які товари по кожній групі мають найбільші продажі .
SELECT t.id_product_type, t.id_product  FROM
(
    SELECT p.id_product_type, p.id_product, COUNT(*) max_sold_by_product,
        MAX(COUNT(*)) OVER(PARTITION by p.id_product_type) max_sold_per_type
    FROM invoice i
    JOIN invoice_detail invd
    ON i.id_invoice = invd.id_invoice
    JOIN product p
    ON invd.id_product = p.id_product
    GROUP by p.id_product_type, p.id_product
    ORDER by p.id_product_type, p.id_product
) t WHERE max_sold_by_product = max_sold_per_type;

-- 4 Вивести список товарів з найбільшою вартістю, які найдовше зберігаються на полицях складу.
SELECT * FROM(
    SELECT s.shelf, s.id_product, p.price, s.date_oper,
        MAX(SYSDATE - s.date_oper) OVER (PARTITION by s.shelf) max_diff,
        MAX(p.price) OVER (PARTITION by s.shelf) max_price
    FROM product p
    JOIN store s
    ON p.id_product = s.id_product
) t
WHERE t.max_price = t.price AND t.max_diff = (SYSDATE - t.date_oper);

-- 5 Побудувати запит з використанням функцій LEAD. Той же запит реалізувати через функцію LAG. Порівняти результати їх виконання.
SELECT p.id_product_type, p.id_product, p.price,
       LEAD(p.price, 1, 0) OVER(PARTITION by p.id_product_type ORDER by p.price) price_next
FROM product p;

SELECT p.id_product_type, p.id_product, p.price,
       LAG(p.price, 1, 0) OVER(PARTITION by p.id_product_type ORDER by p.price) price_next
FROM product p;

-- 6 Побудувати аналітичні запити, які б використовували наступні  функцій (один запит – одна функція):
 -- FIRST_VALUE (або LAST_VALUE)
 SELECT id_product_type, id_product, low_price FROM (
     SELECT id_product_type, id_product, price,
         FIRST_VALUE(price) OVER (PARTITION by id_product_type ORDER BY price) low_price
     FROM product
 ) WHERE price = low_price;


-- MAX ( або MIN)
SELECT id_product_type, id_product, low_price FROM (
    SELECT id_product_type, id_product, price,
           MIN(price) OVER(PARTITION by id_product_type ORDER by price) low_price
    FROM product p
) WHERE price = low_price;

-- COUNT( або SUM).
SELECT id_store, id_product,
    COUNT(shelf) OVER(PARTITION by id_product ORDER BY id_store) count_shelf
FROM store s
ORDER by id_store;

-- 7
SELECT p.id_product_type, p.id_product, p.price, i.purchase_time datep,
       SUM(p.price) OVER(ORDER by i.purchase_time)
FROM invoice i
JOIN invoice_detail id
ON i.id_invoice = id.id_invoice
JOIN product p
ON id.id_product = p.id_product
WHERE i.purchase_time between to_date('06.12.2011', 'dd.mm.yyyy') and
                              to_date('10.02.2012', 'dd.mm.yyyy');
--
SELECT p.id_product_type, p.id_product, p.price,
       SUM(p.price) OVER(PARTITION by p.id_product_type ORDER by p.price rows 1 preceding) as asd
FROM product p;

--
SELECT id_product_type, id_unit, price,
    MAX(price) OVER(PARTITION by id_product, id_unit) max_price_per_type_and_prod
FROM product
ORDER BY id_product_type, id_unit;
--
SELECT id_product_type, id_unit, price,
    MAX(price) OVER(PARTITION by id_product, id_unit ORDER BY id_product_type) max_price_per_type_and_prod
FROM product
ORDER BY id_product_type, id_unit;
