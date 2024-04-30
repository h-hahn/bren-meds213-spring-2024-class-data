-- Problem 3 --

-- create temporary table with the average volumes (calculate the volume) grouped by nest id
CREATE TEMP TABLE Averages AS
    SELECT Nest_ID, AVG( ((3.14/6) * (Width)^2 * Length)) AS Avg_volume
        FROM Bird_eggs
        GROUP BY Nest_ID;

-- create another temporary table with the maximum average volume and join averages with bird nest table
CREATE TEMP TABLE Avg_species AS
    SELECT Species, MAX(Avg_volume) AS Max_avg_volume  
        FROM Bird_nests JOIN Averages USING (Nest_ID)
        GROUP BY Species; 

-- create another temporary table to turn the code into scientific name and order max average by descending volume
CREATE TEMP TABLE Final_table AS
SELECT Scientific_name, Code, Max_avg_volume FROM Species
    JOIN Avg_species ON Code = Species
    ORDER BY Max_avg_volume DESC;

-- drop the code column because we dont need it anymore
ALTER TABLE Final_table 
    DROP COLUMN Code;

-- look at the resulting table
SELECT * FROM Final_table;