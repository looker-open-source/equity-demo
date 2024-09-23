view: history_with_date_crossjoin {
  derived_table: {
    datagroup_trigger: history
    sql: with date_cte as
      (SELECT day
      FROM UNNEST(
          GENERATE_DATE_ARRAY(DATE('2023-06-18'), DATE('2026-06-21'), INTERVAL 1 DAY)
      ) AS day )
      ,

      date_and_id_cte as (
      SELECT
      id
      ,day
      FROM `@{database}.crypto_mvp.history`
      CROSS JOIN date_cte
      )
      ,
      price_date_unnested as (
      SELECT
      id
      ,DATE(TIMESTAMP_MILLIS(prices_epoch_time)) AS price_date
      ,prices_epoch_offset
      FROM
      `@{database}.crypto_mvp.history`
      LEFT JOIN UNNEST(`@{database}.crypto_mvp.history`.prices.epoch_time) as prices_epoch_time WITH OFFSET as prices_epoch_offset
      )
      ,
      price_amount_unnested as (
      SELECT
      id
      ,prices_amount
      ,prices_amount_offset
      FROM
      `@{database}.crypto_mvp.history`
      LEFT JOIN UNNEST(`@{database}.crypto_mvp.history`.prices.amount) as prices_amount WITH OFFSET as prices_amount_offset

      )
      ,
      market_cap_amount_unnested as (
      SELECT
      id
      ,market_caps_amount
      ,market_caps_amount_offset
      FROM
      `@{database}.crypto_mvp.history`
      LEFT JOIN UNNEST(`@{database}.crypto_mvp.history`.market_caps.amount) as market_caps_amount WITH OFFSET as market_caps_amount_offset
      )
      ,
      total_volumes_amount_unnested as (
      SELECT
      id
      ,total_volumes_amount
      ,total_volumes_amount_offset
      FROM
      `@{database}.crypto_mvp.history`
      LEFT JOIN UNNEST(`@{database}.crypto_mvp.history`.total_volumes.amount) as total_volumes_amount WITH OFFSET as total_volumes_amount_offset
      )

      SELECT
      date_and_id_cte.id
      ,date_and_id_cte.day
      ,price_date_unnested.price_date
      ,price_date_unnested.prices_epoch_offset
      ,price_amount_unnested.prices_amount
      ,price_amount_unnested.prices_amount_offset
      ,market_cap_amount_unnested.market_caps_amount
      ,market_cap_amount_unnested.market_caps_amount_offset
      ,total_volumes_amount_unnested.total_volumes_amount
      ,total_volumes_amount_unnested.total_volumes_amount_offset
      FROM date_and_id_cte
      INNER JOIN price_date_unnested
      ON date_and_id_cte.id = price_date_unnested.id AND date_and_id_cte.day = price_date_unnested.price_date
      INNER JOIN price_amount_unnested
      ON date_and_id_cte.id = price_amount_unnested.id AND price_date_unnested.prices_epoch_offset = price_amount_unnested.prices_amount_offset
      INNER JOIN market_cap_amount_unnested
      ON date_and_id_cte.id = market_cap_amount_unnested.id AND price_amount_unnested.prices_amount_offset = market_cap_amount_unnested.market_caps_amount_offset
      INNER JOIN total_volumes_amount_unnested
      ON date_and_id_cte.id = total_volumes_amount_unnested.id AND market_cap_amount_unnested.market_caps_amount_offset = total_volumes_amount_unnested.total_volumes_amount_offset
      ;;
  }
  dimension: coin_id {
    description: "Coin ID"
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension_group: history_date {
    type: time
    timeframes: [date, week, month, year]
    datatype: date
    sql: ${TABLE}.day;;
  }
  parameter: history_granularity {
    # hidden: yes
    type: unquoted
    allowed_value: { label: "Date" value: "date" }
    allowed_value: { label: "Week" value: "week" }
    allowed_value: { label: "Month" value: "month" }
    allowed_value: { label: "Year" value: "year" }
  }
  dimension: history_date_granularity {
    description: "Use this in conjunction with the Timeframe filter"
    sql:
      {% if history_granularity._parameter_value == 'date' %} ${history_date_date}
      {% elsif history_granularity._parameter_value == 'week' %} ${history_date_week}
      {% elsif history_granularity._parameter_value == 'month' %} ${history_date_month}
      {% elsif history_granularity._parameter_value == 'year' %} ${history_date_year}

      {% else %} ${history_date_date}
      {% endif %};;
  }
  dimension: price_date {
    hidden: yes
    type: date
    sql: ${TABLE}.price_date ;;
  }
  dimension: prices_epoch_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.prices_epoch_offset ;;
  }
  dimension: price {
    description: "Price information for given date"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.prices_amount ;;
  }
  dimension: price_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.prices_amount_offset ;;
  }
  dimension: market_cap {
    description: "Market cap information for given date"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.market_caps_amount ;;
  }
  dimension: market_cap_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.market_caps_amount_offset ;;
  }
  dimension: total_volume {
    description: "Total volume information for given date"
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.total_volumes_amount ;;
  }
  dimension: total_volume_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.total_volumes_amount_offset ;;
  }

}
