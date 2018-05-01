-- create postgres table and fill with data
CREATE TABLE auto_brands (
  id SERIAL PRIMARY KEY,
  brand VARCHAR(80) UNIQUE
);

COPY auto_brands (brand) FROM '/var/lib/postgresql/csvfiles/brands.csv'
  WITH (FORMAT csv);

CREATE TABLE garages (
  id SERIAL PRIMARY KEY,
  num INT NOT NULL UNIQUE
);

COPY garages (num) FROM '/var/lib/postgresql/csvfiles/garages.csv'
  WITH (FORMAT csv);

CREATE TABLE mending_type (
  id SERIAL PRIMARY KEY,
  types_code INT UNIQUE,
  types_name VARCHAR(15) UNIQUE
);

COPY mending_type (types_code, types_name)
  FROM '/var/lib/postgresql/csvfiles/mend_type.csv' WITH (FORMAT csv);

CREATE TABLE trailers_park (
  id SERIAL PRIMARY KEY,
  auto_num VARCHAR(10),
  auto_brand INT references auto_brands(id),
  release_date DATE,
  garage_number INT references garages(id)
);


COPY trailers_park (auto_num, auto_brand, release_date, garage_number)
  FROM '/var/lib/postgresql/csvfiles/trailers_park_data.csv' WITH (FORMAT csv);

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

COPY staff (mechanic_id, surname, ipb, garage_number, start_date, end_date, salary)
  FROM '/var/lib/postgresql/csvfiles/staff.csv' WITH (FORMAT csv);

CREATE TABLE repairs (
  id SERIAL PRIMARY KEY,
  rdate DATE,
  auto_num INT references trailers_park(id),
  mechanic_id INT references staff(id),
  types_code INT references mending_type(id)
);

COPY repairs (rdate, auto_num, mechanic_id, types_code)
  FROM '/var/lib/postgresql/csvfiles/repairs.csv' WITH (FORMAT csv);

--- copy all table content into csv files

COPY (
	SELECT * FROM auto_brands
) TO '/var/lib/postgresql/mydata/auto_brands_copy.csv' CSV HEADER DELIMITER ',';

COPY (
	SELECT * FROM garages
) TO '/var/lib/postgresql/mydata/garages_copy.csv' CSV HEADER DELIMITER ',';

COPY (
	SELECT * FROM mending_type
) TO '/var/lib/postgresql/mydata/mending_type_copy.csv' CSV HEADER DELIMITER ',';

COPY (
	SELECT * FROM trailers_park
) TO '/var/lib/postgresql/mydata/trailers_park_copy.csv' CSV HEADER DELIMITER ',';

COPY (
	SELECT * FROM staff
) TO '/var/lib/postgresql/mydata/staff_copy.csv' CSV HEADER DELIMITER ',';

COPY (
	SELECT * FROM repairs
) TO '/var/lib/postgresql/mydata/repairs_copy.csv' CSV HEADER DELIMITER ',';
