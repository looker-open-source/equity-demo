connection: "kirby-looker-core-argolis"

# include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: full_public_dataset {
  label: "Wallet Data"
}
explore: market_data {
  label: "Coin Data"
  join: history_with_date_crossjoin {
    relationship: one_to_many
    sql_on: ${market_data.id} = ${history_with_date_crossjoin.coin_id} ;;
  }
}

explore: stock_info {
  label: "Equity Information"
  join: stock_history_with_date_crossjoin {
    relationship: one_to_many
    sql_on: ${stock_info.id} = ${stock_history_with_date_crossjoin.id} ;;
  }
}

#explore: stock_history_with_date_crossjoin {}
# explore: bigquerypublicdata_crypto_litecoin_transactions{
#   label: "Test"
#   join: crypto_bitcoin_transactions {
#     type: full_outer
#     relationship: many_to_many
#     sql_on: ${bigquerypublicdata_crypto_litecoin_transactions.block_timestamp_} = ${crypto_bitcoin_transactions.block_timestamp_date} ;;
#   }
# }


datagroup: history {
  max_cache_age: "24 hours"
  interval_trigger: "24 hours"
  label: "History PDT datagroup"
  description: "Datagroup for history with date crossjoin PDT"
}
