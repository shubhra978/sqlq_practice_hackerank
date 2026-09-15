 /*part 1 */
WITH profit_of_goods as (
SELECT
drug,(total_sales-cogs) as total_profit
from pharmacy_sales 
order by (total_sales-cogs) DESC
limit 3)

SELECT * from profit_of_goods


 /*part 2 */
with loss_details as(SELECT manufacturer,
drug,
(cogs-total_sales) as total_loss
FROM pharmacy_sales
where cogs > total_sales
)

select manufacturer,count(drug), sum(total_loss) from loss_details
group by manufacturer
order by sum(total_loss) desc

/*part 3 */
SELECT 
manufacturer,
concat('$',round(sum(total_sales)/1000000),' million')as sale
FROM pharmacy_sales
group by manufacturer
order by sum(total_sales) desc
;
