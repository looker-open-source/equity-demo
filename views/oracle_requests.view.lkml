# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: oracle_requests {
#   hidden: yes
#     join: oracle_requests__reports {
#       view_label: "Oracle Requests: Reports"
#       sql: LEFT JOIN UNNEST(${oracle_requests.reports}) as oracle_requests__reports ;;
#       relationship: one_to_many
#     }
#     join: oracle_requests__reports__raw_reports {
#       view_label: "Oracle Requests: Reports Raw Reports"
#       sql: LEFT JOIN UNNEST(${oracle_requests__reports.raw_reports}) as oracle_requests__reports__raw_reports ;;
#       relationship: one_to_many
#     }
#     join: oracle_requests__request__requested_validators {
#       view_label: "Oracle Requests: Request Requested Validators"
#       sql: LEFT JOIN UNNEST(${oracle_requests.request__requested_validators}) as oracle_requests__request__requested_validators ;;
#       relationship: one_to_many
#     }
#     join: oracle_requests__request__raw_requests {
#       view_label: "Oracle Requests: Request Raw Requests"
#       sql: LEFT JOIN UNNEST(${oracle_requests.request__raw_requests}) as oracle_requests__request__raw_requests ;;
#       relationship: one_to_many
#     }
# }
view: oracle_requests {
  sql_table_name: `public-data-finance.crypto_band.oracle_requests` ;;
  drill_fields: [oracle_request_id]

  dimension: oracle_request_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.oracle_request_id ;;
  }
  dimension: block_height {
    type: number
    sql: ${TABLE}.block_height ;;
  }
  # dimension: block_timestamp {
  #   type: string
  #   sql: ${TABLE}.block_timestamp ;;
  # }
  dimension_group: block_timestamp_truncated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.block_timestamp_truncated ;;
  }
  dimension: decoded_result__calldata {
    type: string
    sql: ${TABLE}.decoded_result.calldata ;;
    group_label: "Decoded Result"
    group_item_label: "Calldata"
  }
  dimension: decoded_result__result {
    type: string
    sql: ${TABLE}.decoded_result.result ;;
    group_label: "Decoded Result"
    group_item_label: "Result"
  }
  dimension: oracle_script__description {
    type: string
    sql: ${TABLE}.oracle_script.description ;;
    group_label: "Oracle Script"
    group_item_label: "Description"
  }
  dimension: oracle_script__filename {
    type: string
    sql: ${TABLE}.oracle_script.filename ;;
    group_label: "Oracle Script"
    group_item_label: "Filename"
  }
  dimension: oracle_script__name {
    type: string
    sql: ${TABLE}.oracle_script.name ;;
    group_label: "Oracle Script"
    group_item_label: "Name"
  }
  dimension: oracle_script__owner {
    type: string
    sql: ${TABLE}.oracle_script.owner ;;
    group_label: "Oracle Script"
    group_item_label: "Owner"
  }
  dimension: oracle_script__schema {
    type: string
    sql: ${TABLE}.oracle_script.schema ;;
    group_label: "Oracle Script"
    group_item_label: "Schema"
  }
  dimension: oracle_script__source_code_url {
    type: string
    sql: ${TABLE}.oracle_script.source_code_url ;;
    group_label: "Oracle Script"
    group_item_label: "Source Code URL"
  }
  dimension: reports {
    hidden: yes
    sql: ${TABLE}.reports ;;
  }
  dimension: request__calldata {
    type: string
    sql: ${TABLE}.request.calldata ;;
    group_label: "Request"
    group_item_label: "Calldata"
  }
  dimension: request__min_count {
    type: number
    sql: ${TABLE}.request.min_count ;;
    group_label: "Request"
    group_item_label: "Min Count"
  }
  dimension: request__oracle_script_id {
    type: number
    sql: ${TABLE}.request.oracle_script_id ;;
    group_label: "Request"
    group_item_label: "Oracle Script ID"
  }
  dimension: request__raw_requests {
    hidden: yes
    sql: ${TABLE}.request.raw_requests ;;
    group_label: "Request"
    group_item_label: "Raw Requests"
  }
  dimension: request__request_height {
    type: number
    sql: ${TABLE}.request.request_height ;;
    group_label: "Request"
    group_item_label: "Request Height"
  }
  dimension_group: request__request {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.request.request_time ;;
  }
  dimension: request__requested_validators {
    hidden: yes
    sql: ${TABLE}.request.requested_validators ;;
    group_label: "Request"
    group_item_label: "Requested Validators"
  }
  dimension: result__request_packet_data__ask_count {
    type: number
    sql: ${TABLE}.result.request_packet_data.ask_count ;;
    group_label: "Result Request Packet Data"
    group_item_label: "Ask Count"
  }
  dimension: result__request_packet_data__calldata {
    type: string
    sql: ${TABLE}.result.request_packet_data.calldata ;;
    group_label: "Result Request Packet Data"
    group_item_label: "Calldata"
  }
  dimension: result__request_packet_data__min_count {
    type: number
    sql: ${TABLE}.result.request_packet_data.min_count ;;
    group_label: "Result Request Packet Data"
    group_item_label: "Min Count"
  }
  dimension: result__request_packet_data__oracle_script_id {
    type: number
    sql: ${TABLE}.result.request_packet_data.oracle_script_id ;;
    group_label: "Result Request Packet Data"
    group_item_label: "Oracle Script ID"
  }
  dimension: result__response_packet_data__ans_count {
    type: number
    sql: ${TABLE}.result.response_packet_data.ans_count ;;
    group_label: "Result Response Packet Data"
    group_item_label: "Ans Count"
  }
  dimension: result__response_packet_data__request_id {
    type: number
    sql: ${TABLE}.result.response_packet_data.request_id ;;
    group_label: "Result Response Packet Data"
    group_item_label: "Request ID"
  }
  dimension: result__response_packet_data__request_time {
    type: number
    sql: ${TABLE}.result.response_packet_data.request_time ;;
    group_label: "Result Response Packet Data"
    group_item_label: "Request Time"
  }
  dimension: result__response_packet_data__resolve_status {
    type: number
    sql: ${TABLE}.result.response_packet_data.resolve_status ;;
    group_label: "Result Response Packet Data"
    group_item_label: "Resolve Status"
  }
  dimension: result__response_packet_data__resolve_time {
    type: number
    sql: ${TABLE}.result.response_packet_data.resolve_time ;;
    group_label: "Result Response Packet Data"
    group_item_label: "Resolve Time"
  }
  dimension: result__response_packet_data__result {
    type: string
    sql: ${TABLE}.result.response_packet_data.result ;;
    group_label: "Result Response Packet Data"
    group_item_label: "Result"
  }
  measure: count {
    type: count
    drill_fields: [oracle_request_id, oracle_script__name, oracle_script__filename]
  }
}

view: oracle_requests__reports {

  dimension: in_before_resolve {
    type: yesno
    sql: in_before_resolve ;;
  }
  dimension: oracle_requests__reports {
    type: string
    hidden: yes
    sql: oracle_requests__reports ;;
  }
  dimension: raw_reports {
    hidden: yes
    sql: raw_reports ;;
  }
  dimension: validator {
    type: string
    sql: validator ;;
  }
}

view: oracle_requests__reports__raw_reports {

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }
  dimension: exit_code {
    type: number
    sql: ${TABLE}.exit_code ;;
  }
  dimension: external_id {
    type: number
    sql: ${TABLE}.external_id ;;
  }
}

view: oracle_requests__request__requested_validators {

  dimension: oracle_requests__request__requested_validators {
    type: string
    sql: oracle_requests__request__requested_validators ;;
  }
}

view: oracle_requests__request__raw_requests {

  dimension: calldata {
    type: string
    sql: ${TABLE}.calldata ;;
  }
  dimension: data_source_id {
    type: number
    sql: ${TABLE}.data_source_id ;;
  }
  dimension: external_id {
    type: number
    sql: ${TABLE}.external_id ;;
  }
}
