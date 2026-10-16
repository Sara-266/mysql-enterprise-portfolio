-- MODULE: 02_security_and_privileges.sql
USE `sql_practice`;

CREATE ROLE 'role_bi_analyst';
CREATE ROLE 'role_etl_service';

-- Column-Level Security on sensitive compensation:
GRANT SELECT (emp_id, emp_name, email, department_id, hire_date) 
  ON sql_practice.employees TO 'role_bi_analyst';

CREATE USER 'etl_worker'@'localhost' 
  IDENTIFIED BY 'EtlWorkerProdSecret!2026'
  REQUIRE SSL;

GRANT 'role_etl_service' TO 'etl_worker'@'localhost';