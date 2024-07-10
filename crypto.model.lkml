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


datagroup: history {
  max_cache_age: "24 hours"
  interval_trigger: "24 hours"
  label: "History PDT datagroup"
  description: "Datagroup for history with date crossjoin PDT"
}
