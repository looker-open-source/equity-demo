view: portfolio {
  derived_table: {
    sql: with coins as(
          SELECT
          id
          ,name as name
          ,"Crypto Currency" as investment_type
          ,"Alternative Currencies" as sector
          ,current_price
          ,(FLOOR(RAND()*(10-5+1)+5)) as amount
          FROM `@{database}.crypto_mvp.market_data`
          )
          ,
          stock as (
          SELECT
          id
          ,shortName as short_name
          ,"Equity" as investment_type
          ,sector
          ,currentPrice as current_price
          ,(FLOOR(RAND()*(100-5+1)+5)) as amount
          FROM `@{database}.crypto_mvp.stock_info`
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
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: investment_type {
    description: "Type of Investment"
    type: string
    sql: ${TABLE}.investment_type ;;
    drill_fields: [sector,id,name]
  }
  dimension: sector {
    description: "Industry Sector"
    type: string
    sql: ${TABLE}.sector ;;
    drill_fields: [id,name]
  }
  dimension: current_price {
    label: "Current Price"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: CAST(${TABLE}.current_price as FLOAT64) ;;
  }
  dimension: amount {
    label: "Quantity"
    description: "Amount of shares/coins currently within the portfolio"
    type: number
    value_format: "0.00"
    sql: CAST(${TABLE}.amount as FLOAT64) ;;
  }
  measure: count {
    type: count
    drill_fields: [investment_details*]
  }
  dimension: value {
    label: "Available Value"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: (${current_price}*${amount}) ;;
  }
  measure:  total_value{
    label: "Total Investment Value"
    type: sum
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${value} ;;
    drill_fields: [id,sector,investment_type,amount,value, name]
  }
  measure: total_quantity {
    type: sum
    value_format: "0.00"
    sql: ${amount} ;;
    drill_fields: [id,sector,investment_type,amount,value, name]
  }
  measure: share_of_value {
    label: "Share of Portfolio Value"
    description: "Value of investment as a percentage of the Total Investment Value"
    type: number
    value_format: "0.00%"
    sql: (${value}/${total_value}) ;;
  }
  drill_fields: [id,sector,investment_type,current_price,amount,value, name]

  set: investment_details {
    fields: [id, sector, current_price, investment_type, name]
  }
}
