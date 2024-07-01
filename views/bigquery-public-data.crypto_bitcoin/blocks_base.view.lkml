view: blocks_base {
  extension: required

# dimension: bits {
  #   type: string
  #   description: "Difficulty threshold specified in block header"
  #   sql: ${TABLE}.bits ;;
  # }
  # dimension: coinbase_param {
  #   type: string
  #   description: "Data specified in the coinbase transaction of this block"
  #   sql: ${TABLE}.coinbase_param ;;
  # }
  dimension: hash {
    primary_key: yes
    type: string
    description: "Hash of this block"
    sql: ${TABLE}.`hash` ;;
  }
  #commenting out dimensions I don't think I'll need
  # dimension: merkle_root {
  #   type: string
  #   description: "The root node of a Merkle tree, where leaves are transaction hashes"
  #   sql: ${TABLE}.merkle_root ;;
  # }
  # dimension: nonce {
  #   type: string
  #   description: "Difficulty solution specified in block header"
  #   sql: ${TABLE}.nonce ;;
  # }
  dimension: number {
    type: number
    description: "The number of the block"
    sql: ${TABLE}.number ;;
  }
  dimension: size {
    type: number
    description: "The size of block data in bytes"
    sql: ${TABLE}.size ;;
  }
  dimension: stripped_size {
    type: number
    description: "The size of block data in bytes excluding witness data"
    sql: ${TABLE}.stripped_size ;;
  }
  dimension_group: timestamp {
    type: time
    description: "Block creation timestamp specified in block header"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  dimension: transaction_count {
    type: number
    description: "Number of transactions included in this block"
    sql: ${TABLE}.transaction_count ;;
  }
  measure: avg_transaction_count {
    type: average
    label: "Average Transaction Count"
    sql: ${transaction_count} ;;
  }
  dimension: version {
    type: number
    description: "Protocol version specified in block header"
    sql: ${TABLE}.version ;;
  }
  dimension: weight {
    type: number
    description: "Three times the base size plus the total size. https://github.com/bitcoin/bips/blob/master/bip-0141.mediawiki"
    sql: ${TABLE}.weight ;;
  }
  measure: count {
    type: count
    drill_fields: [hash, transaction_count, weight, size, stripped_size]
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

# view: blocks_base {
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
