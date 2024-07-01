
include: transactions_base.view
view: crypto_bitcoin_cash_transactions {
  extends: [transactions_base]
  label: "Bitcoin Cash Transactions"
  sql_table_name: `bigquery-public-data.crypto_bitcoin_cash.transactions` ;;

}
#--------------------------------------------------------------------------------------------------------------------------------------------------------------
view: bitcoin_cash_inputs {

  dimension: addresses {
    hidden: yes
    sql: ${TABLE}.addresses ;;
  }
  dimension: index {
    type: number
    description: "0-indexed number of an input within a transaction"
    sql: ${TABLE}.index ;;
  }
  #commenting out fields I don't think I'll need in order to de-clutter
  # dimension: required_signatures {
  #   type: number
  #   description: "The number of signatures required to authorize the spent output"
  #   sql: ${TABLE}.required_signatures ;;
  # }
  # dimension: script_asm {
  #   type: string
  #   description: "Symbolic representation of the bitcoin's script language op-codes"
  #   sql: ${TABLE}.script_asm ;;
  # }
  # dimension: script_hex {
  #   type: string
  #   description: "Hexadecimal representation of the bitcoin's script language op-codes"
  #   sql: ${TABLE}.script_hex ;;
  # }
  dimension: sequence {
    type: number
    description: "A number intended to allow unconfirmed time-locked transactions to be updated before being finalized; not currently used except to disable locktime in a transaction"
    sql: sequence ;;
  }
  dimension: spent_output_index {
    type: number
    description: "The index of the output this input spends"
    sql: spent_output_index ;;
  }
  dimension: spent_transaction_hash {
    type: string
    description: "The hash of the transaction which contains the output that this input spends"
    sql: spent_transaction_hash ;;
  }
  dimension: transactions__bigquerypublicdata_crypto_bitcoin_cash_inputs {
    type: string
    description: "Transaction inputs"
    hidden: yes
    sql: transactions__bigquerypublicdata_crypto_bitcoin_cash_inputs ;;
  }
  dimension: type {
    type: string
    description: "The address type of the spent output"
    sql: ${TABLE}.type ;;
  }
  dimension: value {
    type: number
    description: "The value in base currency attached to the spent output"
    sql: ${TABLE}.value ;;
  }
}
#---------------------------------------------------------------------------------------------------------------------------------------------------------------
view: bitcoin_cash_outputs {

  dimension: addresses {
    hidden: yes
    sql: ${TABLE}.addresses ;;
  }
  dimension: index {
    type: number
    description: "0-indexed number of an output within a transaction used by a later transaction to refer to that specific output"
    sql: ${TABLE}.index ;;
  }
  #commenting out fields I don't think I'll need
  # dimension: required_signatures {
  #   type: number
  #   description: "The number of signatures required to authorize spending of this output"
  #   sql: ${TABLE}.required_signatures ;;
  # }
  # dimension: script_asm {
  #   type: string
  #   description: "Symbolic representation of the bitcoin's script language op-codes"
  #   sql: ${TABLE}.script_asm ;;
  # }
  # dimension: script_hex {
  #   type: string
  #   description: "Hexadecimal representation of the bitcoin's script language op-codes"
  #   sql: ${TABLE}.script_hex ;;
  # }
  dimension: transactions__bigquerypublicdata_crypto_bitcoin_cash_outputs {
    type: string
    description: "Transaction outputs"
    hidden: yes
    sql: transactions__bigquerypublicdata_crypto_bitcoin_cash_outputs ;;
  }
  dimension: type {
    type: string
    description: "The address type of the output"
    sql: ${TABLE}.type ;;
  }
  dimension: value {
    type: number
    description: "The value in base currency attached to this output"
    sql: ${TABLE}.value ;;
  }
}
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------
view: bitcoin_cash_inputs_addresses {

  dimension: transactions__inputs__addresses {
    type: string
    description: "Addresses which own the spent output"
    sql: transactions__inputs__addresses ;;
  }
}
#------------------------------------------------------------------------------------------------------------------------------------------------------------------
view: bitcoin_cash_outputs_addresses {

  dimension: transactions__outputs__addresses {
    type: string
    description: "Addresses which own this output"
    sql: transactions__outputs__addresses ;;
  }
}


