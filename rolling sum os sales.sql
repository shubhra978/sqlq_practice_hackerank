
SELECT
    customer_id,
    sale_date,
    sales,
    -- 7-day rolling SUM per customer, as `rolling_7day_sum`
    sum(sales)over(partition by customer_Id order by sale_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS `rolling_7day_sum`
FROM customer_sales
ORDER BY customer_id, sale_date;
