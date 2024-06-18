# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: history {
#   hidden: yes
#     join: history__prices__amount {
#       view_label: "History: Prices Amount"
#       sql: LEFT JOIN UNNEST(${history.prices__amount}) as history__prices__amount ;;
#       relationship: one_to_many
#     }
#     join: history__prices__epoch_time {
#       view_label: "History: Prices Epoch Time"
#       sql: LEFT JOIN UNNEST(${history.prices__epoch_time}) as history__prices__epoch_time ;;
#       relationship: one_to_many
#     }
#     join: history__market_caps__amount {
#       view_label: "History: Market Caps Amount"
#       sql: LEFT JOIN UNNEST(${history.market_caps__amount}) as history__market_caps__amount ;;
#       relationship: one_to_many
#     }
#     join: history__total_volumes__amount {
#       view_label: "History: Total Volumes Amount"
#       sql: LEFT JOIN UNNEST(${history.total_volumes__amount}) as history__total_volumes__amount ;;
#       relationship: one_to_many
#     }
#     join: history__market_caps__epoch_time {
#       view_label: "History: Market Caps Epoch Time"
#       sql: LEFT JOIN UNNEST(${history.market_caps__epoch_time}) as history__market_caps__epoch_time ;;
#       relationship: one_to_many
#     }
#     join: history__total_volumes__epoch_time {
#       view_label: "History: Total Volumes Epoch Time"
#       sql: LEFT JOIN UNNEST(${history.total_volumes__epoch_time}) as history__total_volumes__epoch_time ;;
#       relationship: one_to_many
#     }
# }
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

view: history__prices__amount {

  dimension: history__prices__amount {
    type: number
    sql: history__prices__amount ;;
  }
}

view: history__prices__epoch_time {

  dimension: history__prices__epoch_time {
    type: number
    sql: history__prices__epoch_time ;;
  }
}

view: history__market_caps__amount {

  dimension: history__market_caps__amount {
    type: number
    sql: history__market_caps__amount ;;
  }
}

view: history__total_volumes__amount {

  dimension: history__total_volumes__amount {
    type: number
    sql: history__total_volumes__amount ;;
  }
}

view: history__market_caps__epoch_time {

  dimension: history__market_caps__epoch_time {
    type: number
    sql: history__market_caps__epoch_time ;;
  }
}

view: history__total_volumes__epoch_time {

  dimension: history__total_volumes__epoch_time {
    type: number
    sql: history__total_volumes__epoch_time ;;
  }
}
