-- Missing Data --

SELECT Code FROM Site


-- who worked with whom --

SELECT * FROM Camp_assignment A 
    JOIN Camp_assignment B ON A.Site = B.Site;

-- who's the culprit

SELECT Name FROM Bird_eggs 
    WHERE 