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

WITH RECURSIVE sub(mechanics_supervisor_id, route, level, path, loop) AS
	(
    SELECT mechanics_supervisor_id, '/' || (SELECT id FROM mechanics
      WHERE mechanic_id = mechanics.id) || '/' || (
        SELECT id FROM mechanics WHERE mechanics_supervisor_id = mechanics.id),
        1,
        ARRAY[mechanics_supervisor_id],
        false
        FROM mechanics_supervisor
        WHERE mechanic_id = (
          SELECT id FROM mechanics WHERE name='Sandor'
        )
  	 UNION ALL
  	 SELECT mechanics_supervisor.mechanics_supervisor_id, sub.route || '/' || (
       SELECT id FROM mechanics limit 1),
       level + 1, path || sub.mechanics_supervisor_id, sub.mechanics_supervisor_id = ANY(path) FROM sub
  	 INNER JOIN mechanics_supervisor ON sub.mechanics_supervisor_id = mechanics_supervisor.mechanic_id
  	 WHERE NOT loop
	)

	SELECT mechanics.name || ' ' || mechanics.surname AS NAME, route FROM sub
	JOIN mechanics ON mechanics.id = sub.mechanics_supervisor_id
	ORDER BY level;
