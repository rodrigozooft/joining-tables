SELECT 
  -- Replace whitespace in the film title with an underscore
  REPLACE(title, ' ', '_') AS title
FROM film; 

SELECT 
  -- Select the title and description columns
  title,
  description,
  -- Determine the length of the description column
  CHAR_LENGTH(description) AS desc_len
FROM film;

SELECT 
  -- Select the first 50 characters of description
  LEFT(description, 50) AS short_desc
FROM 
  film AS f; 

SELECT 
  -- Select only the street name from the address table
  SUBSTRING(address FROM POSITION(' ' IN address)+1 FOR LENGTH(address))
FROM 
  address;

SELECT
  -- Extract the characters to the left of the '@'
  LEFT(email, POSITION('@' IN email)-1) AS username,
  -- Extract the characters to the right of the '@'
  SUBSTRING(email FROM POSITION('@' IN email)+1 FOR LENGTH(email)) AS domain
FROM customer;