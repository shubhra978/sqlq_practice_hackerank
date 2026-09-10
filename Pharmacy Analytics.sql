 /*part 1 */
WITH profit_of_goods as (
SELECT
drug,(total_sales-cogs) as total_profit
from pharmacy_sales 
order by (total_sales-cogs) DESC
limit 3)

SELECT * from profit_of_goods


 /*part 2 */
SELECT manufacturer,
count(drug),
sum(cogs-total_sales)
FROM pharmacy_sales
where (total_sales-cogs)<0
group by manufacturer
order by sum desc;
