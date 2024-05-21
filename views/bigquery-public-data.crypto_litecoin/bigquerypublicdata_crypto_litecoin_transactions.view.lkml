# # Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: bigquerypublicdata_crypto_litecoin_transactions {
#   hidden: yes
#     join: transactions__bigquerypublicdata_crypto_litecoin_inputs {
#       view_label: "Transactions: Inputs"
#       sql: LEFT JOIN UNNEST(${transactions.inputs}) as transactions__bigquerypublicdata_crypto_litecoin_inputs ;;
#       relationship: one_to_many
#     }
#     join: transactions__bigquerypublicdata_crypto_litecoin_outputs {
#       view_label: "Transactions: Outputs"
#       sql: LEFT JOIN UNNEST(${transactions.outputs}) as transactions__bigquerypublicdata_crypto_litecoin_outputs ;;
#       relationship: one_to_many
#     }
#     join: transactions__inputs__addresses {
#       view_label: "Transactions: Inputs Addresses"
#       sql: LEFT JOIN UNNEST(${transactions__inputs.addresses}) as transactions__inputs__addresses ;;
#       relationship: one_to_many
#     }
#     join: transactions__outputs__addresses {
#       view_label: "Transactions: Outputs Addresses"
#       sql: LEFT JOIN UNNEST(${transactions__outputs.addresses}) as transactions__outputs__addresses ;;
#       relationship: one_to_many
#     }
# }
view: litecoin_transactions {
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
  dimension: lock_time {
    type: number
    description: "Earliest time that miners can include the transaction in their hashing of the Merkle root to attach it in the latest block of the blockchain"
    sql: ${TABLE}.lock_time ;;
  }
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
  dimension: version {
    type: number
    description: "Protocol version specified in block which contained this transaction"
    sql: ${TABLE}.version ;;
  }
  dimension: virtual_size {
    type: number
    description: "The virtual transaction size (differs from size for witness transactions)"
    sql: ${TABLE}.virtual_size ;;
  }
  measure: count {
    type: count
  }
}

# view: transactions__bigquerypublicdata_crypto_litecoin_inputs {

#   dimension: addresses {
#     hidden: yes
#     sql: addresses ;;
#   }
#   dimension: index {
#     type: number
#     description: "0-indexed number of an input within a transaction"
#     sql: index ;;
#   }
#   dimension: required_signatures {
#     type: number
#     description: "The number of signatures required to authorize the spent output"
#     sql: required_signatures ;;
#   }
#   dimension: script_asm {
#     type: string
#     description: "Symbolic representation of the bitcoin's script language op-codes"
#     sql: script_asm ;;
#   }
#   dimension: script_hex {
#     type: string
#     description: "Hexadecimal representation of the bitcoin's script language op-codes"
#     sql: script_hex ;;
#   }
#   dimension: sequence {
#     type: number
#     description: "A number intended to allow unconfirmed time-locked transactions to be updated before being finalized; not currently used except to disable locktime in a transaction"
#     sql: sequence ;;
#   }
#   dimension: spent_output_index {
#     type: number
#     description: "The index of the output this input spends"
#     sql: spent_output_index ;;
#   }
#   dimension: spent_transaction_hash {
#     type: string
#     description: "The hash of the transaction which contains the output that this input spends"
#     sql: spent_transaction_hash ;;
#   }
#   dimension: transactions__bigquerypublicdata_crypto_litecoin_inputs {
#     type: string
#     description: "Transaction inputs"
#     hidden: yes
#     sql: transactions__bigquerypublicdata_crypto_litecoin_inputs ;;
#   }
#   dimension: type {
#     type: string
#     description: "The address type of the spent output"
#     sql: type ;;
#   }
#   dimension: value {
#     type: number
#     description: "The value in base currency attached to the spent output"
#     sql: value ;;
#   }
# }

# view: transactions__bigquerypublicdata_crypto_litecoin_outputs {

#   dimension: addresses {
#     hidden: yes
#     sql: addresses ;;
#   }
#   dimension: index {
#     type: number
#     description: "0-indexed number of an output within a transaction used by a later transaction to refer to that specific output"
#     sql: index ;;
#   }
#   dimension: required_signatures {
#     type: number
#     description: "The number of signatures required to authorize spending of this output"
#     sql: required_signatures ;;
#   }
#   dimension: script_asm {
#     type: string
#     description: "Symbolic representation of the bitcoin's script language op-codes"
#     sql: script_asm ;;
#   }
#   dimension: script_hex {
#     type: string
#     description: "Hexadecimal representation of the bitcoin's script language op-codes"
#     sql: script_hex ;;
#   }
#   dimension: transactions__bigquerypublicdata_crypto_litecoin_outputs {
#     type: string
#     description: "Transaction outputs"
#     hidden: yes
#     sql: transactions__bigquerypublicdata_crypto_litecoin_outputs ;;
#   }
#   dimension: type {
#     type: string
#     description: "The address type of the output"
#     sql: type ;;
#   }
#   dimension: value {
#     type: number
#     description: "The value in base currency attached to this output"
#     sql: value ;;
#   }
# }

# view: transactions__inputs__addresses {

#   dimension: transactions__inputs__addresses {
#     type: string
#     description: "Addresses which own the spent output"
#     sql: transactions__inputs__addresses ;;
#   }
# }

# view: transactions__outputs__addresses {

#   dimension: transactions__outputs__addresses {
#     type: string
#     description: "Addresses which own this output"
#     sql: transactions__outputs__addresses ;;
#   }
# }
