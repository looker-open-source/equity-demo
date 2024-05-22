# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: block_events {
#   hidden: yes
#     join: block_events__attributes {
#       view_label: "Block Events: Attributes"
#       sql: LEFT JOIN UNNEST(${block_events.attributes}) as block_events__attributes ;;
#       relationship: one_to_many
#     }
# }
view: block_events {
  sql_table_name: `public-data-finance.crypto_band.block_events` ;;

  dimension: attributes {
    hidden: yes
    sql: ${TABLE}.attributes ;;
  }
  dimension: block_event_type {
    type: string
    sql: ${TABLE}.block_event_type ;;
  }
  dimension: block_height {
    type: number
    sql: ${TABLE}.block_height ;;
  }
  dimension: block_timestamp {
    type: string
    sql: ${TABLE}.block_timestamp ;;
  }
  dimension_group: block_timestamp_truncated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.block_timestamp_truncated ;;
  }
  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }
  measure: count {
    type: count
  }
}

view: block_events__attributes {

  dimension: block_events__attributes {
    type: string
    hidden: yes
    sql: block_events__attributes ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}
