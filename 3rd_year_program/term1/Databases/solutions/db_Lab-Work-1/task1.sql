-- TASK 1
-- 1.1 count, partition by, order by
-- to find how often specific type of repairs was used
SELECT DISTINCT types_code, COUNT(*) OVER(PARTITION by types_code) as count
FROM repairs
ORDER by types_code;
-- 1.2 my Query
WITH c AS (
 SELECT types_code, COUNT(types_code) AS counter
 FROM repairs
 GROUP BY types_code
)
SELECT DISTINCT types_code, c.counter as Count
FROM repairs
JOIN c
 USING (types_code)
ORDER BY
 types_code;

-- 2.1 rank or dense_rank partition by
-- find last repaired auto by each mechanic
WITH c AS (
  SELECT *?
    DENSE_RANK() OVER(PARTITION by mechanic_id ORDER BY rdate)
    as rank_
  FROM repairs
), cc AS (
  SELECT mechanic_id, MAX(rank_) as maxRank FROM c
  GROUP BY c.mechanic_id
  ORDER BY c.mechanic_id
)

SELECT staff.surname, c.rdate FROM cc
JOIN c ON cc.mechanic_id = c.mechanic_id and cc.maxRank = c.rank_
JOIN staff ON cc.mechanic_id = staff.id;

-- 2.2 my Query
SELECT staff.surname, f.date FROM (
  SELECT mechanic_id, MAX(rdate) as date FROM repairs
  GROUP BY mechanic_id
  ORDER BY mechanic_id
) as f JOIN staff ON staff.id = f.mechanic_id;

-- 3.1 rows partition by order by
-- find average cost per garage
SELECT DISTINCT garage_number, AVG(salary)
  OVER (PARTITION by garage_number ORDER BY salary ROWS BETWEEN 2 preceding AND 2 following)
FROM staff
ORDER BY garage_number;

-- 3.2 my Query
SELECT garage_number, AVG(salary)
FROM staff
GROUP BY garage_number
ORDER BY garage_number;


-- 4.1 range partition by order by
-- find total sum by each garage and his staff
SELECT DISTINCT garage_number, SUM(salary)
  OVER (PARTITION by garage_number ORDER BY salary RANGE BETWEEN UNBOUNDED preceding AND UNBOUNDED FOLLOWING)
FROM staff
ORDER BY garage_number;

-- 4.2 my Query
SELECT DISTINCT garage_number, SUM(salary)
FROM staff
GROUP BY garage_number
ORDER BY garage_number;

-- 5.1 lag, partition by, order by
WITH shifted AS (
  SELECT id + 1 as incr_id FROM staff
), new_salary AS (
  SELECT id, garage_number, salary as balanced_salary FROM staff
  JOIN shifted ON shifted.incr_id = staff.id
), addition AS(
  SELECT staff.id, staff.garage_number, salary, balanced_salary FROM staff
  JOIN new_salary ON new_salary.id = staff.id+1
)
SELECT staff.garage_number, balanced_salary FROM staff
JOIN addition ON addition.id = staff.id
ORDER BY staff.garage_number;

SELECT DISTINCT garage_number,
  lag(CAST(salary AS real), 1, CAST(salary AS real)) OVER (PARTITION by garage_number ORDER BY end_date) as balanced_salary
FROM staff
ORDER BY garage_number;

-- 6.1 lead, partition by, order by
SELECT DISTINCT garage_number, salary,
  lead(CAST(salary AS real), 1, CAST(salary AS real)) OVER (PARTITION by garage_number ORDER BY end_date) as balanced_salary
FROM staff
ORDER BY garage_number;

-- 6.2 my Query
WITH shifted AS (
  SELECT id - 1 as decr_id FROM staff
), new_salary AS (
  SELECT id, garage_number, salary as balanced_salary FROM staff
  LEFT OUTER JOIN shifted ON shifted.decr_id = staff.id
), addition AS(
  SELECT staff.id, staff.garage_number, salary, balanced_salary FROM staff
  JOIN new_salary ON new_salary.id = staff.id
)
SELECT staff.garage_number, staff.salary, balanced_salary FROM staff
JOIN addition ON addition.id = staff.id
ORDER BY staff.garage_number;
