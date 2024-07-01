include: blocks_base.view
view: bitcoin_cash_blocks {
    extends: [blocks_base]
    label: "Bitcoin Cash Blocks"
    sql_table_name: `bigquery-public-data.crypto_bitcoin_cash.blocks` ;;


    dimension: id {
      hidden: yes
      primary_key: no
      type: string
      sql: "bitcoin-cash" ;;
    }
    dimension: coin_id {
      primary_key: no
      type: string
      sql: ${id} ;;
      link: {
        label: "Filtered Coin Data by ID"
        url: "https://b772aff5-4b93-454c-9b34-147289eb2172.looker.app/dashboards/RZbF4ReRz00O3655QMLfG7?ID={{value}}"
        # url: "https://instance_name.looker.com/dashboards/694?State={{ _filters['users.state'] | url_encode }}&Date={{ _filters['orders.date'] | url_encode }}"
      }
    }
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
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

# view: crypto_bitcoin_cash_blocks {
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
# }
