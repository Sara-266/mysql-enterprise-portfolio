-- MODULE: 01_basics_and_aggregations.sql
USE `sql_practice`;

-- 1. Basic Select & Total Compensation
SELECT 
  emp_id,
  emp_name,
  salary,
  IFNULL(bonus, 0.00) AS bonus_amount,
  (salary + IFNULL(bonus, 0.00)) AS total_compensation,
  hire_date
FROM employees
ORDER BY total_compensation DESC;

-- 2. Department Benchmarks with Payroll
SELECT 
  d.dept_id,
  d.dept_name,
  COUNT(e.emp_id) AS total_headcount,
  ROUND(AVG(e.salary), 2) AS avg_base_salary,
  SUM(e.salary + IFNULL(e.bonus, 0.00)) AS total_payroll_budget
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.department_id
GROUP BY d.dept_id, d.dept_name
ORDER BY total_payroll_budget DESC;

-- 3. HAVING Clause on Aggregate Thresholds
SELECT 
  d.dept_name,
  COUNT(e.emp_id) AS staff_count,
  ROUND(AVG(e.salary), 2) AS avg_salary
FROM departments d
JOIN employees e ON d.dept_id = e.department_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) >= 2 AND AVG(e.salary) >= 60000.00;