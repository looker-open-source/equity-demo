view: transactions_base {
  extension: required

  dimension: block_hash {
    type: string
    description: "Hash of the block which contains this transaction"
    sql: ${TABLE}.block_hash ;;
  }
  dimension: block_number {
    type: number
    description: "Number of the block which contains this transaction"
    sql: ${TABLE}.block_number ;;
  }
  dimension_group: block_timestamp {
    type: time
    description: "Timestamp of the block which contains this transaction"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.block_timestamp ;;
  }
  dimension: fee {
    type: number
    description: "The fee paid by this transaction"
    sql: ${TABLE}.fee ;;
  }
  measure: avg_fee {
    type: average
    label: "Average Fee"
    description: "Average fee"
    sql: ${fee} ;;
  }
  measure: total_fee {
    type: sum
    label: "Total Fee"
    description: "Total Fees"
    sql:${fee}  ;;
  }
  dimension: hash {
    primary_key: yes
    type: string
    description: "The hash of this transaction"
    sql: ${TABLE}.`hash` ;;
  }
  dimension: input_count {
    type: number
    description: "The number of inputs in the transaction"
    sql: ${TABLE}.input_count ;;
  }
  dimension: input_value {
    type: number
    description: "Total value of inputs in the transaction"
    sql: ${TABLE}.input_value ;;
  }
  measure: avg_input_value {
    type: average
    label: "Average Input Value"
    description: "Average Input Value"
    sql: ${input_value} ;;
  }
  dimension: inputs {
    hidden: yes
    sql: ${TABLE}.inputs ;;
  }
  #commenting out dimensions I'm not sure I'll use to remove clutter
  # dimension: is_coinbase {
  #   type: yesno
  #   description: "true if this transaction is a coinbase transaction"
  #   sql: ${TABLE}.is_coinbase ;;
  # }
  # dimension: lock_time {
  #   type: number
  #   description: "Earliest time that miners can include the transaction in their hashing of the Merkle root to attach it in the latest block of the blockchain"
  #   sql: ${TABLE}.lock_time ;;
  # }
  dimension: output_count {
    type: number
    description: "The number of outputs in the transaction"
    sql: ${TABLE}.output_count ;;
  }
  dimension: output_value {
    type: number
    description: "Total value of outputs in the transaction"
    sql: ${TABLE}.output_value ;;
  }
  measure: avg_output_value {
    type: average
    label: "Average Output Value"
    description: "Average output value"
    sql: ${output_value} ;;
  }
  dimension: outputs {
    hidden: yes
    sql: ${TABLE}.outputs ;;
  }
  dimension: size {
    type: number
    description: "The size of this transaction in bytes"
    sql: ${TABLE}.size ;;
  }
  # dimension: version {
  #   type: number
  #   description: "Protocol version specified in block which contained this transaction"
  #   sql: ${TABLE}.version ;;
  # }
  dimension: virtual_size {
    type: number
    description: "The virtual transaction size (differs from size for witness transactions)"
    sql: ${TABLE}.virtual_size ;;
  }
  measure: count {
    type: count
    drill_fields: [block_hash, block_number, size, virtual_size, hash, output_count, output_value, input_count, input_value, fee]
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

# view: transactions_base {
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
