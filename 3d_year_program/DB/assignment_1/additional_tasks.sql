-- task 1 как и первое задание
SELECT garage_number, COUNT(garage_number) FROM repairs
  JOIN trailers_park ON trailers_park.id = repairs.auto_num
  GROUP BY garage_number
  HAVING COUNT(garage_number) = (
    SELECT COUNT(garage_number) FROM repairs
    JOIN trailers_park ON trailers_park.id = repairs.auto_num
    GROUP BY garage_number
    ORDER BY COUNT(garage_number)
    LIMIT 1;
  )

-- task 2 вывести марки машин которые которые не были починены
SELECT distinct brand FROM trailers_park
  JOIN repairs ON trailers_park.id = repairs.auto_num
  JOIN auto_brands ON auto_brands.id = trailers_park.auto_brand
  WHERE trailers_park.auto_brand NOT IN (SELECT id FROM auto_brands);
