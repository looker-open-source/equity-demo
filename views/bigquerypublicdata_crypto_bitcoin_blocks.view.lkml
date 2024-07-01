include: blocks_base.view
view: bitcoin_blocks {
  extends: [blocks_base]
  label: "Bitcoin Blocks"
  sql_table_name: `bigquery-public-data.crypto_bitcoin.blocks` ;;


  dimension: id {
    hidden: yes
    primary_key: no
    type: string
    sql: "bitcoin" ;;
  }
  dimension: coin_id {
    primary_key: no
    type: string
    sql: ${id} ;;
    link: {
      label: "Filtered Coin Data by ID"
      url: "https://b772aff5-4b93-454c-9b34-147289eb2172.looker.app/dashboards/RZbF4ReRz00O3655QMLfG7?ID={{value}}"
      # url: "https://instance_name.looker.com/dashboards/694?State={{ _filters['users.state'] | url_encode }}&Date={{ _filters['orders.date'] | url_encode }}"
    }
  }
# }

  # dimension: bits {
  #   type: string
  #   description: "Difficulty threshold specified in block header"
  #   sql: ${TABLE}.bits ;;
  # }
  # dimension: coinbase_param {
  #   type: string
  #   description: "Data specified in the coinbase transaction of this block"
  #   sql: ${TABLE}.coinbase_param ;;
  # }
  # dimension: hash {
  #   primary_key: yes
  #   type: string
  #   description: "Hash of this block"
  #   sql: ${TABLE}.`hash` ;;
  # }
#   #commenting out dimensions I don't think I'll need
#   # dimension: merkle_root {
#   #   type: string
#   #   description: "The root node of a Merkle tree, where leaves are transaction hashes"
#   #   sql: ${TABLE}.merkle_root ;;
#   # }
#   # dimension: nonce {
#   #   type: string
#   #   description: "Difficulty solution specified in block header"
#   #   sql: ${TABLE}.nonce ;;
#   # }
#   dimension: number {
#     type: number
#     description: "The number of the block"
#     sql: ${TABLE}.number ;;
#   }
#   dimension: size {
#     type: number
#     description: "The size of block data in bytes"
#     sql: ${TABLE}.size ;;
#   }
#   dimension: stripped_size {
#     type: number
#     description: "The size of block data in bytes excluding witness data"
#     sql: ${TABLE}.stripped_size ;;
#   }
#   dimension_group: timestamp {
#     type: time
#     description: "Block creation timestamp specified in block header"
#     timeframes: [raw, time, date, week, month, quarter, year]
#     sql: ${TABLE}.timestamp ;;
#   }
#   dimension: transaction_count {
#     type: number
#     description: "Number of transactions included in this block"
#     sql: ${TABLE}.transaction_count ;;
#   }
#   measure: avg_transaction_count {
#     type: average
#     label: "Average Transaction Count"
#     sql: ${transaction_count} ;;
#   }
#   dimension: version {
#     type: number
#     description: "Protocol version specified in block header"
#     sql: ${TABLE}.version ;;
#   }
#   dimension: weight {
#     type: number
#     description: "Three times the base size plus the total size. https://github.com/bitcoin/bips/blob/master/bip-0141.mediawiki"
#     sql: ${TABLE}.weight ;;
#   }
#   measure: count {
#     type: count
#     drill_fields: [hash, transaction_count, weight, size, stripped_size]
#   }
}
