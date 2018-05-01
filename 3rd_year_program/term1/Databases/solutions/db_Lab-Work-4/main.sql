-- data
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Edward', 'Mercedes', 53, 'March');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Edward', 'BMW', 64, 'December');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Edward', 'Range Rover', 33, 'October');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Edward', 'Land Rover', 75, 'August');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Edward', 'Volkswagen', 12, 'June');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Edward', 'BMW', 5, 'March');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Edward', 'Audi', 1, 'April');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Edward', 'Toyota', 5, 'June');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Edward', 'Land Rover', 5, 'December');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Edward', 'Lanos', 61, 'March');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Mark', 'Mercedes', 6, 'July');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Mark', 'BMW', 2, 'April');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Mark', 'Range Rover', 19, 'December');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Mark', 'Land Rover', 4, 'April');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Mark', 'Volkswagen', 56, 'July');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Mark', 'Range Rover', 5, 'July');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Mark', 'Audi', 23, 'August');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Mark', 'Toyota', 2, 'May');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Mark', 'Lanos', 61, 'March');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Mark', 'Lanos', 3, 'May');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Louise', 'Volkswagen', 24, 'February');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Louise', 'Audi', 51, 'February');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Louise', 'Toyota', 10, 'April');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Louise', 'Lanos', 1, 'February');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Louise', 'Mercedes', 6, 'July');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Louise', 'BMW', 2, 'April');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Louise', 'Range Rover', 19, 'December');
INSERT INTO "Mechanics" (name, car_brand, repairs, month) VALUES ('Louise', 'Land Rover', 4, 'April');

-- enable crosstable
CREATE extension tablefunc;

-- create pivot table with group by and sum
-- get total repairs during a whole year by car brand
SELECT * FROM crosstab(
  'SELECT name,  car_brand, SUM(repairs) AS total_repairs
  FROM "Mechanics"
  GROUP by car_brand, name
  ORDER by 1, 2',
  'SELECT DISTINCT car_brand
  FROM "Mechanics"
  ORDER by 1'
)
  AS final_result(
    Name TEXT,
    Audi INT,
    BMW INT,
    Land_Rover INT,
    Lanos INT,
    Mercedes INT,
    Range_Rover INT,
    Toyota INT,
    Volkswagen INT
  );


-- create pivot with two aggregate
-- Find the most repairable cars for each month and find total income for every mechanic per year
WITH mechanics_income_per_month as (
  SELECT * FROM crosstab(
    'SELECT month, name, 0.15 * SUM(repairs) as Total
    FROM "Mechanics"
    GROUP by month, name
    HAVING SUM(repairs) > 10
    ORDER by 1, 2',
    'SELECT DISTINCT name
    FROM "Mechanics"
    ORDER by 1'
  )
    AS (
      Month TEXT,
      Edward FLOAT,
      Louise FLOAT,
      Mark FLOAT
    )
), popular_car_per_month as (
  SELECT * FROM crosstab(
    'SELECT month, name, car_brand
    FROM "Mechanics"
    GROUP by name, month, car_brand
    HAVING SUM(repairs) > 10
    ORDER by 1, 2',
    'SELECT DISTINCT name
    FROM "Mechanics"
    ORDER by 1'
  )
    AS (
      Month TEXT,
      Edward TEXT,
      Louise TEXT,
      Mark TEXT
    )
)

SELECT
  *
FROM popular_car_per_month
UNION ALL
SELECT
  'Total income' as Month,
  CAST(SUM(edward) AS TEXT),
  CAST(SUM(louise) AS TEXT),
  CAST(SUM(mark) AS TEXT)
FROM mechanics_income_per_month;

-- unpivot.
-- There is no unpivot in postgreSQL. But it's possible to manage with this.
-- Let's take pivot table from one of queries before. And try to recover to plain original table
-- pivot table outputs Name, Car_brands* as columns and for each intersection of name
-- and car brand is total repairs per month
WITH pivot_table as (
  SELECT * FROM crosstab(
    'SELECT name,  car_brand, SUM(repairs) AS total_repairs
    FROM "Mechanics"
    GROUP by name, car_brand
    ORDER by 1, 2',
    'SELECT DISTINCT car_brand
    FROM "Mechanics"
    ORDER by 1'
  )
    AS final_result(
      Name TEXT,
      Audi INT,
      BMW INT,
      Land_Rover INT,
      Lanos INT,
      Mercedes INT,
      Range_Rover INT,
      Toyota INT,
      Volkswagen INT
    )
)

SELECT
  name,
  unnest(array['Audi', 'BMW', 'Land_Rover', 'Lanos', 'Mercedes', 'Range_Rover', 'Toyota', 'Volkswagen']) as car_brand,
  unnest(array[audi, bmw, land_rover, lanos, mercedes, range_rover, toyota, volkswagen]) as repairs
FROM pivot_table
WHERE
  name='Edward'
  OR name='Louise'
  OR name='Mark';
