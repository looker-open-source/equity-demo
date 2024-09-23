view: stock_history_with_date_crossjoin {
  view_label: "Historic Stock Info"
  derived_table: {

    datagroup_trigger: history
    sql: with date_cte as
          (SELECT day
          FROM UNNEST(
          GENERATE_DATE_ARRAY(DATE('2023-06-18'), DATE('2025-06-21'), INTERVAL 1 DAY)
          ) AS day )
          ,
          date_and_id_cte as (
          SELECT
          distinct day
          ,id
          FROM `@{database}.crypto_mvp.stock_history`
          CROSS JOIN date_cte
          )
          ,
          date_unnested as (
        SELECT
        id
        ,DATE(TIMESTAMP(history_date)) AS history_date
        ,date_offset
        FROM
        `@{database}.crypto_mvp.stock_history`
        LEFT JOIN UNNEST(`@{database}.crypto_mvp.stock_history`.`Date`) as history_date WITH OFFSET as date_offset
      )
      ,
      open_unnested as (
        SELECT
        id
        , CAST(open AS NUMERIC) AS open
        ,open_offset
        FROM
        `@{database}.crypto_mvp.stock_history`
        LEFT JOIN UNNEST(`@{database}.crypto_mvp.stock_history`.`Open`) as open WITH OFFSET as open_offset
      )
      ,
      high_unnested as(
      SELECT
        id
        ,CAST(high AS NUMERIC) AS high
        ,high_offset
        FROM
        `@{database}.crypto_mvp.stock_history`
        LEFT JOIN UNNEST(`@{database}.crypto_mvp.stock_history`.`High`) as high WITH OFFSET as high_offset
      )
      ,
      low_unnested as (
      SELECT
        id
        ,CAST(low as NUMERIC) AS low
        ,low_offset
        FROM
        `@{database}.crypto_mvp.stock_history`
        LEFT JOIN UNNEST(`@{database}.crypto_mvp.stock_history`.`Low`) as low WITH OFFSET as low_offset
      )
      ,
      close_unnested as (
        SELECT
        id
        ,CAST(close AS NUMERIC) AS close
        ,close_offset
        FROM
        `@{database}.crypto_mvp.stock_history`
        LEFT JOIN UNNEST(`@{database}.crypto_mvp.stock_history`.`Close`) as close WITH OFFSET as close_offset
      )
      ,
      volume_unnested as (
        SELECT
        id
        ,CAST(volume AS INTEGER) AS volume
        ,volume_offset
        FROM
        `@{database}.crypto_mvp.stock_history`
        LEFT JOIN UNNEST(`@{database}.crypto_mvp.stock_history`.`Volume`) as volume WITH OFFSET as volume_offset
      )

      SELECT

      date_and_id_cte.id
      ,date_and_id_cte.day
# ,date_unnested.id
      ,date_unnested.history_date
      ,date_unnested.date_offset
      ,open_unnested.open
      ,open_unnested.open_offset
      ,high_unnested.high
      ,high_unnested.high_offset
      ,low_unnested.low
      ,low_unnested.low_offset
      ,close_unnested.close
      ,close_unnested.close_offset
      ,volume_unnested.volume
      ,volume_unnested.volume_offset

      FROM
      -- date_cte
      date_and_id_cte
      INNER JOIN date_unnested
      ON date_and_id_cte.day = date_unnested.history_date AND date_and_id_cte.id = date_unnested.id
      INNER JOIN open_unnested
      ON date_and_id_cte.id = open_unnested.id AND date_unnested.date_offset = open_unnested.open_offset
      INNER JOIN high_unnested
      ON date_and_id_cte.id = high_unnested.id AND date_unnested.date_offset = high_unnested.high_offset
      INNER JOIN low_unnested
      ON date_and_id_cte.id = low_unnested.id AND date_unnested.date_offset = low_unnested.low_offset
      INNER JOIN close_unnested
      ON date_and_id_cte.id = close_unnested.id AND date_unnested.date_offset = close_unnested.close_offset
      INNER JOIN volume_unnested
      ON date_and_id_cte.id = volume_unnested.id AND date_unnested.date_offset = volume_unnested.volume_offset ;;
  }


  dimension: id {
    label: "Symbol"
    description: "Equity Symbol (ticker)"
    type: string
    sql: ${TABLE}.id ;;
    link: {
      label: "View on Yahoo Finance"
      url: "https://finance.yahoo.com/quote/{{value}}/"
    }
  }
  dimension: day {
    hidden: yes
    type: string
    sql: ${TABLE}.day ;;
  }
  dimension_group: date_selection {
    label: "Historic"
    type: time
    timeframes: [date, week, month, year]
    datatype: date
    sql: ${TABLE}.day;;
  }
  dimension: date_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.date_offset ;;
  }
  dimension: open {
    group_label: "Historic Data"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.open ;;
  }
  dimension: open_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.open_offset ;;
  }
  dimension: close {
    group_label: "Historic Data"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.close ;;
  }
  dimension: close_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.close_offset ;;
  }
  dimension: high {
    group_label: "Historic Data"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.high ;;
  }
  dimension: high_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.high_offset ;;
  }
  dimension: low {
    group_label: "Historic Data"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.low ;;
  }
  dimension: low_offset {
    hidden: yes
    type: number
    sql:  ${TABLE}.low_offset ;;
  }
  dimension: volume {
    group_label: "Historic Data"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.volume ;;
  }
  dimension: volume_offset {
    hidden: yes
    type: number
    sql: ${TABLE}.volume_offset ;;
  }


}
