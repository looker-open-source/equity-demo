connection: "@{database}"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: full_public_dataset {
  label: "Wallet Data"
}

explore: stock_info {
  label: "Equity Information"
  join: stock_history_with_date_crossjoin {
    relationship: one_to_many
    sql_on: ${stock_info.id} = ${stock_history_with_date_crossjoin.id} ;;
  }
}




datagroup: history {
  max_cache_age: "24 hours"
  interval_trigger: "24 hours"
  label: "History PDT datagroup"
  description: "Datagroup for history with date crossjoin PDT"
}
