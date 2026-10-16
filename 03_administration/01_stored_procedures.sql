-- MODULE: 01_stored_procedures.sql
USE `sql_practice`;

DROP PROCEDURE IF EXISTS sp_generate_corporate_emails;

DELIMITER //

CREATE PROCEDURE sp_generate_corporate_emails(
  OUT rows_updated INT
)
BEGIN
  UPDATE employees
  SET email = LOWER(
    CONCAT(
      REGEXP_REPLACE(SUBSTRING_INDEX(emp_name, ' ', 1), '[^a-zA-Z]', ''),
      '.',
      REGEXP_REPLACE(SUBSTRING_INDEX(emp_name, ' ', -1), '[^a-zA-Z]', ''),
      '@company.com'
    )
  )
  WHERE email IS NULL 
     OR email = '' 
     OR NOT REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

  SET rows_updated = ROW_COUNT();
END //

DELIMITER ;