--Which train has the highest number of off route records? 
with

fct_movements as (

    select * from {{ ref('fct_movements') }}

)

SELECT train_id  , count(train_id) as record_count from fct_movements
where variation_status = "OFF ROUTE"
group by 1
order by 2 desc
limit 1
