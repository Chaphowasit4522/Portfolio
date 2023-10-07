--Which operating company has the highest number of on time trains in the last 3 days? 
with

fct_movements as (

    select * from {{ ref('fct_movements') }}

)

SELECT toc_id, COUNT(toc_id) AS record_count
FROM fct_movements
WHERE variation_status = "ON TIME"
and date(actual_timestamp_utc) >= (select distinct date(actual_timestamp_utc) 
from fct_movements 
order by 1 DESC 
limit 1 offset 2)
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
