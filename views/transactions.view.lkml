# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: transactions {
#   hidden: yes
#     join: transactions__fee__amount {
#       view_label: "Transactions: Fee Amount"
#       sql: LEFT JOIN UNNEST(${transactions.fee__amount}) as transactions__fee__amount ;;
#       relationship: one_to_many
#     }
# }
view: transactions {
  sql_table_name: `public-data-finance.crypto_band.transactions` ;;

  dimension: block_height {
    type: number
    sql: ${TABLE}.block_height ;;
  }
  dimension: block_timestamp {
    type: string
    sql: ${TABLE}.block_timestamp ;;
  }
  dimension_group: block_timestamp_truncated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.block_timestamp_truncated ;;
  }
  dimension: fee__amount {
    hidden: yes
    sql: ${TABLE}.fee.amount ;;
    group_label: "Fee"
    group_item_label: "Amount"
  }
  dimension: fee__gas {
    type: number
    sql: ${TABLE}.fee.gas ;;
    group_label: "Fee"
    group_item_label: "Gas"
  }
  dimension: gas_used {
    type: number
    sql: ${TABLE}.gas_used ;;
  }
  dimension: gas_wanted {
    type: number
    sql: ${TABLE}.gas_wanted ;;
  }
  dimension: memo {
    type: string
    sql: ${TABLE}.memo ;;
  }
  dimension: sender {
    type: string
    sql: ${TABLE}.sender ;;
  }
  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }
  dimension: txhash {
    type: string
    sql: ${TABLE}.txhash ;;
  }
  measure: count {
    type: count
  }
}

view: transactions__fee__amount {

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: denom {
    type: string
    sql: ${TABLE}.denom ;;
  }
}
