view: full_public_dataset {
  derived_table: {
    increment_key: "real_block_timestamp_date"
    increment_offset: 1
    datagroup_trigger: history
    # cluster_keys: [ "coin_id"]
    partition_keys: [ "block_timestamp" ]
    sql:with bitcoin_block_base as (
    select
    "bitcoin" as coin_id
    ,`hash` as block_hash
    ,size as block_size
    ,number as block_number
    ,timestamp as real_block_timestamp
    ,timestamp_month as block_timestamp
    ,transaction_count
    FROM `bigquery-public-data.crypto_bitcoin.blocks`)
    ,
    bitcoin_transaction_base as (
    select
    `hash` as transaction_hash
    ,size as transaction_size
    ,block_hash
    ,block_number
    ,block_timestamp as real_block_timestamp
    ,block_timestamp_month as block_timestamp
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
    ,bitcoin_block_base.real_block_timestamp
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
    ,timestamp as real_block_timestamp
    ,timestamp_month as block_timestamp
    ,transaction_count
    FROM `bigquery-public-data.crypto_bitcoin_cash.blocks`)
    ,
    bitcoin_cash_transaction_base as (
    select
    `hash` as transaction_hash
    ,size as transaction_size
    ,block_hash
    ,block_number
    ,block_timestamp as real_block_timestamp
    ,block_timestamp_month as block_timestamp
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
    ,bitcoin_cash_block_base.real_block_timestamp
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
    ,timestamp as real_block_timestamp
    ,timestamp_month as block_timestamp
    ,transaction_count
    FROM `bigquery-public-data.crypto_dogecoin.blocks`)
    ,
    dogecoin_transaction_base as (
    select
    `hash` as transaction_hash
    ,size as transaction_size
    ,block_hash
    ,block_number
    ,block_timestamp as real_block_timestamp
    ,block_timestamp_month as block_timestamp
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
    ,dogecoin_block_base.real_block_timestamp
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
    ,timestamp as real_block_timestamp
    ,timestamp_month as block_timestamp
    ,transaction_count
    FROM `bigquery-public-data.crypto_litecoin.blocks`)
    ,
    litecoin_transaction_base as (
    select
    `hash` as transaction_hash
    ,size as transaction_size
    ,block_hash
    ,block_number
    ,block_timestamp as real_block_timestamp
    ,block_timestamp_month as block_timestamp
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
    ,litecoin_block_base.real_block_timestamp
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
    ,
    dash_block_base as (
    select
    "dash" as coin_id
    ,`hash` as block_hash
    ,size as block_size
    ,number as block_number
    ,timestamp as real_block_timestamp
    ,timestamp_month as block_timestamp
    ,transaction_count
    FROM `bigquery-public-data.crypto_dash.blocks`)
    ,
    dash_transaction_base as (
    select
    `hash` as transaction_hash
    ,size as transaction_size
    ,block_hash
    ,block_number
    ,block_timestamp as real_block_timestamp
    ,block_timestamp_month as block_timestamp
    ,input_count
    ,output_count
    ,input_value
    ,output_value
    ,is_coinbase
    ,fee
    FROM `bigquery-public-data.crypto_dash.transactions`)
    ,
    dash_input_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,spent_transaction_hash
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_dash.inputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_dash.inputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    dash_output_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_dash.outputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_dash.outputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    full_dash as(
    select
    dash_block_base.coin_id
    ,dash_block_base.block_hash
    ,dash_block_base.block_size
    ,dash_block_base.block_number
    ,dash_block_base.real_block_timestamp
    ,dash_block_base.block_timestamp
    ,dash_block_base.transaction_count
    ,dash_transaction_base.transaction_hash
    ,dash_transaction_base.transaction_size
    ,dash_transaction_base.input_count
    ,dash_transaction_base.output_count
    ,dash_transaction_base.input_value
    ,dash_transaction_base.output_value
    ,dash_transaction_base.is_coinbase
    ,dash_transaction_base.fee
    ,dash_input_addresses.spent_transaction_hash
    ,dash_input_addresses.addresses as input_addresses
    ,dash_input_addresses.addresses_offset as input_addresses_offset
    ,dash_input_addresses.value as input_address_value
    ,dash_output_addresses.addresses as output_addresses
    ,dash_output_addresses.addresses_offset as output_addresses_offset
    ,dash_output_addresses.value as output_address_value

    FROM dash_block_base
    INNER JOIN dash_transaction_base
    ON dash_block_base.block_hash = dash_transaction_base.block_hash
    INNER JOIN dash_input_addresses
    ON dash_transaction_base.transaction_hash = dash_input_addresses.transaction_hash
    INNER JOIN dash_output_addresses
    ON dash_transaction_base.transaction_hash = dash_output_addresses.transaction_hash)
    ,
    zcash_block_base as (
    select
    "zcash" as coin_id
    ,`hash` as block_hash
    ,size as block_size
    ,number as block_number
    ,timestamp as real_block_timestamp
    ,timestamp_month as block_timestamp
    ,transaction_count
    FROM `bigquery-public-data.crypto_zcash.blocks`)
    ,
    zcash_transaction_base as (
    select
    `hash` as transaction_hash
    ,size as transaction_size
    ,block_hash
    ,block_number
    ,block_timestamp as real_block_timestamp
    ,block_timestamp_month as block_timestamp
    ,input_count
    ,output_count
    ,input_value
    ,output_value
    ,is_coinbase
    ,fee
    FROM `bigquery-public-data.crypto_zcash.transactions`)
    ,
    zcash_input_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,spent_transaction_hash
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_zcash.inputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_zcash.inputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    zcash_output_addresses as (
    select
    transaction_hash
    ,block_hash
    ,block_number
    ,block_timestamp
    ,addresses
    ,addresses_offset
    ,value
    FROM `bigquery-public-data.crypto_zcash.outputs`
    LEFT JOIN UNNEST(`bigquery-public-data.crypto_zcash.outputs`.addresses) as addresses WITH OFFSET as addresses_offset)
    ,
    full_zcash as(
    select
    zcash_block_base.coin_id
    ,zcash_block_base.block_hash
    ,zcash_block_base.block_size
    ,zcash_block_base.block_number
    ,zcash_block_base.real_block_timestamp
    ,zcash_block_base.block_timestamp
    ,zcash_block_base.transaction_count
    ,zcash_transaction_base.transaction_hash
    ,zcash_transaction_base.transaction_size
    ,zcash_transaction_base.input_count
    ,zcash_transaction_base.output_count
    ,zcash_transaction_base.input_value
    ,zcash_transaction_base.output_value
    ,zcash_transaction_base.is_coinbase
    ,zcash_transaction_base.fee
    ,zcash_input_addresses.spent_transaction_hash
    ,zcash_input_addresses.addresses as input_addresses
    ,zcash_input_addresses.addresses_offset as input_addresses_offset
    ,zcash_input_addresses.value as input_address_value
    ,zcash_output_addresses.addresses as output_addresses
    ,zcash_output_addresses.addresses_offset as output_addresses_offset
    ,zcash_output_addresses.value as output_address_value

    FROM zcash_block_base
    INNER JOIN zcash_transaction_base
    ON zcash_block_base.block_hash = zcash_transaction_base.block_hash
    INNER JOIN zcash_input_addresses
    ON zcash_transaction_base.transaction_hash = zcash_input_addresses.transaction_hash
    INNER JOIN zcash_output_addresses
    ON zcash_transaction_base.transaction_hash = zcash_output_addresses.transaction_hash)





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
     UNION ALL
    select
    *
    FROM full_dash
    UNION ALL
     select
    *
    FROM full_zcash
    ;;
  }

    dimension: coin_id{
      label: "Chain"
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
      value_format: "0.000,,\" M\""
      description: "The size of block data in bytes"
      sql: CAST(${TABLE}.block_size as NUMERIC) ;;
    }
    dimension: block_number{
      type: string
      description: "The number of the block"
      sql: ${TABLE}.block_number ;;
    }
    dimension_group:  real_block_timestamp{
      label: "Timestamp"
      type: time
      description: "Block creation timestamp specified in block header"
      timeframes: [raw, date, week, month, quarter, year]
      sql: CAST(${TABLE}.real_block_timestamp as TIMESTAMP);;
    }
  dimension_group: block_timestamp {
    hidden: yes
    type: time
    description: "Month of the block which contains this transaction"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: CAST(${TABLE}.block_timestamp as TIMESTAMP) ;;
  }
    dimension: transaction_count{
      type: number
      value_format: "#,##0"
      description: "Number of transactions included in this block"
      sql: CAST(${TABLE}.transaction_count as INT64) ;;
    }
    measure: avg_transaction_count {
      type: average
      value_format: "#,##0"
      label: "Average Transaction Count"
      sql:CAST( ${transaction_count} as INT64);;
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
      value_format: "#,##0"
      description: "The size of this transaction in bytes"
      sql: CAST(${TABLE}.transaction_size as INT64) ;;
    }
    dimension:  input_count{
      type: number
      description: "The number of inputs in the transaction"
      sql: CAST(${TABLE}.input_count as INT64) ;;
    }
    dimension:  output_count{
      type: number
      description: "The number of outputs in the transaction"
      sql: CAST (${TABLE}.output_count as INT64) ;;
    }
    dimension:  input_value{
      type: number
      value_format: "$#,##0.00;($#,##0.00)"
      description: "Total value of inputs in the transaction"
      sql: CAST(${TABLE}.input_value as NUMERIC) ;;
    }
    measure: avg_input_value {
      type: average
      value_format: "$#,##0.00;($#,##0.00)"
      label: "Average Input Value"
      description: "Average Input Value"
      sql: ${input_value} ;;
    }
    dimension: output_value{
      type: number
      value_format: "$#,##0.00;($#,##0.00)"
      description: "Total value of outputs in the transaction"
      sql: CAST(${TABLE}.output_value as NUMERIC) ;;
    }
    measure: avg_output_value {
      type: average
      value_format: "$#,##0.00;($#,##0.00)"
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
      value_format: "$#,##0.00;($#,##0.00)"
      description: "The fee paid by this transaction"
      sql: CAST(${TABLE}.fee as NUMERIC) ;;
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
      sql: CAST(${TABLE}.input_addresses_offset as INT64) ;;
    }
    dimension:  input_address_value{
      type: number
      value_format: "$#,##0.00;($#,##0.00)"
      description: "The value in base currency attached to the spent output"
      sql: CAST(${TABLE}.input_addresses_value as NUMERIC) ;;
    }
    dimension: output_addresses{
      type: string
      description: "Addresses which own this output"
      sql: ${TABLE}.outputs__addresses ;;
    }
    dimension: output_addresses_offset{
      type: number
      hidden: yes
      sql: CAST(${TABLE}.output_addresses_offset AS INT64) ;;
    }
    dimension: output_address_value{
      type: number
      value_format: "$#,##0.00;($#,##0.00)"
      description: "The value in base currency attached to this output"
      sql: CAST(${TABLE}.output_address_value as NUMERIC) ;;
    }













}
