view: market_data {
  sql_table_name: `kirby-looker-core-argolis.crypto_mvp.market_data` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    description: "Coin id"
    sql: ${TABLE}.id ;;
  }
  dimension: ath {
    label: "All-time High"
    type: number
    description: "All-time high"
    sql: ${TABLE}.ath ;;
  }
  dimension: ath_change_percentage {
    label: "All-time High Change Percentage"
    type: number
    description: "The drop in percents of the price of a cryptocurrency compared to its maximum price (ATH) of all time"
    sql: ${TABLE}.ath_change_percentage ;;
  }
  dimension: ath_date {
    label: "All-time High Date"
    type: string
    description: "Date of all-time high"
    sql: ${TABLE}.ath_date ;;
  }
  dimension: atl {
    label: "All-time Low"
    type: number
    description: "All-time low"
    sql: ${TABLE}.atl ;;
  }
  dimension: atl_change_percentage {
    label: "All-time Low Change Percentage"
    type: number
    description: "The rise in percents of the price of a cryptocurrency compared to its minimum price (ATL) of all time"
    sql: ${TABLE}.atl_change_percentage ;;
  }
  dimension: atl_date {
    label: "All-time Low Date"
    type: string
    description: "Date of all-time low"
    sql: ${TABLE}.atl_date ;;
  }
  dimension: circulating_supply {
    type: number
    sql: ${TABLE}.circulating_supply ;;
  }
  dimension: current_price {
    type: number
    description: "Current price"
    sql: ${TABLE}.current_price ;;
  }
  dimension: fully_diluted_valuation {
    type: number
    description: "Fully dilated valuation"
    sql: ${TABLE}.fully_diluted_valuation ;;
  }
  dimension: high_24h {
    label: "24hr High"
    description: "Highest price in the last 24hrs"
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
    label: "24hr Low"
    description: "Lowest price in the last 24hrs"
    type: number
    sql: ${TABLE}.low_24h ;;
  }
  dimension: market_cap {
    type: number
    description: "market cap"
    sql: ${TABLE}.market_cap ;;
  }
  dimension: market_cap_change_24h {
    label: "Market Cap Change - 24hrs"
    description: "Change in the market cap in the last 24hrs"
    type: number
    sql: ${TABLE}.market_cap_change_24h ;;
  }
  dimension: market_cap_change_percentage_24h {
    label: "Market Cap Change Percentage - 24hrs"
    description: "Percentage change in the Market Cap in the last 24hrs"
    type: number
    sql: ${TABLE}.market_cap_change_percentage_24h ;;
  }
  dimension: market_cap_rank {
    type: number
    description: "Market cap rank"
    sql: ${TABLE}.market_cap_rank ;;
  }
  dimension: max_supply {
    type: number
    sql: ${TABLE}.max_supply ;;
  }
  dimension: name {
    type: string
    description: "Coin name"
    sql: ${TABLE}.name ;;
  }
  dimension: price_change_24h {
    label: "Price Change - 24hrs"
    description: "Price change in the last 24hrs"
    type: string
    sql: ${TABLE}.price_change_24h ;;
  }
  dimension: price_change_percentage_1h_in_currency {
    label: "Price Change Percentage in currency - 1hr"
    description: "Percent price change in the last 1hr in currency"
    type: string
    sql: ${TABLE}.price_change_percentage_1h_in_currency ;;
  }
  dimension: price_change_percentage_24h {
    label: "Price Change Percentage - 24h"
    description: "Percent price change in the last 24hrs"
    type: number
    sql: ${TABLE}.price_change_percentage_24h ;;
  }
  dimension: price_change_percentage_24h_in_currency {
    label: "Price Change Percentage in currency - 24hrs"
    description: "Percent price change in the last 24hrs in currency"
    type: string
    sql: ${TABLE}.price_change_percentage_24h_in_currency ;;
  }
  dimension: price_change_percentage_7d_in_currency {
    label: "Price Change Percentage in currency - 7 dayss"
    description: "Percent price change in the last 7 days in currency"
    type: string
    sql: ${TABLE}.price_change_percentage_7d_in_currency ;;
  }
  dimension: symbol {
    type: string
    description: "Coin symbol"
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
