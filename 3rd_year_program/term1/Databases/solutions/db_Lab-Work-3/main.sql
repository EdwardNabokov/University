CREATE TABLE mechanics (
  id SERIAL PRIMARY KEY,
  name VARCHAR(10),
  surname VARCHAR(10)
);

CREATE TABLE mechanics_supervisor (
  id SERIAL PRIMARY KEY,
  mechanic_id INT REFERENCES mechanics(id),
  mechanics_supervisor_id INT REFERENCES mechanics(id)
);


INSERT INTO mechanics (name, surname) VALUES ('Daenerys', 'Targaryen');
INSERT INTO mechanics (name, surname) VALUES ('John', 'Snow');
INSERT INTO mechanics (name, surname) VALUES ('Cersei', 'Lannister');
INSERT INTO mechanics (name, surname) VALUES ('Petyr', 'Baelish');
INSERT INTO mechanics (name, surname) VALUES ('Tyrion', 'Lannister');
INSERT INTO mechanics (name, surname) VALUES ('Sandor', 'Clegane');
INSERT INTO mechanics (name, surname) VALUES ('Eddard', 'Stark');
INSERT INTO mechanics (name, surname) VALUES ('Sansa', 'Stark');
INSERT INTO mechanics (name, surname) VALUES ('Joffrey', 'Baratheon');
INSERT INTO mechanics (name, surname) VALUES ('Lord', 'Varys');
INSERT INTO mechanics (name, surname) VALUES ('Grey', 'Worm');
INSERT INTO mechanics (name, surname) VALUES ('Samwell', 'Tarly');

INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (1, 2);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (2, 3);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (3, 4);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (3, 11);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (4, 11);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (4, 12);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (5, 11);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (5, 6);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (6, 7);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (7, 8);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (6, 9);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (6, 10);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (5, 11);
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (5, 11);

-- Task 1
WITH RECURSIVE sub(mechanic_id) AS
  (
    SELECT mechanic_id FROM mechanics_supervisor
    WHERE mechanics_supervisor_id = 12
    UNION ALL
    SELECT mechanics_supervisor.mechanic_id FROM sub
    INNER JOIN mechanics_supervisor ON mechanics_supervisor.mechanics_supervisor_id = sub.mechanic_id
  )

SELECT mechanics.name, mechanics.surname FROM sub
JOIN mechanics ON mechanics.id = sub.mechanic_id;

-- Task 2
WITH RECURSIVE sub(mechanics_supervisor_id) AS
	(
    SELECT mechanics_supervisor_id FROM mechanics_supervisor WHERE mechanic_id = (SELECT id FROM mechanics WHERE name='Daenerys')
     UNION ALL
     SELECT mechanics_supervisor.mechanics_supervisor_id FROM sub
     INNER JOIN mechanics_supervisor ON sub.mechanics_supervisor_id = mechanics_supervisor.mechanic_id
	)

	SELECT mechanics.name, mechanics.surname FROM sub
	JOIN mechanics ON mechanics.id = sub.mechanics_supervisor_id;


-- TASK 3
WITH RECURSIVE sub(mechanics_supervisor_id, level) AS
	(
    SELECT mechanics_supervisor_id, 1 FROM mechanics_supervisor WHERE mechanic_id = (SELECT id FROM mechanics WHERE name='Daenerys')
  	 UNION ALL
  	 SELECT mechanics_supervisor.mechanics_supervisor_id, level + 1 FROM sub
  	 INNER JOIN mechanics_supervisor ON sub.mechanics_supervisor_id = mechanics_supervisor.mechanic_id
	)

	SELECT mechanics.name, mechanics.surname, level FROM sub
	JOIN mechanics ON mechanics.id = sub.mechanics_supervisor_id
	ORDER BY level;

-- TASK 4
INSERT INTO mechanics_supervisor (mechanic_id, mechanics_supervisor_id) VALUES (12, 1);

WITH RECURSIVE sub(mechanics_supervisor_id, level, path, loop) AS
	(
    SELECT mechanics_supervisor_id, 1, ARRAY[mechanics_supervisor_id], false FROM mechanics_supervisor WHERE mechanic_id = (SELECT id FROM mechanics WHERE name='Daenerys')
  	 UNION ALL
  	 SELECT mechanics_supervisor.mechanics_supervisor_id, level + 1, path || sub.mechanics_supervisor_id, sub.mechanics_supervisor_id = ANY(path) FROM sub
  	 INNER JOIN mechanics_supervisor ON sub.mechanics_supervisor_id = mechanics_supervisor.mechanic_id
  	 WHERE NOT loop
	)

	SELECT mechanics.name, mechanics.surname, level FROM sub
	JOIN mechanics ON mechanics.id = sub.mechanics_supervisor_id
	ORDER BY level;


-- TASK 5
WITH RECURSIVE sub(mechanics_supervisor_id, route, level, path, loop) AS
	(
    SELECT mechanics_supervisor_id, '/' || (SELECT name || ' ' || surname FROM mechanics
      WHERE mechanic_id = mechanics.id) || '/' || (
        SELECT name || ' ' || surname FROM mechanics WHERE mechanics_supervisor_id = mechanics.id),
        1,
        ARRAY[mechanics_supervisor_id],
        false
        FROM mechanics_supervisor
        WHERE mechanic_id = (
          SELECT id FROM mechanics WHERE name='Sandor'
        )
  	 UNION ALL
  	 SELECT mechanics_supervisor.mechanics_supervisor_id, sub.route || '/' || (
       SELECT name || ' ' || surname FROM mechanics limit 1),
       level + 1, path || sub.mechanics_supervisor_id, sub.mechanics_supervisor_id = ANY(path) FROM sub
  	 INNER JOIN mechanics_supervisor ON sub.mechanics_supervisor_id = mechanics_supervisor.mechanic_id
  	 WHERE NOT loop
	)

	SELECT mechanics.name || ' ' || mechanics.surname AS NAME, route FROM sub
	JOIN mechanics ON mechanics.id = sub.mechanics_supervisor_id
	ORDER BY level;


-- additional task
-- вывести усы нащадки предка  Х і при цьому не вивводиті нащадка у і вивести через косу
