
view: bigquerypublicdata_crypto_litecoin_transactions {
  sql_table_name: `bigquery-public-data.crypto_litecoin.transactions` ;;

  dimension: block_hash {
    type: string
    description: "Hash of the block which contains this transaction"
    sql: ${TABLE}.block_hash ;;
  }
  dimension: block_number {
    type: number
    description: "Number of the block which contains this transaction"
    sql: ${TABLE}.block_number ;;
  }
  dimension_group: block_timestamp {
    type: time
    description: "Timestamp of the block which contains this transaction"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.block_timestamp ;;
  }
  # dimension_group: block_timestamp_month {
  #   type: time
  #   description: "Month of the block which contains this transaction"
  #   timeframes: [raw, date, week, month, quarter, year]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.block_timestamp_month ;;
  # }
  dimension: fee {
    type: number
    description: "The fee paid by this transaction"
    sql: ${TABLE}.fee ;;
  }
  dimension: hash {
    type: string
    description: "The hash of this transaction"
    sql: ${TABLE}.`hash` ;;
  }
  dimension: input_count {
    type: number
    description: "The number of inputs in the transaction"
    sql: ${TABLE}.input_count ;;
  }
  dimension: input_value {
    type: number
    description: "Total value of inputs in the transaction"
    sql: ${TABLE}.input_value ;;
  }
  dimension: inputs {
    hidden: yes
    sql: ${TABLE}.inputs ;;
  }
  dimension: is_coinbase {
    type: yesno
    description: "true if this transaction is a coinbase transaction"
    sql: ${TABLE}.is_coinbase ;;
  }
  # dimension: lock_time {
  #   type: number
  #   description: "Earliest time that miners can include the transaction in their hashing of the Merkle root to attach it in the latest block of the blockchain"
  #   sql: ${TABLE}.lock_time ;;
  # }
  dimension: output_count {
    type: number
    description: "The number of outputs in the transaction"
    sql: ${TABLE}.output_count ;;
  }
  dimension: output_value {
    type: number
    description: "Total value of outputs in the transaction"
    sql: ${TABLE}.output_value ;;
  }
  dimension: outputs {
    hidden: yes
    sql: ${TABLE}.outputs ;;
  }
  dimension: size {
    type: number
    description: "The size of this transaction in bytes"
    sql: ${TABLE}.size ;;
  }
  # dimension: version {
  #   type: number
  #   description: "Protocol version specified in block which contained this transaction"
  #   sql: ${TABLE}.version ;;
  # }
  # dimension: virtual_size {
  #   type: number
  #   description: "The virtual transaction size (differs from size for witness transactions)"
  #   sql: ${TABLE}.virtual_size ;;
  # }
  measure: count {
    type: count
  }
}
