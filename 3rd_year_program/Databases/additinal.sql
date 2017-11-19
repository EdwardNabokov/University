-- По каждому гаражу определитеь количество ременотов,
-- в границах гаража упорядочить персонал по количеству выполненых ремонтов

-- result
SELECT *, DENSE_RANK() OVER(PARTITION by garage_number ORDER by total_repairs_per_mechanic)
FROM (
  SELECT trailers_park.garage_number,
    surname,
    COUNT(repairs.mechanic_id) OVER(PARTITION by trailers_park.garage_number) as total_repairs_per_garage,
    COUNT(trailers_park.garage_number) OVER(PARTITION by repairs.mechanic_id) as total_repairs_per_mechanic
    FROM repairs
    JOIN trailers_park ON trailers_park.id = repairs.auto_num
    JOIN staff ON staff.id = repairs.mechanic_id
) as foo;


-- init
SELECT trailers_park.garage_number,
staff.surname,
repairs.id as repairs,
COUNT(trailers_park.garage_number) OVER(PARTITION by trailers_park.garage_number) as total_repairs_per_garage,
COUNT(repairs.id) OVER(PARTITION by repairs.mechanic_id) as repairs_per_mechanic
FROM repairs
JOIN trailers_park ON trailers_park.id = repairs.auto_num
JOIN staff ON staff.id = repairs.mechanic_id
ORDER by garage_number, repairs_per_mechanic;
