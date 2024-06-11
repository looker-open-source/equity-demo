# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: coin_gecko_history {
  hidden: yes
    join: coin_gecko_history__prices__amount {
      #view_label: "Coin Gecko History: Prices Amount"
      sql: LEFT JOIN UNNEST(${coin_gecko_history.prices__amount}) as coin_gecko_history__prices__amount ;;
      relationship: one_to_many
    }
    join: coin_gecko_history__prices__epoch_time {
      #view_label: "Coin Gecko History: Prices Epoch Time"
      sql: LEFT JOIN UNNEST(${coin_gecko_history.prices__epoch_time}) as coin_gecko_history__prices__epoch_time ;;
      relationship: one_to_many
    }
    join: coin_gecko_history__market_caps__amount {
      #view_label: "Coin Gecko History: Market Caps Amount"
      sql: LEFT JOIN UNNEST(${coin_gecko_history.market_caps__amount}) as coin_gecko_history__market_caps__amount ;;
      relationship: one_to_many
    }
    join: coin_gecko_history__total_volumes__amount {
      #view_label: "Coin Gecko History: Total Volumes Amount"
      sql: LEFT JOIN UNNEST(${coin_gecko_history.total_volumes__amount}) as coin_gecko_history__total_volumes__amount ;;
      relationship: one_to_many
    }
    join: coin_gecko_history__market_caps__epoch_time {
      #view_label: "Coin Gecko History: Market Caps Epoch Time"
      sql: LEFT JOIN UNNEST(${coin_gecko_history.market_caps__epoch_time}) as coin_gecko_history__market_caps__epoch_time ;;
      relationship: one_to_many
    }
    join: coin_gecko_history__total_volumes__epoch_time {
      #view_label: "Coin Gecko History: Total Volumes Epoch Time"
      sql: LEFT JOIN UNNEST(${coin_gecko_history.total_volumes__epoch_time}) as coin_gecko_history__total_volumes__epoch_time ;;
      relationship: one_to_many
    }
}
view: coin_gecko_history {
  sql_table_name: `kirby-looker-core-argolis.crypto_mvp.coin_gecko_history` ;;
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

view: coin_gecko_history__prices__amount {

  dimension: coin_gecko_history__prices__amount {
    type: number
    sql: coin_gecko_history__prices__amount ;;
  }
}

view: coin_gecko_history__prices__epoch_time {

  dimension: coin_gecko_history__prices__epoch_time {
    type: number
    sql: coin_gecko_history__prices__epoch_time ;;
  }
}

view: coin_gecko_history__market_caps__amount {

  dimension: coin_gecko_history__market_caps__amount {
    type: number
    sql: coin_gecko_history__market_caps__amount ;;
  }
}

view: coin_gecko_history__total_volumes__amount {

  dimension: coin_gecko_history__total_volumes__amount {
    type: number
    sql: coin_gecko_history__total_volumes__amount ;;
  }
}

view: coin_gecko_history__market_caps__epoch_time {

  dimension: coin_gecko_history__market_caps__epoch_time {
    type: number
    sql: coin_gecko_history__market_caps__epoch_time ;;
  }
}

view: coin_gecko_history__total_volumes__epoch_time {

  dimension: coin_gecko_history__total_volumes__epoch_time {
    type: number
    sql: coin_gecko_history__total_volumes__epoch_time ;;
  }
}
