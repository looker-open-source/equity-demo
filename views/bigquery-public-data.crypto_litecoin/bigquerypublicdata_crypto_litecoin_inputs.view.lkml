# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: bigquerypublicdata_crypto_litecoin_inputs {
#   hidden: yes
#     join: inputs__addresses {
#       view_label: "Inputs: Addresses"
#       sql: LEFT JOIN UNNEST(${inputs.addresses}) as inputs__addresses ;;
#       relationship: one_to_many
#     }
# }
view: litecoin_inputs {
  sql_table_name: `bigquery-public-data.crypto_litecoin.inputs` ;;

  dimension: addresses {
    hidden: yes
    sql: ${TABLE}.addresses ;;
  }
  dimension: block_hash {
    type: string
    sql: ${TABLE}.block_hash ;;
  }
  dimension: block_number {
    type: number
    sql: ${TABLE}.block_number ;;
  }
  dimension_group: block_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.block_timestamp ;;
  }
  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }
  dimension: required_signatures {
    type: number
    sql: ${TABLE}.required_signatures ;;
  }
  dimension: script_asm {
    type: string
    sql: ${TABLE}.script_asm ;;
  }
  dimension: script_hex {
    type: string
    sql: ${TABLE}.script_hex ;;
  }
  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }
  dimension: spent_output_index {
    type: number
    sql: ${TABLE}.spent_output_index ;;
  }
  dimension: spent_transaction_hash {
    type: string
    sql: ${TABLE}.spent_transaction_hash ;;
  }
  dimension: transaction_hash {
    type: string
    sql: ${TABLE}.transaction_hash ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
  measure: count {
    type: count
  }
}

# view: inputs__addresses {

#   dimension: inputs__addresses {
#     type: string
#     sql: inputs__addresses ;;
#   }
# }
