view: history_pdt {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  #
  derived_table: {
    sql:SELECT
    id
    ,prices_amount
    ,prices_epoch_time
    ,market_caps_amount
    ,market_caps_epoch_time
    ,total_volumes_amount
    ,total_volumes_epoch_time
    FROM `kirby-looker-core-argolis.crypto_mvp.coin_gecko_history`
    LEFT JOIN UNNEST(prices.amount) as prices_amount
    LEFT JOIN UNNEST(prices.epoch_time) as prices_epoch_time
    LEFT JOIN UNNEST(market_caps.amount) as market_caps_amount
    LEFT JOIN UNNEST(market_caps.epoch_time) as market_caps_epoch_time
    LEFT JOIN UNNEST(total_volumes.amount) as total_volumes_amount
    LEFT JOIN UNNEST(total_volumes.epoch_time) as total_volumes_epoch_time ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    description: "Coin ID"
    sql: ${TABLE}.id ;;
  }

  dimension: price {
    group_label: "Prices"
    type: number
    description: "Price"
    sql: ${TABLE}.prices_amount ;;
  }
  dimension: market_cap {
    group_label: "Market Cap"
    type: number
    description: "Market Cap"
    sql: ${TABLE}.market_cap_amount ;;
  }
# view: history_pdt {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
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
 }
