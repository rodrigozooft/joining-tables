SELECT
  *,
  -- Assign numbers to each row
  ROW_NUMBER() OVER() AS Row_N
FROM Summer_Medals
ORDER BY Row_N ASC;

SELECT
  Year,

  -- Assign numbers to each year
  ROW_NUMBER() OVER() AS Row_N
FROM (
  SELECT DISTINCT year
  FROM summer_medals
  ORDER BY Year ASC
) AS Years
ORDER BY Year ASC;
