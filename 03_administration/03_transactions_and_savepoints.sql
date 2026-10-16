-- MODULE: 03_transactions_and_savepoints.sql
USE `sql_practice`;

START TRANSACTION;

INSERT INTO daily_sales (sale_id, sale_date, product_id, quantity, unit_price, cost, discount_pct)
VALUES (9002, CURDATE(), 3, 1, 349.99, 209.99, 5);

SAVEPOINT sp_after_item_one;

-- Defective order line simulation:
INSERT INTO daily_sales (sale_id, sale_date, product_id, quantity, unit_price, cost, discount_pct)
VALUES (9003, CURDATE(), 10, 9999, 189.99, 123.49, 0);

-- Partial rollback to savepoint:
ROLLBACK TO SAVEPOINT sp_after_item_one;

COMMIT;