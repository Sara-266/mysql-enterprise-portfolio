-- MODULE: 02_joins_and_self_joins.sql
USE `sql_practice`;

-- 1. Hierarchical Self-Join (Employee to Manager)
SELECT 
  e.emp_id AS employee_id,
  e.emp_name AS employee_name,
  e.salary AS employee_salary,
  IFNULL(m.emp_name, 'BOARD OF DIRECTORS / TOP EXECUTIVE') AS manager_name,
  (e.salary - IFNULL(m.salary, e.salary)) AS salary_delta_vs_manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id
ORDER BY e.manager_id ASC, e.salary DESC;

-- 2. Circular Secret Santa Gift Exchange Assignment Logic
WITH ranked_participants AS (
  SELECT 
    emp_id,
    emp_name,
    email,
    department_id,
    ROW_NUMBER() OVER (ORDER BY emp_id) AS participant_seq,
    COUNT(*) OVER () AS total_participants
  FROM employees
)
SELECT 
  giver.emp_id AS giver_id,
  giver.emp_name AS giver_name,
  d1.dept_name AS giver_dept,
  receiver.emp_id AS receiver_id,
  receiver.emp_name AS receiver_name,
  d2.dept_name AS receiver_dept,
  CASE 
    WHEN giver.department_id <> receiver.department_id THEN 'CROSS-DEPARTMENT'
    ELSE 'INTRA-DEPARTMENT'
  END AS pairing_type
FROM ranked_participants giver
JOIN ranked_participants receiver
  ON receiver.participant_seq = (giver.participant_seq % giver.total_participants) + 1
LEFT JOIN departments d1 ON giver.department_id = d1.dept_id
LEFT JOIN departments d2 ON receiver.department_id = d2.dept_id
ORDER BY giver.giver_id ASC;