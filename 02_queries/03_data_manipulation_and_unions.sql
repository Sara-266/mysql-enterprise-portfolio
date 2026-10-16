-- MODULE: 03_data_manipulation_and_unions.sql
USE `sql_practice`;

-- 1. Cascading Phone Contact Hierarchy with COALESCE
SELECT 
  emp_id,
  emp_name,
  COALESCE(mobile, phone, 'NO DIRECT PHONE') AS primary_phone,
  COALESCE(mobile, phone, email, 'MISSING CONTACT') AS fallback_contact,
  IFNULL(bonus, 0.00) AS sanitized_bonus
FROM employees;

-- 2. Division Safety with NULLIF
SELECT 
  sale_id,
  product_id,
  unit_price,
  cost,
  ROUND(((unit_price - cost) / NULLIF(cost, 0.00)) * 100, 2) AS markup_percentage
FROM daily_sales
LIMIT 10;