view: stock_history_with_date_crossjoin {
  derived_table: {
    datagroup_trigger: history
    sql: with date_cte as
    (SELECT day
    FROM UNNEST(
    GENERATE_DATE_ARRAY(DATE('2023-06-18'), DATE('2025-06-21'), INTERVAL 1 DAY)
    ) AS day )
    ,
    date_and_id_cte as (
    SELECT
    distinct day
    ,id
    FROM `kirby-looker-core-argolis.crypto_mvp.stock_history`
    CROSS JOIN date_cte
    )
    ,
    date_unnested as (
  SELECT
  id
  ,DATE(TIMESTAMP(history_date)) AS history_date
  ,date_offset
  FROM
  `kirby-looker-core-argolis.crypto_mvp.stock_history`
  LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.stock_history`.`Date`) as history_date WITH OFFSET as date_offset
)
,
open_unnested as (
  SELECT
  id
  , CAST(open AS NUMERIC) AS open
  ,open_offset
  FROM
  `kirby-looker-core-argolis.crypto_mvp.stock_history`
  LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.stock_history`.`Open`) as open WITH OFFSET as open_offset
)
,
high_unnested as(
SELECT
  id
  ,CAST(high AS NUMERIC) AS high
  ,high_offset
  FROM
  `kirby-looker-core-argolis.crypto_mvp.stock_history`
  LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.stock_history`.`High`) as high WITH OFFSET as high_offset
)
,
low_unnested as (
SELECT
  id
  ,CAST(low as NUMERIC) AS low
  ,low_offset
  FROM
  `kirby-looker-core-argolis.crypto_mvp.stock_history`
  LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.stock_history`.`Low`) as low WITH OFFSET as low_offset
)
,
close_unnested as (
  SELECT
  id
  ,CAST(close AS NUMERIC) AS close
  ,close_offset
  FROM
  `kirby-looker-core-argolis.crypto_mvp.stock_history`
  LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.stock_history`.`Close`) as close WITH OFFSET as close_offset
)
,
volume_unnested as (
  SELECT
  id
  ,CAST(volume AS INTEGER) AS volume
  ,volume_offset
  FROM
  `kirby-looker-core-argolis.crypto_mvp.stock_history`
  LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.stock_history`.`Volume`) as volume WITH OFFSET as volume_offset
)

SELECT

date_and_id_cte.id
,date_and_id_cte.day
# ,date_unnested.id
,date_unnested.history_date
,date_unnested.date_offset
,open_unnested.open
,open_unnested.open_offset
,high_unnested.high
,high_unnested.high_offset
,low_unnested.low
,low_unnested.low_offset
,close_unnested.close
,close_unnested.close_offset
,volume_unnested.volume
,volume_unnested.volume_offset

FROM
-- date_cte
date_and_id_cte
INNER JOIN date_unnested
ON date_and_id_cte.day = date_unnested.history_date AND date_and_id_cte.id = date_unnested.id
INNER JOIN open_unnested
ON date_and_id_cte.id = open_unnested.id AND date_unnested.date_offset = open_unnested.open_offset
INNER JOIN high_unnested
ON date_and_id_cte.id = high_unnested.id AND date_unnested.date_offset = high_unnested.high_offset
INNER JOIN low_unnested
ON date_and_id_cte.id = low_unnested.id AND date_unnested.date_offset = low_unnested.low_offset
INNER JOIN close_unnested
ON date_and_id_cte.id = close_unnested.id AND date_unnested.date_offset = close_unnested.close_offset
INNER JOIN volume_unnested
ON date_and_id_cte.id = volume_unnested.id AND date_unnested.date_offset = volume_unnested.volume_offset ;;
}
  dimension: id {
    description: "Equity ID"
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension_group: history_date {
    type: time
    timeframes: [date, week, month, year]
    datatype: date
    sql: ${TABLE}.day;;
  }
#     ,
# #       ,
# #   # # You can specify the table name if it's different from the view name:
# #   # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}
