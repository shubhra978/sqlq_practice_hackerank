select
(
  case
  when category = 'Electronics' then 'Tech Devices'
  when category = 'Furniture' then 'Workspace'
  end
) as renamed_category,
count(distinct product) as unique_products,
round(sum(total),2) as total_revenue,
round(avg(price),2) as avg_price,
round(100.0 * count (case when status  = 'completed' then 1 end)
      /count(status),1) as completion_rate 
from
orders
group by renamed_category
