view: full_public_dataset {
  derived_table: {
    datagroup_trigger: history
    sql:with bitcoin_block_base as (
    select
    "bitcoin" as coin_id
    ,`hash` as block_hash
    ,size as block_size
    ,number as block_number
    ,timestamp as block_timestamp
    ,transaction_count
    FROM `bigquery-public-data.crypto_bitcoin.blocks`)
    ,
    bitcoin_transaction_base as (
    select
    `hash` as transaction_hash
    ,size as transaction_size
    ,block_hash
    ,block_number
    ,block_timestamp
    ,input_count
    ,output_count
    ,input_value
    ,output_value
    ,is_coinbase
    ,fee
    FROM `bigquery-public-data.crypto_bitcoin.transactions`)
    ,
    bitcoin_input_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,spent_transaction_hash
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_bitcoin.inputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_bitcoin.inputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    bitcoin_output_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_bitcoin.outputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_bitcoin.outputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    full_bitcoin as(
    select
    bitcoin_block_base.coin_id
    ,bitcoin_block_base.block_hash
    ,bitcoin_block_base.block_size
    ,bitcoin_block_base.block_number
    ,bitcoin_block_base.block_timestamp
    ,bitcoin_block_base.transaction_count
    ,bitcoin_transaction_base.transaction_hash
    ,bitcoin_transaction_base.transaction_size
    ,bitcoin_transaction_base.input_count
    ,bitcoin_transaction_base.output_count
    ,bitcoin_transaction_base.input_value
    ,bitcoin_transaction_base.output_value
    ,bitcoin_transaction_base.is_coinbase
    ,bitcoin_transaction_base.fee
    ,bitcoin_input_addresses.spent_transaction_hash
    ,bitcoin_input_addresses.addresses as input_addresses
    ,bitcoin_input_addresses.addresses_offset as input_addresses_offset
    ,bitcoin_input_addresses.value as input_address_value
    ,bitcoin_output_addresses.addresses as output_addresses
    ,bitcoin_output_addresses.addresses_offset as output_addresses_offset
    ,bitcoin_output_addresses.value as output_address_value

    FROM bitcoin_block_base
    INNER JOIN bitcoin_transaction_base
    ON bitcoin_block_base.block_hash = bitcoin_transaction_base.block_hash
    INNER JOIN bitcoin_input_addresses
    ON bitcoin_transaction_base.transaction_hash = bitcoin_input_addresses.transaction_hash
    INNER JOIN bitcoin_output_addresses
    ON bitcoin_transaction_base.transaction_hash = bitcoin_output_addresses.transaction_hash)
    ,

    bitcoin_cash_block_base as (
    select
    "bitcoin-cash" as coin_id
    ,`hash` as block_hash
    ,size as block_size
    ,number as block_number
    ,timestamp as block_timestamp
    ,transaction_count
    FROM `bigquery-public-data.crypto_bitcoin_cash.blocks`)
    ,
    bitcoin_cash_transaction_base as (
    select
    `hash` as transaction_hash
    ,size as transaction_size
    ,block_hash
    ,block_number
    ,block_timestamp
    ,input_count
    ,output_count
    ,input_value
    ,output_value
    ,is_coinbase
    ,fee
    FROM `bigquery-public-data.crypto_bitcoin_cash.transactions`)
    ,
    bitcoin_cash_input_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,spent_transaction_hash
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_bitcoin_cash.inputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_bitcoin_cash.inputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    bitcoin_cash_output_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_bitcoin_cash.outputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_bitcoin_cash.outputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    full_bitcoin_cash as(
    select
    bitcoin_cash_block_base.coin_id
    ,bitcoin_cash_block_base.block_hash
    ,bitcoin_cash_block_base.block_size
    ,bitcoin_cash_block_base.block_number
    ,bitcoin_cash_block_base.block_timestamp
    ,bitcoin_cash_block_base.transaction_count
    ,bitcoin_cash_transaction_base.transaction_hash
    ,bitcoin_cash_transaction_base.transaction_size
    ,bitcoin_cash_transaction_base.input_count
    ,bitcoin_cash_transaction_base.output_count
    ,bitcoin_cash_transaction_base.input_value
    ,bitcoin_cash_transaction_base.output_value
    ,bitcoin_cash_transaction_base.is_coinbase
    ,bitcoin_cash_transaction_base.fee
    ,bitcoin_cash_input_addresses.spent_transaction_hash
    ,bitcoin_cash_input_addresses.addresses as input_addresses
    ,bitcoin_cash_input_addresses.addresses_offset as input_addresses_offset
    ,bitcoin_cash_input_addresses.value as input_address_value
    ,bitcoin_cash_output_addresses.addresses as output_addresses
    ,bitcoin_cash_output_addresses.addresses_offset as output_addresses_offset
    ,bitcoin_cash_output_addresses.value as output_address_value

    FROM bitcoin_cash_block_base
    INNER JOIN bitcoin_cash_transaction_base
    ON bitcoin_cash_block_base.block_hash = bitcoin_cash_transaction_base.block_hash
    INNER JOIN bitcoin_cash_input_addresses
    ON bitcoin_cash_transaction_base.transaction_hash = bitcoin_cash_input_addresses.transaction_hash
    INNER JOIN bitcoin_cash_output_addresses
    ON bitcoin_cash_transaction_base.transaction_hash = bitcoin_cash_output_addresses.transaction_hash)
    ,
    dogecoin_block_base as (
    select
    "dogecoin" as coin_id
    ,`hash` as block_hash
    ,size as block_size
    ,number as block_number
    ,timestamp as block_timestamp
    ,transaction_count
    FROM `bigquery-public-data.crypto_dogecoin.blocks`)
    ,
    dogecoin_transaction_base as (
    select
    `hash` as transaction_hash
    ,size as transaction_size
    ,block_hash
    ,block_number
    ,block_timestamp
    ,input_count
    ,output_count
    ,input_value
    ,output_value
    ,is_coinbase
    ,fee
    FROM `bigquery-public-data.crypto_dogecoin.transactions`)
    ,
    dogecoin_input_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,spent_transaction_hash
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_dogecoin.inputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_dogecoin.inputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    dogecoin_output_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_dogecoin.outputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_dogecoin.outputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    full_dogecoin as(
    select
    dogecoin_block_base.coin_id
    ,dogecoin_block_base.block_hash
    ,dogecoin_block_base.block_size
    ,dogecoin_block_base.block_number
    ,dogecoin_block_base.block_timestamp
    ,dogecoin_block_base.transaction_count
    ,dogecoin_transaction_base.transaction_hash
    ,dogecoin_transaction_base.transaction_size
    ,dogecoin_transaction_base.input_count
    ,dogecoin_transaction_base.output_count
    ,dogecoin_transaction_base.input_value
    ,dogecoin_transaction_base.output_value
    ,dogecoin_transaction_base.is_coinbase
    ,dogecoin_transaction_base.fee
    ,dogecoin_input_addresses.spent_transaction_hash
    ,dogecoin_input_addresses.addresses as input_addresses
    ,dogecoin_input_addresses.addresses_offset as input_addresses_offset
    ,dogecoin_input_addresses.value as input_address_value
    ,dogecoin_output_addresses.addresses as output_addresses
    ,dogecoin_output_addresses.addresses_offset as output_addresses_offset
    ,dogecoin_output_addresses.value as output_address_value

    FROM dogecoin_block_base
    INNER JOIN dogecoin_transaction_base
    ON dogecoin_block_base.block_hash = dogecoin_transaction_base.block_hash
    INNER JOIN dogecoin_input_addresses
    ON dogecoin_transaction_base.transaction_hash = dogecoin_input_addresses.transaction_hash
    INNER JOIN dogecoin_output_addresses
    ON dogecoin_transaction_base.transaction_hash = dogecoin_output_addresses.transaction_hash)
    ,
    litecoin_block_base as (
    select
    "litecoin" as coin_id
    ,`hash` as block_hash
    ,size as block_size
    ,number as block_number
    ,timestamp as block_timestamp
    ,transaction_count
    FROM `bigquery-public-data.crypto_litecoin.blocks`)
    ,
    litecoin_transaction_base as (
    select
    `hash` as transaction_hash
    ,size as transaction_size
    ,block_hash
    ,block_number
    ,block_timestamp
    ,input_count
    ,output_count
    ,input_value
    ,output_value
    ,is_coinbase
    ,fee
    FROM `bigquery-public-data.crypto_litecoin.transactions`)
    ,
    litecoin_input_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,spent_transaction_hash
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_litecoin.inputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_litecoin.inputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    litecoin_output_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_litecoin.outputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_litecoin.outputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    full_litecoin as(
    select
    litecoin_block_base.coin_id
    ,litecoin_block_base.block_hash
    ,litecoin_block_base.block_size
    ,litecoin_block_base.block_number
    ,litecoin_block_base.block_timestamp
    ,litecoin_block_base.transaction_count
    ,litecoin_transaction_base.transaction_hash
    ,litecoin_transaction_base.transaction_size
    ,litecoin_transaction_base.input_count
    ,litecoin_transaction_base.output_count
    ,litecoin_transaction_base.input_value
    ,litecoin_transaction_base.output_value
    ,litecoin_transaction_base.is_coinbase
    ,litecoin_transaction_base.fee
    ,litecoin_input_addresses.spent_transaction_hash
    ,litecoin_input_addresses.addresses as input_addresses
    ,litecoin_input_addresses.addresses_offset as input_addresses_offset
    ,litecoin_input_addresses.value as input_address_value
    ,litecoin_output_addresses.addresses as output_addresses
    ,litecoin_output_addresses.addresses_offset as output_addresses_offset
    ,litecoin_output_addresses.value as output_address_value

    FROM litecoin_block_base
    INNER JOIN litecoin_transaction_base
    ON litecoin_block_base.block_hash = litecoin_transaction_base.block_hash
    INNER JOIN litecoin_input_addresses
    ON litecoin_transaction_base.transaction_hash = litecoin_input_addresses.transaction_hash
    INNER JOIN litecoin_output_addresses
    ON litecoin_transaction_base.transaction_hash = litecoin_output_addresses.transaction_hash)


    select
    *
    FROM full_bitcoin
    UNION ALL
    select
    *
    FROM full_bitcoin_cash
    UNION ALL
    select
    *
    FROM full_dogecoin
    UNION ALL
    select
    *
    FROM full_litecoin
    ;;
  }

    dimension: coin_id{
      primary_key: no
      description: "Type of coin"
      type: string
      sql: ${TABLE}.coin_id ;;
      link: {
        label: "Filtered Coin Data by ID"
        url: "https://b772aff5-4b93-454c-9b34-147289eb2172.looker.app/dashboards/RZbF4ReRz00O3655QMLfG7?ID={{value}}"
      }
    }
    dimension: block_hash{
      primary_key: no
      type: string
      description: "Hash of this block"
      sql: ${TABLE}.block_hash ;;
    }
    dimension: block_size{
      type: number
      description: "The size of block data in bytes"
      sql: ${TABLE}.block_size ;;
    }
    dimension: block_number{
      type: number
      description: "The number of the block"
      sql: ${TABLE}.block_number ;;
    }
    dimension_group:  block_timestamp{
      type: time
      description: "Block creation timestamp specified in block header"
      timeframes: [raw, time, date, week, month, quarter, year]
      sql: ${TABLE}.block_timestamp ;;
    }
    dimension: transaction_count{
      type: number
      description: "Number of transactions included in this block"
      sql: ${TABLE}.transaction_count ;;
    }
    measure: avg_transaction_count {
      type: average
      label: "Average Transaction Count"
      sql: ${transaction_count} ;;
    }
    measure: count {
      type: count
      drill_fields: [block_hash, transaction_hash, block_number, transaction_count, coin_id, block_size, transaction_size, output_value, input_count, input_value, fee ]
    }
    dimension: transaction_hash{
      primary_key: no
      type: string
      description: "The hash of this transaction"
      sql: ${TABLE}.transaction_hash ;;
    }
    dimension: transaction_size{
      type: number
      description: "The size of this transaction in bytes"
      sql: ${TABLE}.transaction_size ;;
    }
    dimension:  input_count{
      type: number
      description: "The number of inputs in the transaction"
      sql: ${TABLE}.input_count ;;
    }
    dimension:  output_count{
      type: number
      description: "The number of outputs in the transaction"
      sql: ${TABLE}.output_count ;;
    }
    dimension:  input_value{
      type: number
      description: "Total value of inputs in the transaction"
      sql: ${TABLE}.input_value ;;
    }
    measure: avg_input_value {
      type: average
      label: "Average Input Value"
      description: "Average Input Value"
      sql: ${input_value} ;;
    }
    dimension: output_value{
      type: number
      description: "Total value of outputs in the transaction"
      sql: ${TABLE}.output_value ;;
    }
    measure: avg_output_value {
      type: average
      label: "Average Output Value"
      description: "Average output value"
      sql: ${output_value} ;;
    }
    dimension: is_coinbase{
      type: yesno
      description: "true if this transaction is a coinbase transaction"
      sql: ${TABLE}.is_coinbase ;;
    }
    dimension: fee{
      type: number
      description: "The fee paid by this transaction"
      sql: ${TABLE}.fee ;;
    }
    dimension: spent_transaction_hash{
      type: string
      description: "The hash of the transaction which contains the output that this input spends"
      sql: spent_transaction_hash ;;
    }
    dimension: input_addresses{
      type: string
      description: "Addresses which own the spent output"
      sql: ${TABLE}.input_addresses ;;
    }
    dimension: input_addresses_offset{
      type: number
      hidden: yes
      sql: ${TABLE}.input_addresses_offset ;;
    }
    dimension:  input_address_value{
      type: number
      description: "The value in base currency attached to the spent output"
      sql: ${TABLE}.input_addresses_value ;;
    }
    dimension: output_addresses{
      type: string
      description: "Addresses which own this output"
      sql: ${TABLE}.outputs__addresses ;;
    }
    dimension: output_addresses_offset{
      type: number
      hidden: yes
      sql: ${TABLE}.output_addresses_offset ;;
    }
    dimension: output_address_value{
      type: number
      description: "The value in base currency attached to this output"
      sql: ${TABLE}.output_address_value ;;
    }













}
