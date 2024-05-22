# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: logs {
#   hidden: yes
#     join: logs__events {
#       view_label: "Logs: Events"
#       sql: LEFT JOIN UNNEST(${logs.events}) as logs__events ;;
#       relationship: one_to_many
#     }
#     join: logs__events__attributes {
#       view_label: "Logs: Events Attributes"
#       sql: LEFT JOIN UNNEST(${logs__events.attributes}) as logs__events__attributes ;;
#       relationship: one_to_many
#     }
# }
view: logs {
  sql_table_name: `public-data-finance.crypto_band.logs` ;;

  dimension: block_height {
    type: number
    sql: ${TABLE}.block_height ;;
  }
  dimension_group: block_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.block_timestamp ;;
  }
  dimension_group: block_timestamp_truncated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.block_timestamp_truncated ;;
  }
  dimension: events {
    hidden: yes
    sql: ${TABLE}.events ;;
  }
  dimension: log {
    type: string
    sql: ${TABLE}.log ;;
  }
  dimension: log_index {
    type: number
    sql: ${TABLE}.log_index ;;
  }
  dimension: msg_index {
    type: number
    sql: ${TABLE}.msg_index ;;
  }
  dimension: txhash {
    type: string
    sql: ${TABLE}.txhash ;;
  }
  measure: count {
    type: count
  }
}

view: logs__events {

  dimension: attributes {
    hidden: yes
    sql: ${TABLE}.attributes ;;
  }
  dimension: logs__events {
    type: string
    hidden: yes
    sql: logs__events ;;
  }
  dimension: type {
    type: string
    sql: type ;;
  }
}

view: logs__events__attributes {

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
