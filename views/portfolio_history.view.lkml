view: portfolio_history {
  derived_table: {
    sql:with date_cte as
(SELECT day
FROM UNNEST(
    GENERATE_DATE_ARRAY(DATE('2023-06-18'), DATE('2026-06-21'), INTERVAL 1 DAY)
) AS day )
,

date_and_id_cte as (
SELECT
id
,day
FROM `@{database}.crypto_mvp.history`
CROSS JOIN date_cte
)
,
price_date_unnested as (
  SELECT
  id
  ,DATE(TIMESTAMP_MILLIS(prices_epoch_time)) AS price_date
  ,prices_epoch_offset
  FROM
  `@{database}.crypto_mvp.history`
  LEFT JOIN UNNEST(`@{database}.crypto_mvp.history`.prices.epoch_time) as prices_epoch_time WITH OFFSET as prices_epoch_offset
)
,
price_amount_unnested as (
  SELECT
  id
  ,prices_amount
  ,prices_amount_offset
   FROM
  `@{database}.crypto_mvp.history`
  LEFT JOIN UNNEST(`@{database}.crypto_mvp.history`.prices.amount) as prices_amount WITH OFFSET as prices_amount_offset

)
,
crypto_history as (

SELECT
date_and_id_cte.id as id
,date_and_id_cte.day as day
,price_date_unnested.price_date as date
,price_date_unnested.prices_epoch_offset as date_offset
,price_amount_unnested.prices_amount as price
,price_amount_unnested.prices_amount_offset as price_offset
,"Crypto Currency" as investment_type
,(FLOOR(RAND()*(10-5+1)+5)) as amount

FROM date_and_id_cte
INNER JOIN price_date_unnested
ON date_and_id_cte.id = price_date_unnested.id AND date_and_id_cte.day = price_date_unnested.price_date
INNER JOIN price_amount_unnested
ON date_and_id_cte.id = price_amount_unnested.id AND price_date_unnested.prices_epoch_offset = price_amount_unnested.prices_amount_offset
)

,

stock_date_cte as
(SELECT day
FROM UNNEST(
GENERATE_DATE_ARRAY(DATE('2023-06-18'), DATE('2025-06-21'), INTERVAL 1 DAY)
) AS day )
,

stock_date_and_id_cte as (
SELECT
distinct day
,id
FROM `@{database}.crypto_mvp.stock_history`
CROSS JOIN stock_date_cte
)
,
date_unnested as (
SELECT
id
,DATE(TIMESTAMP(history_date)) AS history_date
,date_offset
FROM
`@{database}.crypto_mvp.stock_history`
LEFT JOIN UNNEST(`@{database}.crypto_mvp.stock_history`.`Date`) as history_date WITH OFFSET as date_offset
)
,
close_unnested as (
  SELECT
  id
  ,CAST(close AS NUMERIC) AS close
  ,close_offset
  FROM
  `@{database}.crypto_mvp.stock_history`
  LEFT JOIN UNNEST(`@{database}.crypto_mvp.stock_history`.`Close`) as close WITH OFFSET as close_offset
)
,
stock_history_set as (
SELECT

stock_date_and_id_cte.id as id
,stock_date_and_id_cte.day as day
,date_unnested.history_date as date
,date_unnested.date_offset as date_offset
,close_unnested.close as price
,close_unnested.close_offset as price_offset
,"Equity" as investment_type
,(FLOOR(RAND()*(100-5+1)+5)) as amount


FROM

stock_date_and_id_cte
INNER JOIN date_unnested
ON stock_date_and_id_cte.day = date_unnested.history_date AND stock_date_and_id_cte.id = date_unnested.id

INNER JOIN close_unnested
ON stock_date_and_id_cte.id = close_unnested.id AND date_unnested.date_offset = close_unnested.close_offset
)
,
stock_join_cte as(
  select
  id
  ,CURRENT_DATE() as day
  ,CURRENT_DATE() as date
  , 252 as date_offset
  ,CAST(currentPrice as NUMERIC) as price
  ,252 as price_offset
  ,"Equity" as investment_type
,(FLOOR(RAND()*(100-5+1)+5)) as amount
  FROM `kirby-looker-core-argolis.crypto_mvp.stock_info`
  UNION ALL
  SELECT * FROM stock_history_set
)

select
*
FROM crypto_history
UNION ALL
SELECT
*
FROM stock_join_cte
       ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension_group: history_date {
    type: time
    timeframes: [date, week, month, year]
    datatype: date
    sql: ${TABLE}.day;;
  }
  dimension: date_offset {
    type: number
    hidden: yes
    sql: ${TABLE}.date_offset ;;
  }
  dimension: price {
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: CAST(${TABLE}.price as FLOAT64) ;;
  }
  dimension: price_offset {
    type: number
    hidden: yes
    sql: ${TABLE}.price_offset ;;
  }
  dimension: investment_type {
    type: string
    sql: ${TABLE}.investment_type ;;
  }
  dimension: amount {
    label: "Quantity"
    description: "Amount of shares/coins currently within the portfolio"
    type: number
    value_format: "0.00"
    sql: CAST(${TABLE}.amount as FLOAT64) ;;
  }
  dimension: value {
    label: "Available Value"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: (${price}*${amount}) ;;
  }
  measure:  total_value{
    label: "Total Investment Value"
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${value} ;;
    drill_fields: [id,investment_type,amount,value]
  }
  measure: total_quantity {
    type: sum
    value_format: "0.00"
    sql: ${amount} ;;
    drill_fields: [id,investment_type,amount,value]
  }
}
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
