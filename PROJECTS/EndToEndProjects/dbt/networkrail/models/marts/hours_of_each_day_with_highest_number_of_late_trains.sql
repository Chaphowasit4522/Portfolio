with

fct_movements as (

    select * from {{ ref('fct_movements') }}

)

, Hour_T AS (
  SELECT
    DATE(actual_timestamp_utc) AS actual_date,
    EXTRACT(HOUR FROM actual_timestamp_utc) AS Hour_time
  FROM
    fct_movements
),
Group_Hour as (
  select actual_date , Hour_time, count(Hour_time) as count_hour  from Hour_T
group by actual_date , Hour_time
order by actual_date , count(Hour_time) desc
)

,RankedRows AS (
  SELECT
    actual_date,
    Hour_time,
    count_hour,
    ROW_NUMBER() OVER (PARTITION BY actual_date ORDER BY count_hour DESC) AS RowNum
  FROM
    Group_Hour
)
SELECT
  actual_date,
  Hour_time,
  count_hour
FROM
  RankedRows
WHERE
  RowNum = 1
order by actual_date


