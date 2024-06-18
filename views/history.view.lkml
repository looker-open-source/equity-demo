
view: history {
  sql_table_name: `kirby-looker-core-argolis.crypto_mvp.history` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: market_caps__amount {
    hidden: yes
    sql: ${TABLE}.market_caps.amount ;;
    group_label: "Market Caps"
    group_item_label: "Amount"
  }
  dimension: market_caps__epoch_time {
    hidden: yes
    sql: ${TABLE}.market_caps.epoch_time ;;
    group_label: "Market Caps"
    group_item_label: "Epoch Time"
  }
  dimension: prices__amount {
    hidden: yes
    sql: ${TABLE}.prices.amount ;;
    group_label: "Prices"
    group_item_label: "Amount"
  }
  dimension: prices__epoch_time {
    hidden: yes
    sql: ${TABLE}.prices.epoch_time ;;
    group_label: "Prices"
    group_item_label: "Epoch Time"
  }
  dimension: total_volumes__amount {
    hidden: yes
    sql: ${TABLE}.total_volumes.amount ;;
    group_label: "Total Volumes"
    group_item_label: "Amount"
  }
  dimension: total_volumes__epoch_time {
    hidden: yes
    sql: ${TABLE}.total_volumes.epoch_time ;;
    group_label: "Total Volumes"
    group_item_label: "Epoch Time"
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}

view: prices {

  dimension: price {
    type: number
    value_format: "$#,##0.00"
    sql: price ;;
  }
}

view: epoch_time {
  view_label: "Date Information"

  dimension: epoch_time {
    hidden: yes
    type: string
    sql: epoch_time ;;
  }
  dimension: date  {
    hidden: yes
    type: date
    sql:  DATE(TIMESTAMP_MILLIS(${epoch_time}));;
  }
  dimension_group: Timeframes {
    type: time
    timeframes: [date, week, month, quarter, year]
    sql: CAST(${date} AS TIMESTAMP) ;;
  }
}

view: market_caps {

  dimension: market_cap {
    type: number
    value_format: "$#,##0.00"
    sql: market_cap ;;
  }
}

view: total_volumes {

  dimension: total_volume {
    type: number
    value_format: "$#,##0.00"
    sql: total_volume ;;
  }
}

# view: history__market_caps__epoch_time {

#   dimension: history__market_caps__epoch_time {
#     hidden: yes
#     type: string
#     sql: history__market_caps__epoch_time ;;
#   }
#   dimension: date  {
#     hidden: yes
#     type: date
#     sql:  DATE(TIMESTAMP_MILLIS(${history__market_caps__epoch_time}));;
#   }
#   dimension_group: Timeframes {
#     type: time
#     timeframes: [date, week, month, quarter, year]
#     sql: CAST(${date} AS TIMESTAMP) ;;
#   }
# }

# view: history__total_volumes__epoch_time {

#   dimension: history__total_volumes__epoch_time {
#     hidden: yes
#     type: string
#     sql: history__total_volumes__epoch_time ;;
#   }
#   dimension: date  {
#     hidden: yes
#     type: date
#     sql:  DATE(TIMESTAMP_MILLIS(${history__total_volumes__epoch_time}));;
#   }
#   dimension_group: Timeframes {
#     type: time
#     timeframes: [date, week, month, quarter, year]
#     sql: CAST(${date} AS TIMESTAMP) ;;
#   }
# }
