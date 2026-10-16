MySQL Enterprise Engineering & Advanced Analytics Portfolio (mysql-enterprise-portfolio)
![Image](https://img.shields.io/badge/MySQL-8.0%2B-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Image](https://img.shields.io/badge/SQL-ANSI%2FISO%20Compliant-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Image](https://img.shields.io/badge/Engine-InnoDB%20ACID-005C84?style=for-the-badge)
![Image](https://img.shields.io/badge/CI-SQLFluff%20Linter-22c55e?style=for-the-badge&logo=githubactions&logoColor=white)
![Image](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)
Executive Overview
The mysql-enterprise-portfolio repository is a centralized, production-grade database engineering showcase demonstrating enterprise architecture, relational schema modeling, dimensional warehouse design patterns, procedural automation, and advanced query optimization in MySQL 8.0+.
Designed from the perspective of a Principal Database Architect and Lead Data Engineer, this repository bridges the gap between transactional OLTP reliability and analytical OLAP rigor:
Relational Integrity & ACID Reliability: Fully constrained schema designs using ENGINE = InnoDB, enforcing Primary Keys, cascading Foreign Keys, domain-specific CHECK constraints, unique indexes, and UTF-8 (utf8mb4_0900_ai_ci) character collations.
Advanced Query Engineering & Window Functions: Complex multi-table transformations, non-trivial hierarchical self-joins, moving averages, cumulative running balances, and deterministic circular derangements (Secret Santa assignment algorithm).
Data Quality & Ingestion ETL Pipelines: Multi-format date harmonizers and regular expression parsing engines utilizing MySQL 8.0 PCRE functions (REGEXP_LIKE, REGEXP_SUBSTR, REGEXP_REPLACE).
Database Administration, Security & Governance: Role-Based Access Control (RBAC), column-level grant isolation, SSL-enforced service accounts, modular stored procedures with transactional exception handlers (SQLEXCEPTION), and nested SAVEPOINT rollbacks.
Continuous Integration (CI): Automated continuous linting and dialect verification powered by SQLFluff and GitHub Actions.
Table of Contents
Executive Overview
Repository Architecture
Database Schema Summaries & ERD Architecture
1. Schema: Parks_and_Recreation (Municipal Administration & HR)
2. Schema: sql_practice (Enterprise Retail & Sales Intelligence)
Key SQL Skills Showcase
Selected Code Snippets with Technical Insights
Highlight 1: Circular Secret Santa Assignment via Window Modulo Arithmetic
Highlight 2: Defensive Mathematical Computation & NULLIF Division Protection
Highlight 3: Autonomous Corporate Email Synthesizer Stored Procedure
Highlight 4: Fault-Tolerant Transaction Batch with Nested Savepoints
MySQL Workbench Execution & Deployment Guide
Continuous Integration & Dialect Linting
Technical Standards & Design Patterns
Repository Architecture
The repository enforces a structured, separation-of-concerns layout designed for maintainability, continuous deployment, and programmatic readability:
code
Text
mysql-enterprise-portfolio/
│
├── .github/
│   └── workflows/
│       └── sql-lint.yml                  # Automated CI/CD workflow running SQLFluff for MySQL 8.0 dialect
│
├── 01_schemas/
│   ├── 01_parks_and_recreation.sql       # Municipal administration DDL, cascading FKs, age CHECK constraints
│   └── 02_sql_practice.sql               # Normalized retail commerce DDL, staging tables, and seed transactions
│
├── 02_queries/
│   ├── 01_basics_and_aggregations.sql    # Aggregations, computed compensation, HAVING thresholds, WITH ROLLUP
│   ├── 02_joins_and_self_joins.sql       # Relational joins, manager trees & Circular Secret Santa modulo algorithm
│   ├── 03_data_manipulation_and_unions.sql # Multi-tier CASE logic, COALESCE cascading contact hierarchy, NULLIF safety
│   ├── 04_advanced_analytics_and_windows.sql # Window frames, running totals, 7-day rolling moving averages, CTEs
│   └── 05_data_cleaning_and_regex.sql    # PCRE regex validation, RFC email checks, multi-format date harmonization
│
├── 03_administration/
│   ├── 01_stored_procedures.sql          # Stored procedures with IN/OUT parameters, DELIMITER, SQLEXCEPTION rollback
│   ├── 02_security_and_privileges.sql    # RBAC security model, column-level SELECT grants, SSL user provisioning
│   └── 03_transactions_and_savepoints.sql # Explicit transactions, nested SAVEPOINT isolation, partial error recovery
│
├── .gitignore                            # Client cache, MySQL Workbench autosave, and OS-level exclusions
└── README.md                             # Comprehensive technical documentation & portfolio specification
Database Schema Summaries & ERD Architecture
The repository hosts two distinct, production-modeled databases showcasing both normalized operational architectures and dimensional/analytical modeling principles.
1. Schema: Parks_and_Recreation (Municipal Administration & HR)
This schema represents a public sector administrative system characterized by clean vertical entity partitioning between workforce demographics and payroll data.
hub
Diagram
Mermaid diagram
Relational Constraints & Design Patterns:
Entity Partitioning: Physical demographics (employee_demographics) are decoupled from compensation data (employee_salary), adhering to data privacy and least-privilege administrative principles.
Domain Constraint Enforcement: The employee_demographics table enforces an inline validation constraint:
code
SQL
CONSTRAINT chk_employee_age CHECK (age >= 16 AND age <= 100)
Referential Integrity: The employee_salary.dept_id foreign key enforces ON UPDATE CASCADE ON DELETE SET NULL, ensuring municipal reorganization does not orphan historical compensation records.
2. Schema: sql_practice (Enterprise Retail & Sales Intelligence)
A 6-table enterprise retail relational schema modeling a full commercial lifecycle: organizational management trees, product master catalogs, high-frequency transaction sales ledgers (490+ rows), untrusted staging imports, and customer Net Promoter Score (NPS) feedback.
hub
Diagram
Mermaid diagram
Relational Constraints & Design Patterns:
Hierarchical Self-Referential Adjacency List: The employees table models management chains using a recursive foreign key:
code
SQL
CONSTRAINT fk_employees_manager 
  FOREIGN KEY (manager_id) REFERENCES employees(emp_id) 
  ON UPDATE CASCADE ON DELETE SET NULL
Fact vs. Dimension Architecture: daily_sales acts as a high-density transactional fact table with foreign key linkage to the products dimension table with ON DELETE RESTRICT to protect financial auditability.
Untrusted Ingestion Staging Boundary: raw_imports isolates dirty, non-validated external inputs before ETL cleansing pipelines promote records into core production tables.
Key SQL Skills Showcase
Domain	Dialect Capabilities & Syntax	Enterprise Production Use-Case
Database Administration (DBA)	ENGINE = InnoDB, CREATE ROLE, GRANT/REVOKE, REQUIRE SSL	Multi-tier Role-Based Access Control, column-level compensation masking, least-privilege security.
Transaction Engineering	START TRANSACTION, SAVEPOINT, ROLLBACK TO SAVEPOINT, COMMIT	Partial fault recovery in multi-item order processing, ACID isolation, atomicity guarantees.
Procedural Automation	DELIMITER //, DECLARE EXIT HANDLER FOR SQLEXCEPTION, ROW_COUNT()	Autonomous corporate email provisioning, missing revenue imputation, transactional safety.
Advanced Window Analytics	OVER (PARTITION BY ... ORDER BY ...), ROWS BETWEEN, NTILE(4), LAG/LEAD	Period-over-period variance tracking, salary parity rankings, 7-day smoothing moving averages.
Relational Set Operations	INNER, LEFT, RIGHT, CROSS, Recursive Self-Joins, UNION / UNION ALL	Organizational reporting trees, Secret Santa circular derangements, cross-system schema federation.
Data Quality & Regex ETL	REGEXP_LIKE, REGEXP_SUBSTR, REGEXP_REPLACE, STR_TO_DATE, COALESCE	RFC email validation, multi-format date harmonization (YYYY-MM-DD vs DD/MM/YYYY), contact cascades.
Mathematical Defensive SQL	NULLIF, CASE WHEN, IFNULL, ROUND	Division-by-zero prevention, markup margin calculations, NPS customer cohort categorization.
Selected Code Snippets with Technical Insights
Highlight 1: Circular Secret Santa Assignment via Window Modulo Arithmetic
Script: 02_queries/02_joins_and_self_joins.sql
code
SQL
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
  giver.email AS giver_email,
  d1.dept_name AS giver_department,
  receiver.emp_id AS receiver_id,
  receiver.emp_name AS receiver_name,
  receiver.email AS receiver_email,
  d2.dept_name AS receiver_department,
  CASE 
    WHEN giver.department_id <> receiver.department_id THEN 'CROSS-DEPARTMENT'
    ELSE 'INTRA-DEPARTMENT'
  END AS assignment_type
FROM ranked_participants giver
JOIN ranked_participants receiver
  ON receiver.participant_seq = (giver.participant_seq % giver.total_participants) + 1
LEFT JOIN departments d1 ON giver.department_id = d1.dept_id
LEFT JOIN departments d2 ON receiver.department_id = d2.dept_id
ORDER BY giver.giver_id ASC;
Logic & Insights:
The Challenge: A standard CROSS JOIN or naive random join frequently creates self-assignments (giver = receiver) or generates isolated disjoint sub-loops.
The Solution:
The CTE generates a contiguous sequence 
 via ROW_NUMBER().
The self-join utilizes modulo arithmetic: 
.
Because 
, this mathematical offset forms a single closed Hamiltonian cycle covering all vertices. It deterministically guarantees that no employee draws themselves (
 for all 
) and guarantees 
 bijective mapping without procedural loops or cursor overhead.
Highlight 2: Defensive Mathematical Computation & NULLIF Division Protection
Script: 02_queries/03_data_manipulation_and_unions.sql
code
SQL
SELECT 
  sale_id,
  product_id,
  quantity,
  unit_price,
  cost,
  -- Defensive calculation preventing Error 1365: Division by 0
  ROUND(((unit_price - cost) / NULLIF(cost, 0.00)) * 100, 2) AS markup_percentage,
  CASE 
    WHEN cost = 0.00 THEN 'ZERO-COST PROMOTIONAL INVENTORY'
    WHEN unit_price > cost THEN 'PROFITABLE'
    ELSE 'LOSS LEADER'
  END AS profitability_flag
FROM daily_sales
LIMIT 20;
Logic & Insights:
The Challenge: In retail sales ledgers, promotional items, free samples, and zero-cost warranty replacements record cost = 0.00. Standard division (unit_price - cost) / cost triggers fatal runtime errors or outputs non-standard NULL/Inf states depending on the server's SQL_MODE (ERROR_FOR_DIVISION_BY_ZERO).
The Solution:
NULLIF(cost, 0.00) evaluates cost: if it equals 0.00, it dynamically transforms the denominator into SQL NULL.
In SQL arithmetic, (Expression / NULL) yields NULL safely rather than terminating batch queries.
The accompanying CASE statement explicitly flags these rows as 'ZERO-COST PROMOTIONAL INVENTORY', providing transparent auditing for business intelligence consumers.
Highlight 3: Autonomous Corporate Email Synthesizer Stored Procedure
Script: 03_administration/01_stored_procedures.sql
code
SQL
DROP PROCEDURE IF EXISTS sp_generate_corporate_emails;

DELIMITER //

CREATE PROCEDURE sp_generate_corporate_emails(
  OUT rows_updated INT
)
BEGIN
  -- Safe update of employees missing valid email addresses
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
     OR NOT REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');

  SET rows_updated = ROW_COUNT();

  SELECT 
    CONCAT('Email generation routine complete. Updated records: ', rows_updated) AS execution_status;
END //

DELIMITER ;
Logic & Insights:
The Challenge: Human onboarding error frequently leaves contact fields empty or malformed with non-RFC strings.
The Solution:
SUBSTRING_INDEX(emp_name, ' ', 1) extracts the first name; SUBSTRING_INDEX(emp_name, ' ', -1) extracts the surname.
REGEXP_REPLACE(..., '[^a-zA-Z]', '') strips periods, apostrophes, and accidental numerical characters.
REGEXP_LIKE acts as a guard filter: only rows that are NULL, empty, or fail standard RFC 5322 email syntax are modified.
The procedure returns the exact count of modified rows via ROW_COUNT() into the caller's OUT parameter, enabling automated pipeline telemetry and logging.
Highlight 4: Fault-Tolerant Transaction Batch with Nested Savepoints
Script: 03_administration/03_transactions_and_savepoints.sql
code
SQL
START TRANSACTION;

-- Step 1: Process Order Line 1 (Valid item: Smart Watch Gen 5)
INSERT INTO daily_sales (sale_id, sale_date, product_id, quantity, unit_price, cost, discount_pct)
VALUES (9002, CURDATE(), 3, 1, 349.99, 209.99, 5);

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 3;

-- Establish Savepoint after Order Line 1 successfully writes
SAVEPOINT sp_after_item_one;

-- Step 2: Attempt Order Line 2 (Erroneous or out-of-stock item simulation)
INSERT INTO daily_sales (sale_id, sale_date, product_id, quantity, unit_price, cost, discount_pct)
VALUES (9003, CURDATE(), 10, 9999, 189.99, 123.49, 0);

-- Inventory check flags deficiency -> Roll back specifically to milestone:
ROLLBACK TO SAVEPOINT sp_after_item_one;

-- Step 3: Record an alternative valid line item instead
INSERT INTO daily_sales (sale_id, sale_date, product_id, quantity, unit_price, cost, discount_pct)
VALUES (9004, CURDATE(), 8, 1, 45.99, 29.89, 0);

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 8;

-- Finalize transaction preserving Item 1 and Item 3 while cleanly omitting Item 2
COMMIT;
Logic & Insights:
The Challenge: A standard ROLLBACK destroys the entire transactional state, forcing applications to re-attempt entire multi-item orders even if only one line item failed validation.
The Solution: SAVEPOINT sp_after_item_one sets an intermediate recovery milestone. When the erroneous line item fails inventory verification, executing ROLLBACK TO SAVEPOINT undoes exclusively Step 2 while retaining Step 1 in an uncommitted, active transaction state. The final COMMIT guarantees strict ACID consistency without discarding valid operational work.
MySQL Workbench Execution & Deployment Guide
Follow these step-by-step instructions to replicate and execute the portfolio scripts in MySQL Workbench (or standard MySQL CLI).
Prerequisites
MySQL Server 8.0.28+ installed and running.
MySQL Workbench 8.0+ client installed.
User credentials with database creation and administrative grant privileges (e.g., root).
Step 1: Clone the Repository
code
Bash
git clone https://github.com/your-username/mysql-enterprise-portfolio.git
cd mysql-enterprise-portfolio
Step 2: Configure Client Session Settings
In MySQL Workbench, launch a connection to your instance and disable safe update restrictions for the current administration session:
code
SQL
SET SQL_SAFE_UPDATES = 0;
SET NAMES utf8mb4;
Step 3: Execute Schema DDL & Seed Ingestion Scripts
In Workbench, navigate to File -> Open SQL Script... (or Ctrl + O / Cmd + O) and execute the following scripts in sequence:
01_schemas/01_parks_and_recreation.sql
Creates the Parks_and_Recreation database.
Deploys parks_departments, employee_demographics, and employee_salary tables.
Seeds 12 demographic and salary records.
01_schemas/02_sql_practice.sql
Creates the sql_practice database.
Deploys departments, employees, products, daily_sales, raw_imports, and customer_feedback.
Seeds the organizational hierarchy, 15 catalog products, and 490 transaction ledger rows.
Verification: Verify table creation and storage engine assignment:
code
SQL
SHOW TABLE STATUS FROM `sql_practice` WHERE Engine = 'InnoDB';
Step 4: Run Analytical & Advanced Query Modules
Open and execute any query script individually to inspect query outputs:
02_queries/01_basics_and_aggregations.sql
02_queries/02_joins_and_self_joins.sql (Run Highlight 1 Secret Santa query)
02_queries/03_data_manipulation_and_unions.sql (Inspect NULLIF and COALESCE behavior)
02_queries/04_advanced_analytics_and_windows.sql (Examine rolling 7-day revenue averages)
02_queries/05_data_cleaning_and_regex.sql (Run multi-format date parser and RFC email validator)
Step 5: Deploy Stored Procedures & Execute Administration Scripts
Open 03_administration/01_stored_procedures.sql and run all lines.
Verify the procedure executes:
code
SQL
CALL sql_practice.sp_generate_corporate_emails(@rows_updated);
SELECT @rows_updated AS total_emails_synthesized;
Open 03_administration/02_security_and_privileges.sql:
Creates roles role_bi_analyst, role_etl_service, role_auditor.
Provisions SSL-enforced user etl_worker@localhost.
Applies column-level security on salaries.
Open 03_administration/03_transactions_and_savepoints.sql:
Runs transaction blocks with SAVEPOINT partial rollbacks and disaster abort testing.
Continuous Integration & Dialect Linting
This repository integrates an automated GitHub Actions CI/CD pipeline (.github/workflows/sql-lint.yml) using SQLFluff to enforce ANSI/MySQL 8.0 code quality standards across all commits and pull requests:
code
Yaml
name: SQL Lint & Syntax Validation

on:
  push:
    branches: [ main, master ]
    paths: [ '**/*.sql' ]
  pull_request:
    branches: [ main, master ]
    paths: [ '**/*.sql' ]

jobs:
  lint:
    name: Run SQLFluff Linter
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'

      - name: Install SQLFluff
        run: pip install sqlfluff

      - name: Lint MySQL Scripts
        run: |
          sqlfluff lint --dialect mysql 01_schemas/ 02_queries/ 03_administration/
Technical Standards & Design Patterns
100% ANSI / ISO Uppercase Keywords: All SQL commands (SELECT, FROM, WHERE, JOIN, GROUP BY, WINDOW, OVER, PARTITION BY, START TRANSACTION, COMMIT) are consistently uppercased for scannability and lint compliance.
Deterministic Indentation: 2-space modular indentation with project-first column alignments.
Storage Engine Discipline: Strict enforcement of ENGINE = InnoDB for all tables to guarantee row-level locking, foreign key integrity, and MVCC multi-version concurrency control.
Collation & Encoding: Explicit usage of utf8mb4 charset and utf8mb4_0900_ai_ci collation across both databases, preventing Illegal mix of collations errors during cross-database set operations (UNION).
Defensive Schema Design: Generous application of domain CHECK constraints, sensible defaults (DEFAULT 0.00), and explicit NOT NULL constraints across critical operational columns.
Author & Engineering Ownership
Lead Data Engineer & Senior Database Administrator
Repository: mysql-enterprise-portfolio
License: MIT
