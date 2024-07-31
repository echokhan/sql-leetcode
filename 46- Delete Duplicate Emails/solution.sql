DELETE FROM Person
WHERE
    id IN (SELECT id FROM (SELECT id, ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) rn FROM Person) A WHERE A.rn > 1)