view: bigquerypublicdata_crypto_bitcoin_blocks {
  label: "Bitcoin Blocks"
  sql_table_name: `bigquery-public-data.crypto_bitcoin.blocks` ;;

  dimension: bits {
    type: string
    description: "Difficulty threshold specified in block header"
    sql: ${TABLE}.bits ;;
  }
  dimension: coinbase_param {
    type: string
    description: "Data specified in the coinbase transaction of this block"
    sql: ${TABLE}.coinbase_param ;;
  }
  dimension: hash {
    type: string
    description: "Hash of this block"
    sql: ${TABLE}.`hash` ;;
  }
  dimension: merkle_root {
    type: string
    description: "The root node of a Merkle tree, where leaves are transaction hashes"
    sql: ${TABLE}.merkle_root ;;
  }
  dimension: nonce {
    type: string
    description: "Difficulty solution specified in block header"
    sql: ${TABLE}.nonce ;;
  }
  dimension: number {
    type: number
    description: "The number of the block"
    sql: ${TABLE}.number ;;
  }
  dimension: size {
    type: number
    description: "The size of block data in bytes"
    sql: ${TABLE}.size ;;
  }
  dimension: stripped_size {
    type: number
    description: "The size of block data in bytes excluding witness data"
    sql: ${TABLE}.stripped_size ;;
  }
  dimension_group: timestamp {
    type: time
    description: "Block creation timestamp specified in block header"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.timestamp ;;
  }
  # dimension_group: timestamp_month {
  #   type: time
  #   description: "Month of the block creation timestamp specified in block header"
  #   timeframes: [raw, date, week, month, quarter, year]
  #   convert_tz: no
  #   datatype: date
  #   sql: ${TABLE}.timestamp_month ;;
  # }
  dimension: transaction_count {
    type: number
    description: "Number of transactions included in this block"
    sql: ${TABLE}.transaction_count ;;
  }
  dimension: version {
    type: number
    description: "Protocol version specified in block header"
    sql: ${TABLE}.version ;;
  }
  dimension: weight {
    type: number
    description: "Three times the base size plus the total size. https://github.com/bitcoin/bips/blob/master/bip-0141.mediawiki"
    sql: ${TABLE}.weight ;;
  }
  measure: count {
    type: count
  }
}
