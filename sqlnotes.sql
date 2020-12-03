/*
Clauses Left:
    create
    cross join
    drop
    natural join
    show
    temporary
    self join
    */

 -- EXAMPLES --

 -- ORDER BY
 SELECT fields FROM table
 ORDER BY field ASC | DESC;

 -- DISTINCT
 SELECT DISTINCT fields FROM table;

 -- multiple WHERE
 SELECT fields FROM table
 WHERE field1 = cond1 AND field2 = cond2;

 -- LIMIT
 SELECT fields FROM table
 LIMIT x;

 -- regex
 -- example where name ends in y
 -- '%' means some string
 SELECT name FROM table
 WHERE name LIKE "%y";

 -- regex
 -- example where name is 3 letters and ends in y
 -- '_' means 1 character
 SELECT name FROM table
 WHERE name LIKE "__y";

 -- min, max, avg
 SELECT min(field), max(field), avg(field) FROM table;

 -- IN
 -- use when the column name could be multiple values
 SELECT field FROM table
 WHERE field in (value1, value2, ...);

 -- BETWEEN
 -- example without grouping
 SELECT field FROM table
 WHERE field BETWEEN num1 AND num2;

 -- BETWEEN
 -- example with grouping, can use min(), max(), or avg() here
 SELECT field1, avg(field2) FROM table
 WHERE field2 BETWEEN num1 AND num2
 GROUP BY field1;

 -- HAVING
 -- must come after GROUP BY
 -- works with count(*)
 SELECT field1, min(field2) FROM table
 GROUP BY field1
 HAVING min(field2) BETWEEN num1 AND num2;

-- INNER JOIN with conditions and ON
SELECT DISTINCT fields FROM table1
INNER JOIN table2
ON table1.keyfield = table2.keyfield
WHERE table2.field = value;

-- subquery
-- outcome comparable to last example
SELECT fields FROM table1
WHERE field IN (SELECT field IN table2
                WHERE condition)
[ORDER BY field ASC|DESC];

-- select fields where conditions include being min(), max(), or avg()
SELECT fields FROM table
WHERE field IN (SELECT max(field) FROM table);

-- select where one column's values can repeat, but we want
-- the values of that column where another column in the row
-- matches one value, but cannot ever match another value (???)
-- the example in class was get the student ids for the students
-- who applied to CS, but never applied to EE
SELECT DISTINCT fields FROM table
WHERE field1 NOT IN 
    (SELECT field1 FROM table
     WHERE field2 = value)
AND field2 = othervalue;

-- COUNT
-- returns number of rows returned by the query
SELECT COUNT(*) FROM table

-- USING
SELECT DISTINCT a.field, b.field
FROM table1 a JOIN table2 b
USING(common_field)
[WHERE condition];

-- AS
-- can be used to rename columnds or tables
SELECT DISTINCT CONCAT(a.field, " ", b.field) AS data
FROM table1 AS a JOIN table2 AS b
USING(common_field)
[WHERE conditon];

-- SUM
-- I used this for an example where there were duplicates
-- of one column (name), so I summed an integer column
SELECT field, COUNT(*), SUM(int_field)
FROM table
GROUP BY field;
