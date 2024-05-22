view: errors {
  sql_table_name: `public-data-finance.crypto_band.errors` ;;

  dimension: errors {
    type: string
    description: "Insert errors serialized to json string"
    sql: ${TABLE}.errors ;;
  }
  dimension: table_row {
    type: string
    description: "Failed TableRow serialized to json string"
    sql: ${TABLE}.tableRow ;;
  }
  measure: count {
    type: count
  }
}
