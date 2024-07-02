connection: "kirby-looker-core-argolis"

# include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

#creating a test explore with one view for now
explore: full_public_dataset {
  label: "Wallet Data"
  # join: bitcoin_transactions {
  #   relationship: one_to_many
  #   sql_on: ${bitcoin_blocks.hash} = ${bitcoin_transactions.block_hash} ;;
  # }
  # join: bitcoin_inputs {
  #     view_label: "Bitcoin: Inputs"
  #     sql: LEFT JOIN UNNEST(${bitcoin_transactions.inputs}) as bitcoin_inputs ;;
  #     relationship: one_to_many
  # }
  # join: bitcoin_outputs {
  #     view_label: "Bitcoin: Outputs"
  #     sql: LEFT JOIN UNNEST(${bitcoin_transactions.outputs}) as bitcoin_outputs ;;
  #     relationship: one_to_many
  # }
  # join: bitcoin_inputs_addresses {
  #     view_label: "Transactions: Inputs Addresses"
  #     sql: LEFT JOIN UNNEST(${bitcoin_inputs.addresses}) as bitcoin_inputs_addresses ;;
  #     relationship: one_to_many
  # }
  # join: bitcoin_outputs_addresses {
  #     view_label: "Transactions: Outputs Addresses"
  #     sql: LEFT JOIN UNNEST(${bitcoin_outputs.addresses}) as bitcoin_outputs_addresses ;;
  #     relationship: one_to_many
  # }
}
explore: market_data {
  label: "Coin Data"
  join: history_with_date_crossjoin {
    relationship: one_to_many
    sql_on: ${market_data.id} = ${history_with_date_crossjoin.coin_id} ;;
  }
}

#explore: history_with_date_crossjoin {
  #label: "Historical Coin Data"
#}
datagroup: history {
  max_cache_age: "24 hours"
  #sql_trigger: SELECT max(${TABLE}.day) FROM history_with_date_crossjoin ;;
  interval_trigger: "24 hours"
  label: "History PDT datagroup"
  description: "Datagroup for history with date crossjoin PDT"
}
