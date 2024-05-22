view: band_protocol_logic {
  derived_table: {
    sql:WITH parsed_aggregator_oracle_requests AS (
    SELECT ARRAY(
        SELECT JSON_EXTRACT_SCALAR(symbol_as_json, '$')
        FROM UNNEST(JSON_EXTRACT_ARRAY(decoded_result.calldata, "$.symbols")) AS symbol_as_json
    ) AS symbols,
    CAST(JSON_EXTRACT_SCALAR(decoded_result.calldata, "$.multiplier") AS FLOAT64) AS multiplier,
    ARRAY(
        SELECT CAST(JSON_EXTRACT_SCALAR(rate_as_json, '$') AS FLOAT64)
        FROM UNNEST(JSON_EXTRACT_ARRAY(decoded_result.result, "$.rates")) AS rate_as_json
    ) AS rates,
    block_timestamp_truncated,
    oracle_request_id,
    FROM `public-data-finance.crypto_band.oracle_requests`
    WHERE request.oracle_script_id = 3 --need to look into why 3 is plugged in here
      AND decoded_result.calldata IS NOT NULL
      AND decoded_result.result IS NOT NULL
    ),
    -- zip symbols and rates
    zipped_rates AS (
        SELECT block_timestamp_truncated,
            oracle_request_id,
            struct(symbol, rates[OFFSET(off)] AS rate) AS zipped,
            multiplier,
        FROM parsed_aggregator_oracle_requests,
            UNNEST(symbols) AS symbol WITH OFFSET off
        WHERE ARRAY_LENGTH(symbols) = ARRAY_LENGTH(rates)
    ),
    -- adjust for multiplier
    adjusted_rates AS (
        SELECT
            block_timestamp_truncated,
            oracle_request_id,
            struct(zipped.symbol, IEEE_DIVIDE(zipped.rate, multiplier) AS rate) AS zipped,
        FROM zipped_rates
    )
    SELECT
        block_timestamp_truncated,
        oracle_request_id,
        zipped.symbol AS symbol,
        zipped.rate AS rate,
    FROM adjusted_rates
--WHERE zipped.symbol = 'ETH'
    ORDER BY block_timestamp_truncated DESC  ;;
    }
dimension: block_timestamp_truncated {
  type: string
  sql: ${TABLE}.block_timestamp_truncated ;;
}
dimension: oracle_request_id {
  primary_key: yes
  type: number
  sql: ${TABLE}.oracle_request_id ;;
}
dimension: symbol {
  type: string
  sql: ${TABLE}.symbol ;;
}
dimension: rate {
  type: number
  sql: ${TABLE}.rate ;;
}
}
