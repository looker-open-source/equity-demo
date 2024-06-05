# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: crypto_history {
  hidden: yes
    join: crypto_history__prices__amount {
      view_label: "Crypto History: Prices Amount"
      sql: LEFT JOIN UNNEST(${crypto_history.prices__amount}) as crypto_history__prices__amount ;;
      relationship: one_to_many
    }
    join: crypto_history__prices__epoch_time {
      view_label: "Crypto History: Prices Epoch Time"
      sql: LEFT JOIN UNNEST(${crypto_history.prices__epoch_time}) as crypto_history__prices__epoch_time ;;
      relationship: one_to_many
    }
    join: crypto_history__market_caps__amount {
      view_label: "Crypto History: Market Caps Amount"
      sql: LEFT JOIN UNNEST(${crypto_history.market_caps__amount}) as crypto_history__market_caps__amount ;;
      relationship: one_to_many
    }
    join: crypto_history__total_volumes__amount {
      view_label: "Crypto History: Total Volumes Amount"
      sql: LEFT JOIN UNNEST(${crypto_history.total_volumes__amount}) as crypto_history__total_volumes__amount ;;
      relationship: one_to_many
    }
    join: crypto_history__market_caps__epoch_time {
      view_label: "Crypto History: Market Caps Epoch Time"
      sql: LEFT JOIN UNNEST(${crypto_history.market_caps__epoch_time}) as crypto_history__market_caps__epoch_time ;;
      relationship: one_to_many
    }
    join: crypto_history__total_volumes__epoch_time {
      view_label: "Crypto History: Total Volumes Epoch Time"
      sql: LEFT JOIN UNNEST(${crypto_history.total_volumes__epoch_time}) as crypto_history__total_volumes__epoch_time ;;
      relationship: one_to_many
    }
}
view: crypto_history {
  sql_table_name: `kirby-looker-core-argolis.crypto_mvp.crypto_history` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    description: "coin id"
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

view: crypto_history__prices__amount {

  dimension: crypto_history__prices__amount {
    type: number
    sql: crypto_history__prices__amount ;;
  }
}

view: crypto_history__prices__epoch_time {

  dimension: crypto_history__prices__epoch_time {
    type: number
    sql: crypto_history__prices__epoch_time ;;
  }
}

view: crypto_history__market_caps__amount {

  dimension: crypto_history__market_caps__amount {
    type: number
    sql: crypto_history__market_caps__amount ;;
  }
}

view: crypto_history__total_volumes__amount {

  dimension: crypto_history__total_volumes__amount {
    type: number
    sql: crypto_history__total_volumes__amount ;;
  }
}

view: crypto_history__market_caps__epoch_time {

  dimension: crypto_history__market_caps__epoch_time {
    type: number
    sql: crypto_history__market_caps__epoch_time ;;
  }
}

view: crypto_history__total_volumes__epoch_time {

  dimension: crypto_history__total_volumes__epoch_time {
    type: number
    sql: crypto_history__total_volumes__epoch_time ;;
  }
}
