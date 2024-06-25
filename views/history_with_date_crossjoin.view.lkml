view: history_with_date_crossjoin {
  derived_table: {
    datagroup_trigger: history
    sql: with date_cte as
(SELECT day
FROM UNNEST(
    GENERATE_DATE_ARRAY(DATE('2023-06-19'), DATE('2026-06-21'), INTERVAL 1 DAY)
) AS day )
,

date_and_id_cte as (
SELECT
id
,day
FROM `kirby-looker-core-argolis.crypto_mvp.history`
CROSS JOIN date_cte
)
,
price_date_unnested as (
  SELECT
  id
  ,DATE(TIMESTAMP_MILLIS(prices_epoch_time)) AS price_date
  ,prices_epoch_offset
  FROM
  `kirby-looker-core-argolis.crypto_mvp.history`
  LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.history`.prices.epoch_time) as prices_epoch_time WITH OFFSET as prices_epoch_offset
)
,
price_amount_unnested as (
  SELECT
  id
  ,prices_amount
  ,prices_amount_offset
   FROM
  `kirby-looker-core-argolis.crypto_mvp.history`
  LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.history`.prices.amount) as prices_amount WITH OFFSET as prices_amount_offset

)
,
market_cap_amount_unnested as (
  SELECT
  id
  ,market_caps_amount
  ,market_caps_amount_offset
  FROM
  `kirby-looker-core-argolis.crypto_mvp.history`
  LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.history`.market_caps.amount) as market_caps_amount WITH OFFSET as market_caps_amount_offset
)
,
total_volumes_amount_unnested as (
  SELECT
  id
  ,total_volumes_amount
  ,total_volumes_amount_offset
  FROM
  `kirby-looker-core-argolis.crypto_mvp.history`
  LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.history`.total_volumes.amount) as total_volumes_amount WITH OFFSET as total_volumes_amount_offset
)

SELECT
date_and_id_cte.id
,date_and_id_cte.day
,price_date_unnested.price_date
,price_date_unnested.prices_epoch_offset
,price_amount_unnested.prices_amount
,price_amount_unnested.prices_amount_offset
,market_cap_amount_unnested.market_caps_amount
,market_cap_amount_unnested.market_caps_amount_offset
,total_volumes_amount_unnested.total_volumes_amount
,total_volumes_amount_unnested.total_volumes_amount_offset
FROM date_and_id_cte
INNER JOIN price_date_unnested
ON date_and_id_cte.id = price_date_unnested.id AND date_and_id_cte.day = price_date_unnested.price_date
INNER JOIN price_amount_unnested
ON date_and_id_cte.id = price_amount_unnested.id AND price_date_unnested.prices_epoch_offset = price_amount_unnested.prices_amount_offset
INNER JOIN market_cap_amount_unnested
ON date_and_id_cte.id = market_cap_amount_unnested.id AND price_amount_unnested.prices_amount_offset = market_cap_amount_unnested.market_caps_amount_offset
INNER JOIN total_volumes_amount_unnested
ON date_and_id_cte.id = total_volumes_amount_unnested.id AND market_cap_amount_unnested.market_caps_amount_offset = total_volumes_amount_unnested.total_volumes_amount_offset
;;
}
  dimension: coin_id {
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: date {
    hidden: yes
    type: date
    sql: ${TABLE}.day ;;
  }
  dimension_group: dates{
    type: time
    intervals: [day, week, month, quarter, year]
    sql: ${date} ;;
  }
  dimension: price_date {
    hidden: yes
    type: date
    sql: ${TABLE}.price_date ;;
  }
  dimension: prices_epoch_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.prices_epoch_offset ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}.prices_amount ;;
  }
  dimension: price_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.prices_amount_offset ;;
  }
  dimension: market_cap {
    type: number
    sql: ${TABLE}.market_caps_amount ;;
  }
  dimension: market_cap_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.market_caps_amount_offset ;;
  }
  dimension: total_volume {
    type: number
    sql: ${TABLE}.total_volumes_amount ;;
  }
  dimension: total_volume_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.total_volumes_amount_offset ;;
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
