
-- PART 1 --

-- look at the error
SELECT Site_name, MAX(Area) FROM Site;

-- This query does not work because when we select the site_name column and then run the function, it wants to run the function on all of the rows in this column. This does not make sense for the MAX function because this is supposed to select a single value, not run it on every row.

-- PART 2 --

-- Select the maximum area site the correct way
SELECT Site_name, Area FROM Site
    ORDER BY Area DESC
    LIMIT 1;


-- Nested query
SELECT Site_name, Area FROM Site 
    WHERE Area = (SELECT MAX(Area) FROM Site);