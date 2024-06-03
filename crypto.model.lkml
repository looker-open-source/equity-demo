connection: "looker-private-demo"

# include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
#creating a test explore with one view for now
explore: bitcoin_blocks {
  label: "Coin Data"
  join: bitcoin_transactions {
    relationship: one_to_many
    sql_on: ${bitcoin_blocks.hash} = ${bitcoin_transactions.block_hash} ;;
  }
  join: bitcoin_inputs {
      view_label: "Bitcoin: Inputs"
      sql: LEFT JOIN UNNEST(${bitcoin_transactions.inputs}) as bitcoin_inputs ;;
      relationship: one_to_many
  }
  join: bitcoin_outputs {
      view_label: "Bitcoin: Outputs"
      sql: LEFT JOIN UNNEST(${bitcoin_transactions.outputs}) as bitcoin_outputs ;;
      relationship: one_to_many
  }
  join: bitcoin_inputs_addresses {
      view_label: "Transactions: Inputs Addresses"
      sql: LEFT JOIN UNNEST(${bitcoin_inputs.addresses}) as bitcoin_inputs_addresses ;;
      relationship: one_to_many
  }
  join: bitcoin_outputs_addresses {
      view_label: "Transactions: Outputs Addresses"
      sql: LEFT JOIN UNNEST(${bitcoin_outputs.addresses}) as bitcoin_outputs_addresses ;;
      relationship: one_to_many
  }
}
explore: market_data {
  label: "Market Data"
}

# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: bigquerypublicdata_crypto_bitcoin_transactions {
#   hidden: yes
#
# }
