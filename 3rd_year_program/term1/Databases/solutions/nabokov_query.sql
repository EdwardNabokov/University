CREATE TABLE test_table (
    id INT PRIMARY KEY,
    field1 INT,
    field2 INT,
    field3 INT,
    field4 INT,
    field5 INT
);

INSERT INTO "test_table" (id, field1, field2, field3, field4, field5) VALUES (1, 1, 2, 3, 4, 5);
INSERT INTO "test_table" (id, field1, field2, field3, field4, field5) VALUES (2, 2, 4, 5, 2, 5);
INSERT INTO "test_table" (id ,field1, field2, field3, field4, field5) VALUES (3, 1, 3, 6, 5, 2);
INSERT INTO "test_table" (id, field1, field2, field3, field4, field5) VALUES (4, 1, 2, 3, 4, 5);
INSERT INTO "test_table" (id ,field1, field2, field3, field4, field5) VALUES (5, 1, 3, 6, 5, 2);
INSERT INTO "test_table" (id, field1, field2, field3, field4, field5) VALUES (6, 11, 62, 32, 44, 23);
INSERT INTO "test_table" (id, field1, field2, field3, field4, field5) VALUES (7, 12, 62, 32, 44, 23);


DELETE FROM test_table
WHERE id IN (
  SELECT id FROM (
    SELECT id, ROW_NUMBER() OVER (PARTITION by field1, field2, field3, field4, field5 ORDER BY id) AS rnum
                     FROM test_table) t
              WHERE t.rnum > 1);


REINDEX table test_table;

CREATE UNIQUE INDEX myIndex ON test_table (field1, field2, field3, field4, field5);

DROP TABLE test_table;
