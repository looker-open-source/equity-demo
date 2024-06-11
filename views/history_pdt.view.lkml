view: history_pdt {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  #
  derived_table: {
    sql: SELECT
    id
    FROM `kirby-looker-core-argolis.crypto_mvp.coin_gecko_history`
    LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.coin_gecko_history.prices.amount`)
    LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.coin_gecko_history.prices.epoch_time`)
    LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.coin_gecko_history.market_caps.amount`)
    LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.coin_gecko_history.market_caps.epoch_time`)
    LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.coin_gecko_history.total_volumes.amount`)
    LEFT JOIN UNNEST(`kirby-looker-core-argolis.crypto_mvp.coin_gecko_history.total_volumes.price`);;
  }

  dimension: id {
    type: string
    description: "Coin ID"
    sql: ${TABLE}.id ;;
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
