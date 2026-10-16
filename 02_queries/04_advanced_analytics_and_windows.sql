-- MODULE: 04_advanced_analytics_and_windows.sql
USE `sql_practice`;

-- 1. Cumulative Revenue and 7-Day Rolling Moving Average
WITH daily_revenue_summary AS (
  SELECT 
    sale_date,
    COUNT(sale_id) AS transactions_count,
    ROUND(SUM(quantity * unit_price * (1 - IFNULL(discount_pct, 0) / 100.0)), 2) AS net_revenue
  FROM daily_sales
  GROUP BY sale_date
)
SELECT 
  sale_date,
  net_revenue,
  SUM(net_revenue) OVER (
    ORDER BY sale_date 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_running_revenue,
  ROUND(AVG(net_revenue) OVER (
    ORDER BY sale_date 
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ), 2) AS rolling_7day_avg_revenue
FROM daily_revenue_summary
ORDER BY sale_date ASC;