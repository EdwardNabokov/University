-- COMMON TASKS
-- З використанням агрегуючих функцій та конструкції HAVING.
SELECT garage_number, COUNT(garage_number) FROM repairs
  JOIN trailers_park ON trailers_park.id = repairs.auto_num
  GROUP BY garage_number
  HAVING COUNT(garage_number) > 10
  ORDER BY COUNT(garage_number);

-- З перетворенням типу даних результату запиту або формату дати.
SELECT id, to_char(start_date, 'HH12:MI:SS') FROM staff;

-- З пошуком по фрагменту текстового поля. (Ех: знайти всі прізвища, що закінчуються на «ко»)
SELECT * FROM staff WHERE surname LIKE 'Wa%';

-- зі вставкою будь-якого значення в поле результату запиту, що набуло значення NULL в результаті запиту (Ех: якщо прізвище «AUDI», що купив, - NULL, поставити символ «_» оператор NVL або CASE ). �

SELECT num as garage, brand, trailers_park.auto_num as tab_num_auto FROM repairs
  RIGHT JOIN trailers_park ON repairs.auto_num = trailers_park.id
  JOIN garages ON trailers_park.garage_number = garages.id
  JOIN auto_brands ON trailers_park.auto_brand = auto_brands.id
  CASE WHEN repairs.auto_num IS NULL THEN 'No car' ELSE repairs.auto_num END;

--1)
SELECT COUNT(garage_number) FROM repairs
  JOIN trailers_park ON trailers_park.id = repairs.auto_num
  GROUP BY garage_number
  ORDER BY COUNT(garage_number)
  LIMIT 1;

--2a)
SELECT brand, types_name FROM auto_brands
  JOIN trailers_park ON trailers_park.auto_brand =auto_brands.id
  JOIN repairs ON trailers_park.id = repairs.auto_num
  JOIN mending_type ON mending_type.id = repairs.types_code;
--2b)
SELECT brand, COUNT(types_name) as quantity FROM auto_brands
 JOIN trailers_park ON trailers_park.auto_brand =auto_brands.id
 JOIN repairs ON trailers_park.id = repairs.auto_num
 JOIN mending_type ON mending_type.id = repairs.types_code
 GROUP BY brand;

 --3)
SELECT
  (SELECT COUNT(num) FROM garages) as all,
  (SELECT COUNT(DISTINCT garage_number) FROM staff) as with_mechanic;

--4)
SELECT num as garage, brand, trailers_park.auto_num as tab_num_auto FROM repairs
 RIGHT JOIN trailers_park ON repairs.auto_num = trailers_park.id
 JOIN garages ON trailers_park.garage_number = garages.id
 JOIN auto_brands ON trailers_park.auto_brand = auto_brands.id
 WHERE repairs.auto_num IS NULL;

--5)
CREATE FUNCTION discover(DATE, DATE, VARCHAR(15))
  RETURNS TABLE(garage INT, cdate DATE, name_repairs VARCHAR(15))
  AS $$ SELECT num, rdate, $3 FROM repairs
  JOIN trailers_park ON repairs.auto_num = trailers_park.id
  JOIN garages ON trailers_park.garage_number = garages.id
  JOIN mending_type ON repairs.types_code = mending_type.id
  WHERE mending_type.types_name = $3 AND rdate BETWEEN $1 AND $2
  ORDER BY rdate $$
  LANGUAGE SQL;

SELECT * FROM discover('1998-1-1', '2015-1-1', 'AA');
