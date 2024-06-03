view: market_data {
  sql_table_name: `kirby-looker-core-argolis.crypto_mvp.market_data` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    description: "coin id"
    sql: ${TABLE}.id ;;
  }
  dimension: ath {
    type: number
    description: "all-time high"
    sql: ${TABLE}.ath ;;
  }
  dimension: ath_change_percentage {
    type: number
    description: "the drop in percents of the price of a cryptocurrency compared to its maximum price (ATH) of all time"
    sql: ${TABLE}.ath_change_percentage ;;
  }
  dimension: ath_date {
    type: string
    description: "date of all-time high"
    sql: ${TABLE}.ath_date ;;
  }
  dimension: atl {
    type: number
    description: "all-time low"
    sql: ${TABLE}.atl ;;
  }
  dimension: atl_change_percentage {
    type: number
    description: "the rise in percents of the price of a cryptocurrency compared to its minimum price (ATL) of all time"
    sql: ${TABLE}.atl_change_percentage ;;
  }
  dimension: atl_date {
    type: string
    description: "date of all-time low"
    sql: ${TABLE}.atl_date ;;
  }
  dimension: circulating_supply {
    type: number
    sql: ${TABLE}.circulating_supply ;;
  }
  dimension: current_price {
    type: number
    description: "current price"
    sql: ${TABLE}.current_price ;;
  }
  dimension: fully_diluted_valuation {
    type: number
    description: "fully dilated valuation"
    sql: ${TABLE}.fully_diluted_valuation ;;
  }
  dimension: high_24h {
    type: number
    sql: ${TABLE}.high_24h ;;
  }
  dimension: image {
    type: string
    description: "URI for image"
    sql: ${TABLE}.image ;;
  }
  dimension: last_updated {
    type: string
    sql: ${TABLE}.last_updated ;;
  }
  dimension: low_24h {
    type: number
    sql: ${TABLE}.low_24h ;;
  }
  dimension: market_cap {
    type: number
    description: "market cap"
    sql: ${TABLE}.market_cap ;;
  }
  dimension: market_cap_change_24h {
    type: number
    sql: ${TABLE}.market_cap_change_24h ;;
  }
  dimension: market_cap_change_percentage_24h {
    type: number
    sql: ${TABLE}.market_cap_change_percentage_24h ;;
  }
  dimension: market_cap_rank {
    type: number
    description: "market cap rank"
    sql: ${TABLE}.market_cap_rank ;;
  }
  dimension: max_supply {
    type: number
    sql: ${TABLE}.max_supply ;;
  }
  dimension: name {
    type: string
    description: "coin name"
    sql: ${TABLE}.name ;;
  }
  dimension: price_change_24h {
    type: string
    sql: ${TABLE}.price_change_24h ;;
  }
  dimension: price_change_percentage_1h_in_currency {
    type: string
    sql: ${TABLE}.price_change_percentage_1h_in_currency ;;
  }
  dimension: price_change_percentage_24h {
    type: number
    sql: ${TABLE}.price_change_percentage_24h ;;
  }
  dimension: price_change_percentage_24h_in_currency {
    type: string
    sql: ${TABLE}.price_change_percentage_24h_in_currency ;;
  }
  dimension: price_change_percentage_7d_in_currency {
    type: string
    sql: ${TABLE}.price_change_percentage_7d_in_currency ;;
  }
  dimension: symbol {
    type: string
    description: "coin symbol"
    sql: ${TABLE}.symbol ;;
  }
  dimension: total_supply {
    type: number
    sql: ${TABLE}.total_supply ;;
  }
  dimension: total_volume {
    type: number
    sql: ${TABLE}.total_volume ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
