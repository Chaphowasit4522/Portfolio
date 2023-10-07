--Which train has never been late and off route? (trains_that_have_never_been_late_or_off_route.sql)
--⚠️ HINT: ลองใช้ array_agg()
with

fct_movements as (

    select * from {{ ref('fct_movements') }}

)
,TrainStatus AS (
  SELECT
    train_id,
    ARRAY_AGG(variation_status) AS agg_status
  FROM
    fct_movements
  GROUP BY
    train_id
)

SELECT
  train_id
FROM
  TrainStatus
WHERE NOT "LATE" IN UNNEST(agg_status) AND NOT "OFF ROUTE" IN UNNEST(agg_status)

