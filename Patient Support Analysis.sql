 /*(Part 1)*/
with total_count as (
select policy_holder_id as call_count
FROM callers
group by policy_holder_id
having count(case_id) >= 3)

SELECT count(*) FROM
total_count 
