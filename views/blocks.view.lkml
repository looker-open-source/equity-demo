# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: blocks {
#   hidden: yes
#     join: blocks__signatures {
#       view_label: "Blocks: Signatures"
#       sql: LEFT JOIN UNNEST(${blocks.signatures}) as blocks__signatures ;;
#       relationship: one_to_many
#     }
# }
view: blocks {
  sql_table_name: `public-data-finance.crypto_band.blocks` ;;
  drill_fields: [signatures__signatures__block_id_flag]

  dimension: signatures__signatures__block_id_flag {
    primary_key: yes
    type: number
    sql: ${TABLE}.signatures.signatures.block_id_flag ;;
    group_label: "Signatures Signatures"
    group_item_label: "Block ID Flag"
  }
  dimension: app_hash {
    type: string
    sql: ${TABLE}.app_hash ;;
  }
  dimension: block_hash {
    type: string
    sql: ${TABLE}.block_hash ;;
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
  dimension: consensus_hash {
    type: string
    sql: ${TABLE}.consensus_hash ;;
  }
  dimension: data_hash {
    type: string
    sql: ${TABLE}.data_hash ;;
  }
  dimension: evidence_hash {
    type: string
    sql: ${TABLE}.evidence_hash ;;
  }
  dimension: last_commit_hash {
    type: string
    sql: ${TABLE}.last_commit_hash ;;
  }
  dimension: last_results_hash {
    type: string
    sql: ${TABLE}.last_results_hash ;;
  }
  dimension: next_validators_hash {
    type: string
    sql: ${TABLE}.next_validators_hash ;;
  }
  dimension: proposer_address {
    type: string
    sql: ${TABLE}.proposer_address ;;
  }
  dimension: signatures {
    hidden: yes
    sql: ${TABLE}.signatures ;;
  }
  dimension: validators_hash {
    type: string
    sql: ${TABLE}.validators_hash ;;
  }
  measure: count {
    type: count
    drill_fields: [signatures__signatures__block_id_flag]
  }
}

view: blocks__signatures {

  dimension: block_id_flag {
    type: number
    value_format_name: id
    sql: block_id_flag ;;
  }
  dimension: blocks__signatures {
    type: string
    hidden: yes
    sql: blocks__signatures ;;
  }
  dimension: signatures__block_id_flag {
    type: number
    value_format_name: id
    sql: ${TABLE}.signatures.block_id_flag ;;
    group_label: "Signatures"
    group_item_label: "Block ID Flag"
  }
  dimension: signatures__signature {
    type: string
    sql: ${TABLE}.signatures.signature ;;
    group_label: "Signatures"
    group_item_label: "Signature"
  }
  dimension_group: signatures__timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.signatures.timestamp ;;
  }
  dimension: signatures__validator_address {
    type: string
    sql: ${TABLE}.signatures.validator_address ;;
    group_label: "Signatures"
    group_item_label: "Validator Address"
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: timestamp ;;
  }
  dimension: validator_address {
    type: string
    sql: validator_address ;;
  }
}
