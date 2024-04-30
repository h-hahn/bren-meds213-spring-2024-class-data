-- PART 1 -- 
-- create a temp table 
CREATE TEMP TABLE mytable (
    Column1 REAL
);

-- insert values into table
INSERT INTO mytable (Column1) 
    VALUES
        (3.4),
        (4),
        (NULL),
        (6.7),
        (9);

-- get average of column
SELECT AVG(Column1) FROM mytable;

-- average of column excluding NULL values
SELECT AVG(Column1) 
    FROM mytable
    WHERE Column1 IS NOT NULL;

-- average of column including NULL values
SELECT AVG(COALESCE(Column1,0)) 
    FROM mytable;

-- The average of the column is the same when specifying to exclude NULL values and without specifying, which means that the AVG function already excludes NULL values. You can use coalesce to include the NULL values as 0 and factor it into the average. In this case, the value is lower because there is a 0 included and it's the same value divided over all 5 rows instead of 4.

-- PART 2 --
SELECT SUM(Column1)/COUNT(*) FROM mytable;
SELECT SUM(Column1)/COUNT(Column1) FROM mytable;

-- The second query is correct because the first one (Count(*)) counts the row with the null value so the average is wrong. The second query only divides it by the number of rows that have values.

DROP TABLE mytable;