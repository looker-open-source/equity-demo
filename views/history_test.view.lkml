#Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: history_test {
#   hidden: yes
#     join: history_test__date {
#       view_label: "History Test: Date"
#       sql: LEFT JOIN UNNEST(${history_test.date}) as history_test__date ;;
#       relationship: one_to_many
#     }
#     join: history_test__price {
#       view_label: "History Test: Price"
#       sql: LEFT JOIN UNNEST(${history_test.price}) as history_test__price ;;
#       relationship: one_to_many
#     }
#     join: history_test__market_cap {
#       view_label: "History Test: Market Cap"
#       sql: LEFT JOIN UNNEST(${history_test.market_cap}) as history_test__market_cap ;;
#       relationship: one_to_many
#     }
# }
view: history_test {
  sql_table_name: `kirby-looker-core-argolis.crypto_mvp.history_test` ;;

  dimension: crypto_id {
    type: string
    sql: ${TABLE}.crypto_id ;;
  }
  dimension: date {
    hidden: yes
    sql: ${TABLE}.date ;;
  }
  dimension: market_cap {
    hidden: yes
    sql: ${TABLE}.market_cap ;;
  }
  dimension: price {
    hidden: yes
    sql: ${TABLE}.price ;;
  }
  measure: count {
    type: count
  }
}

view: history_test__date {

  dimension: history_test__date {
    type: number
    sql: history_test__date ;;
  }
}

view: history_test__price {

  dimension: history_test__price {
    type: number
    sql: history_test__price ;;
  }
}

view: history_test__market_cap {

  dimension: history_test__market_cap {
    type: number
    sql: history_test__market_cap ;;
  }
}
