view: portfolio {
  derived_table: {
     sql: with coins as(
    SELECT
    id
    ,"Crypto Currency" as investment_type
    ,"Alternative Currencies" as sector
    ,current_price
    ,(FLOOR(RAND()*(10-5+1)+5)) as amount
    FROM `kirby-looker-core-argolis.crypto_mvp.market_data`
    )
    ,
    stock as (
    SELECT
    id
    ,"Equity" as investment_type
    ,sector
    ,currentPrice as current_price
    ,(FLOOR(RAND()*(10-5+1)+5)) as amount
    FROM `kirby-looker-core-argolis.crypto_mvp.stock_info`
    )

    SELECT *
    FROM coins
    UNION ALL
    SELECT *
    FROM stock
      ;;
  }
  dimension: id {
    label: "Ticker"
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }
  dimension: investment_type {
    description: "Type of Investment"
    type: string
    sql: ${TABLE}.investment_type ;;
  }
  dimension: sector {
    description: "Industry Sector"
    type: string
    sql: ${TABLE}.sector ;;
  }
  dimension: current_price {
    label: "Current Price"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: CAST(${TABLE}.current_price as FLOAT64) ;;
  }
  dimension: amount {
    label: "Quantity"
    description: "Amount currently within the portfolio"
    type: number
    value_format: "0.00"
    sql: CAST(${TABLE}.amount as FLOAT64) ;;
  }
  dimension: value {
    label: "Available Value"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: (${current_price}*${amount}) ;;
  }
  measure:  total{
    label: "Total Investment Value"
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${value} ;;
  }
  measure: share_of_value {
    label: "Share of Portfolio Value"
    description: "Value of investment as a percentage of the Total Investment Value"
    type: number
    value_format: "0.00%"
    sql: (${value}/${total}) ;;
  }
  drill_fields: [id,sector,investment_type]
}
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
