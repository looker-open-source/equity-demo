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
    value_format: "$#,##0.00;($#,##0.00)"
    description: "All-time high"
    sql: ${TABLE}.ath ;;
  }
  dimension: ath_change_percentage {
    label: "All-time High Change Percentage"
    type: number
    value_format: "0.00\%"
    description: "The drop in percents of the price of a cryptocurrency compared to its maximum price (ATH) of all time"
    sql: ${TABLE}.ath_change_percentage ;;
  }
  dimension: ath_date {
    label: "All-time High Date"
    type: string
    description: "Date of all-time high"
    sql: SUBSTRING(${TABLE}.ath_date,1,10);;
  }
  dimension: atl {
    label: "All-time Low"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    description: "All-time low"
    sql: ${TABLE}.atl ;;
  }
  dimension: atl_change_percentage {
    label: "All-time Low Change Percentage"
    type: number
    value_format: "0.00\%"
    description: "The rise in percents of the price of a cryptocurrency compared to its minimum price (ATL) of all time"
    sql: ${TABLE}.atl_change_percentage ;;
  }
  dimension: atl_date {
    label: "All-time Low Date"
    type: string
    description: "Date of all-time low"
    sql: SUBSTRING(${TABLE}.atl_date,1,10);;
  }
  dimension: circulating_supply {
    description: "The total number of coins or tokens that are actively available for trade and are being used in the market and in general public."
    type: number
    value_format: "#,##0"
    sql: ${TABLE}.circulating_supply ;;
  }
  dimension: current_price {
    type: number
    description: "Current price"
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.current_price ;;
  }
  dimension: fully_diluted_valuation {
    description: "Fully diluted valuation (FDV) is the total value of a cryptocurrency project assuming all of its tokens are in circulation. The total supply of tokens may change due to the minting of new tokens, or due to token burning, which removes tokens from circulation."
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.fully_diluted_valuation ;;
  }
  dimension: high_24h {
    label: "24hr High"
    description: "Highest price in the last 24hrs"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.high_24h ;;
  }
  dimension: image {
    type: string
    description: "URI for image"
    sql: ${TABLE}.image ;;
    html: <img src="{{value}}";;
  }
  dimension: last_updated {
    type: date
    sql: CAST(SUBSTRING(${TABLE}.last_updated,1,10) AS DATE FORMAT 'YYYY-MM-DD');;
  }
  dimension: low_24h {
    label: "24hr Low"
    description: "Lowest price in the last 24hrs"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.low_24h ;;
  }
  dimension: market_cap {
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    description: "Market cap is the total value of all the coins that have been mined. It's calculated by multiplying the number of coins in circulation by the current market price of a single coin."
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
    value_format: "0.00\%"
    type: number
    sql: ${TABLE}.market_cap_change_percentage_24h ;;
  }
  dimension: market_cap_rank {
    type: number
    value_format: "0"
    description: "Market cap rank"
    sql: ${TABLE}.market_cap_rank ;;
  }
  dimension: max_supply {
    description: "The limit of tokens that can be created for a particular cryptocurrency, providing insight into its scarcity and potential inflation rate. Max supply denotes the absolute maximum number of coins or tokens that will ever exist for a particular cryptocurrency."
    type: number
    value_format: "#,##0"
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
    value_format: "#,##0"
    sql: ${TABLE}.price_change_24h ;;
  }
  dimension: price_change_percentage_1h_in_currency {
    label: "Price Change Percentage in currency - 1hr"
    description: "Percent price change in the last 1hr in currency"
    type: number
    value_format: "0.00\%"
    sql: ${TABLE}.price_change_percentage_1h_in_currency ;;
  }
  dimension: price_change_percentage_24h {
    label: "Price Change Percentage - 24h"
    description: "Percent price change in the last 24hrs"
    value_format: "0.00\%"
    type: number
    sql: ${TABLE}.price_change_percentage_24h ;;
  }
  dimension: price_change_percentage_24h_in_currency {
    label: "Price Change Percentage in currency - 24hrs"
    description: "Percent price change in the last 24hrs in currency"
    type: number
    value_format: "0.00\%"
    sql: ${TABLE}.price_change_percentage_24h_in_currency ;;
  }
  dimension: price_change_percentage_7d_in_currency {
    label: "Price Change Percentage in currency - 7 days"
    description: "Percent price change in the last 7 days in currency"
    value_format: "0.00\%"
    type: number
    sql: ${TABLE}.price_change_percentage_7d_in_currency ;;
  }
  dimension: symbol {
    type: string
    description: "Coin symbol"
    sql: ${TABLE}.symbol ;;
  }
  dimension: total_supply {
    type: number
    value_format: "#,##0"
    description: "Total Supply refers to the total amount of coins or tokens of a specific cryptocurrency that have been created or mined, that are in circulation, including those that are locked or reserved."
    sql: ${TABLE}.total_supply ;;
  }
  dimension: total_volume {
    description: "Total volume, also known as trading volume, is a key metric in the cryptocurrency market that measures the total amount of a cryptocurrency that has been traded within a specific time frame, usually daily. It's calculated by adding up all buy and sell transactions of a particular cryptocurrency asset during that period. For example, if Bitcoin has a daily trading volume of 50,000 BTC, that means 50,000 bitcoins were traded on that day."
    type: number
    value_format: "#,##0"
    sql: ${TABLE}.total_volume ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
