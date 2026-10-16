-- MODULE: 05_data_cleaning_and_regex.sql
USE `sql_practice`;

-- 1. RFC Email Validation & Extraction
SELECT 
  import_id,
  TRIM(email) AS raw_email,
  REGEXP_SUBSTR(LOWER(TRIM(email)), '^[^@]+') AS email_username,
  REGEXP_SUBSTR(LOWER(TRIM(email)), '(?<=@)[A-Za-z0-9.-]+') AS email_domain,
  CASE 
    WHEN REGEXP_LIKE(TRIM(email), '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') THEN 'VALID'
    ELSE 'MALFORMED'
  END AS validation_status
FROM raw_imports;

-- 2. Multi-Format Date Parser (YYYY-MM-DD vs DD/MM/YYYY vs DD-MM-YYYY)
SELECT 
  import_id,
  import_date,
  CASE 
    WHEN REGEXP_LIKE(import_date, '^[0-9]{4}-[0-9]{2}-[0-9]{2}$') THEN STR_TO_DATE(import_date, '%Y-%m-%d')
    WHEN REGEXP_LIKE(import_date, '^[0-9]{2}/[0-9]{2}/[0-9]{4}$') THEN STR_TO_DATE(import_date, '%d/%m/%Y')
    WHEN REGEXP_LIKE(import_date, '^[0-9]{2}-[0-9]{2}-[0-9]{4}$') THEN STR_TO_DATE(import_date, '%d-%m-%Y')
    ELSE NULL
  END AS parsed_iso_date
FROM raw_imports;