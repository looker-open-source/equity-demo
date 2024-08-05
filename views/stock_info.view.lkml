view: stock_info {
  sql_table_name: `kirby-looker-core-argolis.crypto_mvp.stock_info` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: 52_week_change {
    label: "Fifty-two Week Change"
    description: "Percentage change in the company's stock price over the last fifty-two weeks"
    type: string
    sql: ${TABLE}.`52WeekChange` ;;
  }
  dimension: address {
    description: "Street address"
    group_label: "Contact Information"
    type: string
    sql: ${TABLE}.address1 ;;
  }
  dimension: ask {
    type: string
    sql: ${TABLE}.ask ;;
  }
  dimension: ask_size {
    type: string
    sql: ${TABLE}.askSize ;;
  }
  dimension: audit_risk {
    group_label: "Risk data"
    type: string
    sql: ${TABLE}.auditRisk ;;
  }
  dimension: average_daily_volume10_day {
    type: string
    sql: ${TABLE}.averageDailyVolume10Day ;;
  }
  dimension: average_volume {
    type: string
    description: "Average volume over the last 24 hours"
    sql: ${TABLE}.averageVolume ;;
  }
  dimension: average_volume10days {
    type: string
    sql: ${TABLE}.averageVolume10days ;;
  }
  dimension: beta {
    type: string
    sql: ${TABLE}.beta ;;
  }
  dimension: bid {
    type: string
    sql: ${TABLE}.bid ;;
  }
  dimension: bid_size {
    type: string
    sql: ${TABLE}.bidSize ;;
  }
  dimension: board_risk {
    group_label: "Risk data"
    type: string
    sql: ${TABLE}.boardRisk ;;
  }
  dimension: book_value {
    type: string
    sql: ${TABLE}.bookValue ;;
  }
  dimension: city {
    group_label: "Contact Information"
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: compensation_as_of_epoch_date {
    type: string
    sql: ${TABLE}.compensationAsOfEpochDate ;;
  }
  dimension: compensation_risk {
    group_label: "Risk data"
    type: string
    sql: ${TABLE}.compensationRisk ;;
  }
  dimension: country {
    group_label: "Contact Information"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }
  dimension: current_price {
    type: string
    sql: ${TABLE}.currentPrice ;;
  }
  dimension: current_ratio {
    type: string
    sql: ${TABLE}.currentRatio ;;
  }
  dimension: date_short_interest {
    type: string
    sql: ${TABLE}.dateShortInterest ;;
  }
  dimension: day_high {
    type: string
    sql: ${TABLE}.dayHigh ;;
  }
  dimension: day_low {
    type: string
    sql: ${TABLE}.dayLow ;;
  }
  dimension: debt_to_equity {
    type: string
    sql: ${TABLE}.debtToEquity ;;
  }
  dimension: dividend_rate {
    group_label: "Dividend Data"
    description: "Dividend rate"
    type: string
    sql: ${TABLE}.dividendRate ;;
  }
  dimension: dividend_yield {
    group_label: "Dividend Data"
    type: string
    sql: ${TABLE}.dividendYield ;;
  }
  dimension: earnings_growth {
    type: string
    sql: ${TABLE}.earningsGrowth ;;
  }
  dimension: earnings_quarterly_growth {
    type: string
    sql: ${TABLE}.earningsQuarterlyGrowth ;;
  }
  dimension: ebitda {
    type: string
    sql: ${TABLE}.ebitda ;;
  }
  dimension: ebitda_margins {
    type: string
    sql: ${TABLE}.ebitdaMargins ;;
  }
  dimension: enterprise_to_ebitda {
    type: string
    sql: ${TABLE}.enterpriseToEbitda ;;
  }
  dimension: enterprise_to_revenue {
    type: string
    sql: ${TABLE}.enterpriseToRevenue ;;
  }
  dimension: enterprise_value {
    type: string
    sql: ${TABLE}.enterpriseValue ;;
  }
  dimension: ex_dividend_date {
    group_label: "Dividend Data"
    type: string
    sql: ${TABLE}.exDividendDate ;;
  }
  dimension: exchange {
    group_label: "Company info"
    type: string
    sql: ${TABLE}.exchange ;;
  }
  dimension: fifty_day_average {
    type: string
    sql: ${TABLE}.fiftyDayAverage ;;
  }
  dimension: fifty_two_week_high {
    type: string
    sql: ${TABLE}.fiftyTwoWeekHigh ;;
  }
  dimension: fifty_two_week_low {
    type: string
    sql: ${TABLE}.fiftyTwoWeekLow ;;
  }
  dimension: financial_currency {
    group_label: "Company info"
    type: string
    sql: ${TABLE}.financialCurrency ;;
  }
  dimension: first_trade_date_epoch_utc {
    type: string
    sql: ${TABLE}.firstTradeDateEpochUtc ;;
  }
  dimension: float_shares {
    type: string
    sql: ${TABLE}.floatShares ;;
  }
  dimension: forward_eps {
    group_label: "EPS Data"
    type: string
    sql: ${TABLE}.forwardEps ;;
  }
  dimension: forward_pe {
    type: string
    sql: ${TABLE}.forwardPE ;;
  }
  dimension: free_cashflow {
    type: string
    sql: ${TABLE}.freeCashflow ;;
  }
  dimension: full_time_employees {
    group_label: "Company details"
    description: "Number of full-time employees"
    type: number
    sql: ${TABLE}.fullTimeEmployees ;;
  }
  dimension: gmt_off_set_milliseconds {
    type: string
    sql: ${TABLE}.gmtOffSetMilliseconds ;;
  }
  dimension: governance_epoch_date {
    type: string
    sql: ${TABLE}.governanceEpochDate ;;
  }
  dimension: gross_margins {
    type: string
    sql: ${TABLE}.grossMargins ;;
  }
  dimension: held_percent_insiders {
    type: string
    sql: ${TABLE}.heldPercentInsiders ;;
  }
  dimension: held_percent_institutions {
    type: string
    sql: ${TABLE}.heldPercentInstitutions ;;
  }
  dimension: implied_shares_outstanding {
    type: string
    sql: ${TABLE}.impliedSharesOutstanding ;;
  }
  dimension: industry {
    group_label: "Industry Information"
    description: "Industry"
    type: string
    sql: ${TABLE}.industry ;;
  }
  dimension: industry_disp {
    hidden: yes
    type: string
    sql: ${TABLE}.industryDisp ;;
  }
  dimension: industry_key {
    hidden: yes
    type: string
    sql: ${TABLE}.industryKey ;;
  }
  dimension: last_dividend_date {
    group_label: "Dividend Data"
    type: string
    sql: ${TABLE}.lastDividendDate ;;
  }
  dimension: last_dividend_value {
    group_label: "Dividend Data"
    type: string
    sql: ${TABLE}.lastDividendValue ;;
  }
  dimension: last_fiscal_year_end {
    type: string
    sql: ${TABLE}.lastFiscalYearEnd ;;
  }
  dimension: last_split_date {
    type: string
    sql: ${TABLE}.lastSplitDate ;;
  }
  dimension: last_split_factor {
    type: string
    sql: ${TABLE}.lastSplitFactor ;;
  }
  dimension: long_business_summary {
    group_label: "Company info"
    type: string
    sql: ${TABLE}.longBusinessSummary ;;
  }
  dimension: long_name {
    group_label: "Company info"
    type: string
    sql: ${TABLE}.longName ;;
  }
  dimension: market_cap {
    type: string
    sql: ${TABLE}.marketCap ;;
  }
  dimension: max_age {
    type: string
    sql: ${TABLE}.maxAge ;;
  }
  dimension: message_board_id {
    hidden: yes
    type: string
    sql: ${TABLE}.messageBoardId ;;
  }
  dimension: most_recent_quarter {
    type: string
    sql: ${TABLE}.mostRecentQuarter ;;
  }
  dimension: net_income_to_common {
    type: string
    sql: ${TABLE}.netIncomeToCommon ;;
  }
  dimension: next_fiscal_year_end {
    type: string
    sql: ${TABLE}.nextFiscalYearEnd ;;
  }
  dimension: number_of_analyst_opinions {
    type: string
    sql: ${TABLE}.numberOfAnalystOpinions ;;
  }
  dimension: open {
    type: string
    sql: ${TABLE}.open ;;
  }
  dimension: operating_cashflow {
    type: string
    sql: ${TABLE}.operatingCashflow ;;
  }
  dimension: operating_margins {
    type: string
    sql: ${TABLE}.operatingMargins ;;
  }
  dimension: overall_risk {
    group_label: "Risk data"
    type: string
    sql: ${TABLE}.overallRisk ;;
  }
  dimension: payout_ratio {
    type: string
    sql: ${TABLE}.payoutRatio ;;
  }
  dimension: peg_ratio {
    type: string
    sql: ${TABLE}.pegRatio ;;
  }
  dimension: phone {
    description: "Phone number associated with company headquarters"
    group_label: "Contact Information"
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: previous_close {
    type: string
    sql: ${TABLE}.previousClose ;;
  }
  dimension: price_hint {
    type: string
    sql: ${TABLE}.priceHint ;;
  }
  dimension: price_to_book {
    type: string
    sql: ${TABLE}.priceToBook ;;
  }
  dimension: price_to_sales_trailing12_months {
    type: string
    sql: ${TABLE}.priceToSalesTrailing12Months ;;
  }
  dimension: profit_margins {
    type: string
    sql: ${TABLE}.profitMargins ;;
  }
  dimension: quick_ratio {
    type: string
    sql: ${TABLE}.quickRatio ;;
  }
  dimension: quote_type {
    type: string
    sql: ${TABLE}.quoteType ;;
  }
  dimension: recommendation_key {
    type: string
    sql: ${TABLE}.recommendationKey ;;
  }
  dimension: recommendation_mean {
    type: string
    sql: ${TABLE}.recommendationMean ;;
  }
  dimension: regular_market_day_high {
    type: string
    sql: ${TABLE}.regularMarketDayHigh ;;
  }
  dimension: regular_market_day_low {
    type: string
    sql: ${TABLE}.regularMarketDayLow ;;
  }
  dimension: regular_market_open {
    type: string
    sql: ${TABLE}.regularMarketOpen ;;
  }
  dimension: regular_market_previous_close {
    type: string
    sql: ${TABLE}.regularMarketPreviousClose ;;
  }
  dimension: regular_market_volume {
    type: string
    sql: ${TABLE}.regularMarketVolume ;;
  }
  dimension: return_on_assets {
    type: string
    sql: ${TABLE}.returnOnAssets ;;
  }
  dimension: return_on_equity {
    type: string
    sql: ${TABLE}.returnOnEquity ;;
  }
  dimension: revenue_growth {
    type: string
    sql: ${TABLE}.revenueGrowth ;;
  }
  dimension: revenue_per_share {
    type: string
    sql: ${TABLE}.revenuePerShare ;;
  }
  dimension: sand_p52_week_change {
    type: string
    sql: ${TABLE}.SandP52WeekChange ;;
  }
  dimension: sector {
    group_label: "Industry Information"
    type: string
    sql: ${TABLE}.sector ;;
  }
  dimension: sector_disp {
    group_label: "Industry Information"
    type: string
    sql: ${TABLE}.sectorDisp ;;
  }
  dimension: sector_key {
    group_label: "Industry Information"
    type: string
    sql: ${TABLE}.sectorKey ;;
  }
  dimension: share_holder_rights_risk {
    group_label: "Risk data"
    type: string
    sql: ${TABLE}.shareHolderRightsRisk ;;
  }
  dimension: shares_outstanding {
    type: string
    sql: ${TABLE}.sharesOutstanding ;;
  }
  dimension: shares_percent_shares_out {
    type: string
    sql: ${TABLE}.sharesPercentSharesOut ;;
  }
  dimension: shares_short {
    type: string
    sql: ${TABLE}.sharesShort ;;
  }
  dimension: shares_short_previous_month_date {
    type: string
    sql: ${TABLE}.sharesShortPreviousMonthDate ;;
  }
  dimension: shares_short_prior_month {
    type: string
    sql: ${TABLE}.sharesShortPriorMonth ;;
  }
  dimension: short_name {
    group_label: "Company details"
    type: string
    sql: ${TABLE}.shortName ;;
  }
  dimension: short_ratio {
    type: string
    sql: ${TABLE}.shortRatio ;;
  }
  dimension: state {
    description: "State where company is headquartered"
    group_label: "Contact Information"
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: symbol {
    group_label: "Company details"
    type: string
    sql: ${TABLE}.symbol ;;
  }
  dimension: target_high_price {
    group_label: "Targets"
    type: string
    sql: ${TABLE}.targetHighPrice ;;
  }
  dimension: target_low_price {
    group_label: "Targets"
    type: string
    sql: ${TABLE}.targetLowPrice ;;
  }
  dimension: target_mean_price {
    group_label: "Targets"
    type: string
    sql: ${TABLE}.targetMeanPrice ;;
  }
  dimension: target_median_price {
    group_label: "Targets"
    type: string
    sql: ${TABLE}.targetMedianPrice ;;
  }
  dimension: time_zone_full_name {
    group_label: "Company details"
    type: string
    sql: ${TABLE}.timeZoneFullName ;;
  }
  dimension: time_zone_short_name {
    group_label: "Company details"
    type: string
    sql: ${TABLE}.timeZoneShortName ;;
  }
  dimension: total_cash {
    group_label: "Totals"
    type: string
    sql: ${TABLE}.totalCash ;;
  }
  dimension: total_cash_per_share {
    group_label: "Totals"
    type: string
    sql: ${TABLE}.totalCashPerShare ;;
  }
  dimension: total_debt {
    group_label: "Totals"
    type: string
    sql: ${TABLE}.totalDebt ;;
  }
  dimension: total_revenue {
    group_label: "Totals"
    type: string
    sql: ${TABLE}.totalRevenue ;;
  }
  dimension: trailing_annual_dividend_rate {
    group_label: "Dividend Data"
    type: string
    sql: ${TABLE}.trailingAnnualDividendRate ;;
  }
  dimension: trailing_annual_dividend_yield {
    group_label: "Dividend Data"
    type: string
    sql: ${TABLE}.trailingAnnualDividendYield ;;
  }
  dimension: trailing_eps {
    group_label: "EPS Data"
    type: string
    sql: ${TABLE}.trailingEps ;;
  }
  dimension: trailing_pe {
    type: string
    sql: ${TABLE}.trailingPE ;;
  }
  dimension: trailing_peg_ratio {
    type: string
    sql: ${TABLE}.trailingPegRatio ;;
  }
  dimension: two_hundred_day_average {
    type: string
    sql: ${TABLE}.twoHundredDayAverage ;;
  }
  dimension: underlying_symbol {
    hidden: yes
    type: string
    sql: ${TABLE}.underlyingSymbol ;;
  }
  dimension: uuid {
    hidden: yes
    description: "Unique identifier"
    type: string
    sql: ${TABLE}.uuid ;;
  }
  dimension: volume {
    type: string
    description: "Current Volume"
    sql: ${TABLE}.volume ;;
  }
  dimension: website {
    group_label: "Company details"
    description: "Website for the company"
    type: string
    sql: ${TABLE}.website ;;
  }
  dimension: zip {
    label: "Zipcode"
    description: "Zipcode"
    group_label: "Contact Information"
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
    drill_fields: [id, short_name, time_zone_full_name, long_name, time_zone_short_name]
  }
}
