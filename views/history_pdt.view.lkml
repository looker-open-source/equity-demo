view: history_pdt {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  #
  derived_table: {
    sql:SELECT
    id
    ,prices_amount
    ,prices_epoch_time
    # ,market_caps_amount
    # ,market_caps_epoch_time
    # ,total_volumes_amount
    # ,total_volumes_epoch_time
    FROM `kirby-looker-core-argolis.crypto_mvp.history`
    LEFT JOIN UNNEST(prices.amount) as prices_amount
    LEFT JOIN UNNEST(prices.epoch_time) as prices_epoch_time
    # LEFT JOIN UNNEST(market_caps.amount) as market_caps_amount
    # LEFT JOIN UNNEST(market_caps.epoch_time) as market_caps_epoch_time
    # LEFT JOIN UNNEST(total_volumes.amount) as total_volumes_amount
    # LEFT JOIN UNNEST(total_volumes.epoch_time) as total_volumes_epoch_time
    WHERE id = "bitcoin";;
  }

  dimension: id {
    primary_key: yes
    type: string
    description: "Coin ID"
    sql: ${TABLE}.id ;;
  }

  dimension: price {
    group_label: "Prices"
    type: number
    description: "Price"
    sql: ${TABLE}.prices_amount ;;
  }
  dimension: price_epoch {
    hidden: yes
    type: string
    # description: "Market Cap"
    sql: ${TABLE}.prices_epoch_time ;;
  }
  dimension: date {
    type: date
    sql: DATE(TIMESTAMP_MILLIS(${price_epoch})) ;;
  }
}
