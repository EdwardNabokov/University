-- create user
-- CREATE USER edward;

-- grand user with superuser
-- ALTER ROLE edward WITH superuser;

-- Create database named trailers
-- CREATE DATABASE trailers;

-- Create table with well-known brands of cars
CREATE TABLE auto_brands (
  id SERIAL PRIMARY KEY,
  brand VARCHAR(80) UNIQUE
);

-- add data to auto brands
COPY auto_brands (brand) FROM '/Users/eduardnabokov/Documents/education/University/3rd_year_program/Databases/assignments/db_Assignment-Work-1/data/brands.csv'
  WITH (FORMAT csv);

-- Create table with all garages' numbers (just their numbers)
CREATE TABLE garages (
  id SERIAL PRIMARY KEY,
  num INT NOT NULL UNIQUE
);

-- add data to garages
COPY garages (num) FROM '/Users/eduardnabokov/Documents/education/University/3rd_year_program/Databases/assignments/db_Assignment-Work-1/data/garages.csv'
  WITH (FORMAT csv);

/* Create table with
* - code of repairs
* - name of that repairs
*/
CREATE TABLE mending_type (
  id SERIAL PRIMARY KEY,
  types_code INT UNIQUE,
  types_name VARCHAR(15) UNIQUE
);

-- add data to mending_type
COPY mending_type (types_code, types_name)
  FROM '/Users/eduardnabokov/Documents/education/University/3rd_year_program/Databases/assignments/db_Assignment-Work-1/data/mend_type.csv' WITH (FORMAT csv);

/* Create table with:
* - unique number of car
* - brand of car
* - data release of car
* - garage's number
*/
CREATE TABLE trailers_park (
  id SERIAL PRIMARY KEY,
  auto_num VARCHAR(10),
  auto_brand INT references auto_brands(id),
  release_date DATE,
  garage_number INT references garages(id)
);

-- add data to trailers_park
COPY trailers_park (auto_num, auto_brand, release_date, garage_number)
  FROM '/Users/eduardnabokov/Documents/education/University/3rd_year_program/Databases/assignments/db_Assignment-Work-1/data/trailers_park_data.csv' WITH (FORMAT csv);

/* Create table with:
* - unique id for each mechanic
* - mechanics' surname
* - ipb == name + middle name
* - garage number, which belongs to that mechanic
* - experiance (start date and end date)
*/
CREATE TABLE staff (
  id SERIAL PRIMARY KEY,
  mechanic_id VARCHAR(15) UNIQUE,
  surname VARCHAR(15),
  IPB VARCHAR(20),
  garage_number INT references garages(id),
  start_date DATE,
  end_date DATE,
  salary REAL
);

-- add data to staff
COPY staff (mechanic_id, surname, ipb, garage_number, start_date, end_date, salary)
  FROM '/Users/eduardnabokov/Documents/education/University/3rd_year_program/Databases/assignments/db_Assignment-Work-1/data/staff.csv' WITH (FORMAT csv);

/* Create table with:
* - date of repairs, when it was done (or is going to be)
* - number of the car, that was/is going to be repaired
* - mechanic id, who did/is going to do it
* - type of repairs
*/
CREATE TABLE repairs (
  id SERIAL PRIMARY KEY,
  rdate DATE,
  auto_num INT references trailers_park(id),
  mechanic_id INT references staff(id),
  types_code INT references mending_type(id)
);

-- add data to staff
COPY repairs (rdate, auto_num, mechanic_id, types_code)
  FROM '/Users/eduardnabokov/Documents/education/University/3rd_year_program/Databases/assignments/db_Assignment-Work-1/data/repairs.csv' WITH (FORMAT csv);
