-- ==============================================================================
-- DATABASE: sql_practice
-- PURPOSE: Enterprise retail & workforce analytics database schema definition,
--          foreign key integrity, and production-scale transaction data.
-- DIALECT: MySQL 8.0+
-- AUTHOR:  Lead Data Engineer & Senior Database Administrator
-- ==============================================================================

DROP DATABASE IF EXISTS `sql_practice`;
CREATE DATABASE `sql_practice`
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_0900_ai_ci;

USE `sql_practice`;

CREATE TABLE departments (
  dept_id   INT NOT NULL,
  dept_name VARCHAR(50) NOT NULL,
  CONSTRAINT pk_departments PRIMARY KEY (dept_id),
  CONSTRAINT uq_departments_dept_name UNIQUE (dept_name)
) ENGINE = InnoDB;

CREATE TABLE employees (
  emp_id        INT NOT NULL,
  emp_name      VARCHAR(100) NOT NULL,
  email         VARCHAR(100),
  phone         VARCHAR(20),
  mobile        VARCHAR(20),
  department_id INT,
  salary        DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  bonus         DECIMAL(10,2),
  hire_date     DATE NOT NULL,
  manager_id    INT,
  CONSTRAINT pk_employees PRIMARY KEY (emp_id),
  CONSTRAINT fk_employees_department
    FOREIGN KEY (department_id) REFERENCES departments(dept_id)
    ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT fk_employees_manager
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE = InnoDB;

CREATE TABLE products (
  product_id   INT NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  category     VARCHAR(50) NOT NULL,
  price        DECIMAL(10,2) NOT NULL,
  stock_qty    INT NOT NULL DEFAULT 0,
  CONSTRAINT pk_products PRIMARY KEY (product_id),
  CONSTRAINT chk_products_price CHECK (price >= 0),
  CONSTRAINT chk_products_stock CHECK (stock_qty >= 0)
) ENGINE = InnoDB;

CREATE TABLE daily_sales (
  sale_id      INT NOT NULL,
  sale_date    DATE NOT NULL,
  product_id   INT NOT NULL,
  quantity     INT NOT NULL DEFAULT 1,
  unit_price   DECIMAL(10,2) NOT NULL,
  cost         DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  discount_pct INT,
  CONSTRAINT pk_daily_sales PRIMARY KEY (sale_id),
  CONSTRAINT fk_daily_sales_product
    FOREIGN KEY (product_id) REFERENCES products(product_id)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE raw_imports (
  import_id   INT NOT NULL,
  email       VARCHAR(100),
  phone       VARCHAR(20),
  mobile      VARCHAR(20),
  revenue     VARCHAR(20),
  score       VARCHAR(10),
  import_date VARCHAR(20),
  CONSTRAINT pk_raw_imports PRIMARY KEY (import_id)
) ENGINE = InnoDB;

CREATE TABLE customer_feedback (
  feedback_id        INT NOT NULL,
  customer_name      VARCHAR(100) NOT NULL,
  satisfaction_score INT NOT NULL,
  CONSTRAINT pk_customer_feedback PRIMARY KEY (feedback_id),
  CONSTRAINT chk_satisfaction_score CHECK (satisfaction_score BETWEEN 0 AND 100)
) ENGINE = InnoDB;