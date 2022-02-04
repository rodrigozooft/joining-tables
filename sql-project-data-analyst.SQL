%%sql
postgresql:///orchestra

SELECT name, first_date, last_date, total_concerts
FROM 
    (SELECT TRIM(SPLIT_PART(soloist_name,',',2)) || ' ' || TRIM(SPLIT_PART(soloist_name,',',1)) AS name,
    TO_CHAR(MIN(date)::date,'DD Mon YYYY') AS first_date, 
    TO_CHAR(MAX(date)::date,'DD Mon YYYY') AS last_date, 
    COUNT(soloist_name) AS total_concerts
        FROM concerts
        INNER JOIN soloists
        ON concerts.id = soloists.id
        WHERE orchestra = 'New York Philharmonic' AND 
            eventtype = 'Subscription Season' AND 
            soloist_name NOT IN ('New York Choral Artists','Chorus','No Soloist','Schola Cantorum of NY') AND
            LOWER(soloist_name) NOT LIKE '%choir%'
    GROUP BY soloist_name
    ORDER BY total_concerts DESC
    LIMIT 29) as soloists_table