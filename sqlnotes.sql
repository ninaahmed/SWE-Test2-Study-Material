/*
Clauses Left:
    count
    create
    cross join
    drop
    natural join
    on
    show
    sum
    temporary
    using
    as
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
 SELECT field1, min(field2) FROM table
 GROUP BY field1
 HAVING min(field2) BETWEEN num1 AND num2;

-- INNER JOIN with conditions
SELECT DISTINCT fields FROM table1
INNER JOIN table2
on table1.keyfield = table2.keyfield
WHERE table2.field = value;

-- subquery
-- outcome comparable to last example
SELECT fields FROM table1
WHERE field in (SELECT field in table2
                WHERE condition)
[ORDER BY field ASC|DESC];

-- select fields where conditions include being min(), max(), or avg()
SELECT fields FROM table
WHERE field in (SELECT max(field) FROM table);

-- select where one column's values can repeat, but we want
-- the values of that column where another column in the row
-- matches one value, but cannot ever match another value (???)
-- the example in class was get the student ids for the students
-- who applied to CS, but never applied to EE
SELECT DISTINCT fields FROM table
WHERE field1 NOT IN 
    (SELECT field1 from table
     WHERE field2 = value)
AND field2 = othervalue;
