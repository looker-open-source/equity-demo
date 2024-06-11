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
    #hidden: yes
    sql: ${TABLE}.market_caps.amount ;;
    group_label: "Market Caps"
    group_item_label: "Amount"
  }
  dimension: market_caps__epoch_time {
    #hidden: yes
    sql: ${TABLE}.market_caps.epoch_time ;;
    group_label: "Market Caps"
    group_item_label: "Epoch Time"
  }
  dimension: prices__amount {
   # hidden: yes
    sql: ${TABLE}.prices.amount ;;
    group_label: "Prices"
    group_item_label: "Amount"
  }
  dimension: prices__epoch_time {
    #hidden: yes
    sql: ${TABLE}.prices.epoch_time ;;
    group_label: "Prices"
    group_item_label: "Epoch Time"
  }
  dimension: total_volumes__amount {
   # hidden: yes
    sql: ${TABLE}.total_volumes.amount ;;
    group_label: "Total Volumes"
    group_item_label: "Amount"
  }
  dimension: total_volumes__epoch_time {
    #hidden: yes
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
 #   group_label: "Prices"
    type: number
    sql: coin_gecko_history__prices__amount ;;
  }
}

view: coin_gecko_history__prices__epoch_time {

  dimension: coin_gecko_history__prices__epoch_time {
    #hidden: yes
    type: string
    sql: coin_gecko_history__prices__epoch_time ;;
  }
}
 # dimension: coin_gecko_history_prices_date {
   # type: date
   # hidden: yes
    #group_label: "Prices"
    #sql: CAST(DATEADD(SECOND, ${coin_gecko_history__prices__epoch_time}/1000, '1970/1/1') AS DATE) ;;
   # sql: TIMESTAMP_MILLIS(${coin_gecko_history__prices__epoch_time}) ;;
  #}
  #dimension_group: price_date {
   # label: "Date"
   # type: time
    #timeframes: [date,week,month,year]
    #sql: CAST(${coin_gecko_history_prices_date} AS TIMESTAMP) ;;
  #}
#}

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
