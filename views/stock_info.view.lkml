view: stock_info {
  label: "Current Stock Info"
  sql_table_name: `kirby-looker-core-argolis.crypto_mvp.stock_info`  ;;
  drill_fields: [id]

  dimension: id {
    # label: "ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: 52_week_change {
    label: "52 Week Change"
    description: "Percentage change in the company's stock price over the last fifty-two weeks"
    type: number
    value_format: "0.00%"
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
    type: number
    description: "Corporate governance scores courtesy of Institutional Shareholder Services (ISS) Scores indicate decile rank relative to index or region. A decile score of 1 indicates lower governance risk, while a 10 indicates higher governance risk."
    sql: ${TABLE}.auditRisk ;;
  }
  dimension: average_daily_volume10_day {
    hidden: yes
    #group_label: "Averages"
    type: string
    sql: ${TABLE}.averageDailyVolume10Day ;;
  }
  dimension: average_volume {
    group_label: "Averages"
    type: string
    description: "Average volume over the last 24 hours"
    sql: ${TABLE}.averageVolume ;;
  }
  dimension: average_volume10days {
    group_label: "Averages"
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
    type: number
    description: "Corporate governance scores courtesy of Institutional Shareholder Services (ISS) Scores indicate decile rank relative to index or region. A decile score of 1 indicates lower governance risk, while a 10 indicates higher governance risk."
    sql: ${TABLE}.boardRisk ;;
  }
  dimension: book_value {
    value_format: "0.00"
    type: number
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
    type: number
    description: "Corporate governance scores courtesy of Institutional Shareholder Services (ISS) Scores indicate decile rank relative to index or region. A decile score of 1 indicates lower governance risk, while a 10 indicates higher governance risk."
    sql: ${TABLE}.compensationRisk ;;
  }
  dimension: country {
    group_label: "Contact Information"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension: currency {
    group_label: "Company Details"
    type: string
    sql: ${TABLE}.currency ;;
  }
  dimension: current_price {
    group_label: "Current Data"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.currentPrice ;;
  }
  dimension: current_ratio {
    group_label: "Current Data"
    description: "Current assests over current liabilities"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.currentRatio ;;
  }
  dimension: date_short_interest {
    type: string
    sql: ${TABLE}.dateShortInterest ;;
  }
  dimension: day_high {
    group_label: "Highs"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.dayHigh ;;
  }
  dimension: day_low {
    group_label: "Lows"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
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
    group_label: "Earnings Growth Data"
    type: number
    value_format: "0.00%"
    sql: ${TABLE}.earningsGrowth ;;
  }
  dimension: earnings_quarterly_growth {
    group_label: "Earnings Growth Data"
    type: number
    value_format: "0.00%"
    sql: ${TABLE}.earningsQuarterlyGrowth ;;
  }
  dimension: ebitda {
    group_label: "EBITDA Data"
    type: number
    value_format: "0.000,,,\" B\""
    sql: ${TABLE}.ebitda ;;
  }
  dimension: ebitda_margins {
    group_label: "EBITDA Data"
    type: string
    sql: ${TABLE}.ebitdaMargins ;;
  }
  dimension: enterprise_to_ebitda {
    group_label: "EBITDA Data"
    description: "Enterprise value to earnings before interest, taxes, depreciation, and amortization (EV/EBITDA) is a financial ratio that compares a company's value to its earnings before non-cash expenses. It's calculated by dividing a company's enterprise value (EV) by its EBITDA"
    label: "Enterprise Value/EBITDA"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.enterpriseToEbitda ;;
  }
  dimension: enterprise_to_revenue {
    label: "Enterprise Value/Revenue"
    description: "Enterprise value-to-revenue (EV/R) is a metric that compares a company's enterprise value (EV) to its revenue. It's also called the enterprise value-to-sales multiple. EV/R is calculated by dividing a company's EV by its annual revenue. EV is the total value of a firm, which is equity plus debt minus cash."
    type: number
    value_format: "0.00"
    sql: ${TABLE}.enterpriseToRevenue ;;
  }
  dimension: enterprise_value {
    type: number
    value_format: "0.000,,,,\" T\""
    sql: ${TABLE}.enterpriseValue ;;
  }
  dimension: ex_dividend_date {
    group_label: "Dividend Data"
    type: string
    sql: ${TABLE}.exDividendDate ;;
  }
  dimension: exchange {
    group_label: "Company Details"
    type: string
    sql: ${TABLE}.exchange ;;
  }
  dimension: fifty_day_average {
    group_label: "Averages"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.fiftyDayAverage ;;
  }
  dimension: fifty_two_week_high {
    group_label: "Highs"
    label: "52 Week High"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.fiftyTwoWeekHigh ;;
  }
  dimension: fifty_two_week_low {
    group_label: "Lows"
    label: "52 Week Low"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.fiftyTwoWeekLow ;;
  }
  dimension: financial_currency {
    group_label: "Company Details"
    type: string
    sql: ${TABLE}.financialCurrency ;;
  }
  dimension: first_trade_date_epoch_utc {
    type: string
    sql: ${TABLE}.firstTradeDateEpochUtc ;;
  }
  dimension: float_shares {
    group_label: "Shares Data"
    type: string
    sql: ${TABLE}.floatShares ;;
  }
  dimension: forward_eps {
    label: "Forward EPS"
    group_label: "EPS Data"
    type: string
    sql: ${TABLE}.forwardEps ;;
  }
  dimension: forward_pe {
    label: "Forward P/E"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.forwardPE ;;
  }
  dimension: free_cashflow {
    type: string
    sql: ${TABLE}.freeCashflow ;;
  }
  dimension: full_time_employees {
    group_label: "Company Details"
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
    group_label: "Shares Data"
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
  dimension: lastfye {
    type: number
    hidden: yes
    sql: CAST(${TABLE}.lastFiscalYearEnd AS INT) ;;
  }
  dimension: last_fiscal_year_end {
    type: date
    sql: TIMESTAMP_SECONDS(${lastfye} );;
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
    group_label: "Company Details"
    type: string
    sql: ${TABLE}.longBusinessSummary ;;
  }
  dimension: long_name {
    group_label: "Company Details"
    type: string
    sql: ${TABLE}.longName ;;
  }
  dimension: market_cap {
    type: number
    value_format: "0.000,,,,\" T\""
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
    type: number
    hidden: yes
    sql: CAST(${TABLE}.mostRecentQuarter AS INT) ;;
  }
  dimension: most_recent_q {
    label: "Most Recent Quarter"
    type: date
    sql: TIMESTAMP_SECONDS(${most_recent_quarter}) ;;
    }
  dimension: net_income_to_common {
    type: string
    sql: ${TABLE}.netIncomeToCommon ;;
  }
  dimension: next_fiscal_year_end {
    type: number
    hidden: yes
    sql: CAST(${TABLE}.nextFiscalYearEnd AS INT) ;;
  }
  dimension: upcoming_fye {
    label: "Next Fiscal Year End"
    type: date
    sql: TIMESTAMP_SECONDS(${next_fiscal_year_end}) ;;
  }
  dimension: number_of_analyst_opinions {
    type: number
    sql: ${TABLE}.numberOfAnalystOpinions ;;
  }
  dimension: open {
    group_label: "Open"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.open ;;
  }
  dimension: operating_cashflow {
    type: string
    sql: ${TABLE}.operatingCashflow ;;
  }
  dimension: operating_margins {
    label: "Operating Margin"
    type: number
    value_format: "0.00%"
    sql: ${TABLE}.operatingMargins ;;
  }
  dimension: overall_risk {
    group_label: "Risk data"
    type: number
    description: "Corporate governance scores courtesy of Institutional Shareholder Services (ISS) Scores indicate decile rank relative to index or region. A decile score of 1 indicates lower governance risk, while a 10 indicates higher governance risk."
    sql: ${TABLE}.overallRisk ;;
  }
  dimension: payout_ratio {
    type: string
    sql: ${TABLE}.payoutRatio ;;
  }
  dimension: peg_ratio {
    label: "PEG Ratio"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.pegRatio ;;
  }
  dimension: phone {
    description: "Phone number associated with company headquarters"
    group_label: "Contact Information"
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: previous_close {
    group_label: "Close"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.previousClose ;;
  }
  dimension: price_hint {
    type: string
    sql: ${TABLE}.priceHint ;;
  }
  dimension: price_to_book {
    label: "Price/Book (mrq)"
    description: "Price to Tangible Book (MRQ) is a ratio that's calculated by dividing the current price by the most recent annual Tangible Book Value Per Share. Tangible Book Value Per Share is calculated by subtracting Goodwill and Intangible Assets from Book Value, and then dividing that number by the Shares Outstanding at the end of the fiscal period"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.priceToBook ;;
  }
  dimension: price_to_sales_trailing12_months {
    label: "Price/Sales (ttm)"
    description: "The Price to Sales Ratio, or PS Ratio, is a popular valuation ratio. It is the share price of a company divided by its sales per share. This is measured on a TTM basis and earnings are diluted and normalised."
    value_format: "0.00"
    type: number
    sql: ${TABLE}.priceToSalesTrailing12Months ;;
  }
  dimension: profit_margins {
    label: "Profit Margin"
    type: number
    value_format: "0.00%"
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
    group_label: "Highs"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.regularMarketDayHigh ;;
  }
  dimension: regular_market_day_low {
    group_label: "Lows"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.regularMarketDayLow ;;
  }
  dimension: regular_market_open {
    group_label: "Open"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.regularMarketOpen ;;
  }
  dimension: regular_market_previous_close {
    group_label: "Close"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.regularMarketPreviousClose ;;
  }
  dimension: regular_market_volume {
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    sql: ${TABLE}.regularMarketVolume ;;
  }
  dimension: return_on_assets {
    type: number
    value_format: "0.00%"
    description: "Return on assets TTM is a percentage that measures a company's profitability over the trailing 12 months.  It is calculated by dividing a company's net income after taxes by its average total assets and multiplying the result by 100"
    sql: ${TABLE}.returnOnAssets ;;
  }
  dimension: return_on_equity {
    type: number
    value_format: "0.00%"
    description: "Return on equity TTM is a financial metric that measures how well a company uses shareholder equity to generate profits over a trailing 12-month period"
    sql: ${TABLE}.returnOnEquity ;;
  }
  dimension: revenue_growth {
    type: number
    description: "Quarterly Revenue Growth"
    value_format: "0.00%"
    sql: ${TABLE}.revenueGrowth ;;
  }
  dimension: revenue_per_share {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.revenuePerShare ;;
  }
  dimension: sandp_52_week_change {
    label: "S&P 52 Week Change"
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
    type: number
    description: "Corporate governance scores courtesy of Institutional Shareholder Services (ISS) Scores indicate decile rank relative to index or region. A decile score of 1 indicates lower governance risk, while a 10 indicates higher governance risk."
    sql: ${TABLE}.shareHolderRightsRisk ;;
  }
  dimension: shares_outstanding {
    group_label: "Shares Data"
    type: string
    sql: ${TABLE}.sharesOutstanding ;;
  }
  dimension: shares_percent_shares_out {
    group_label: "Shares Data"
    type: string
    sql: ${TABLE}.sharesPercentSharesOut ;;
  }
  dimension: shares_short {
    group_label: "Shares Data"
    type: string
    sql: ${TABLE}.sharesShort ;;
  }
  dimension: shares_short_previous_month_date {
    group_label: "Shares Data"
    type: string
    sql: ${TABLE}.sharesShortPreviousMonthDate ;;
  }
  dimension: shares_short_prior_month {
    group_label: "Shares Data"
    type: string
    sql: ${TABLE}.sharesShortPriorMonth ;;
  }
  dimension: short_name {
    group_label: "Company Details"
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
    group_label: "Company Details"
    type: string
    sql: ${TABLE}.symbol ;;
    link: {
      label: "View on Yahoo Finance"
      url: "https://finance.yahoo.com/quote/{{value}}/"
    }
    link: {
      label: "Take a Deep Dive"
      url: "https://b772aff5-4b93-454c-9b34-147289eb2172.looker.app/dashboards/W8b8wacUnIY9GLXVwWDy60?ID={{stock_info.id._value}}"
    }
  }
  dimension: target_high_price {
    group_label: "Targets"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.targetHighPrice ;;
  }
  dimension: target_low_price {
    group_label: "Targets"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.targetLowPrice ;;
  }
  dimension: target_average_price {
    group_label: "Targets"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.targetMeanPrice ;;
  }
  dimension: target_median_price {
    group_label: "Targets"
    value_format: "$#,##0.00;($#,##0.00)"
    type: number
    sql: ${TABLE}.targetMedianPrice ;;
  }
  dimension: time_zone_full_name {
    group_label: "Company Details"
    type: string
    sql: ${TABLE}.timeZoneFullName ;;
  }
  dimension: time_zone_short_name {
    group_label: "Company Details"
    type: string
    sql: ${TABLE}.timeZoneShortName ;;
  }
  dimension: total_cash {
    group_label: "Totals"
    description: "Total cash (MRQ) is a financial ratio that is calculated by adding a company's total cash and short-term investments together, then dividing that number by the number of shares outstanding at the end of the most recent interim period.  MRQ stands for 'most recent quarter' and refers to the most recent fiscal quarter that has ended"
    type: number
    value_format: "0.000,,,\" B\""
    sql: ${TABLE}.totalCash ;;
  }
  dimension: total_cash_per_share {
    group_label: "Totals"
    value_format: "0.00"
    type: number
    sql: ${TABLE}.totalCashPerShare ;;
  }
  dimension: total_debt {
    group_label: "Totals"
    type: number
    value_format: "0.000,,,\" B\""
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
    label: "EPS (TTM)"
    type: string
    sql: ${TABLE}.trailingEps ;;
  }
  dimension: trailing_pe {
    label: "P/E Ratio (TTM)"
    type: number
    value_format: "0.00"
    sql: ${TABLE}.trailingPE ;;
  }
  dimension: trailing_peg_ratio {
    type: number
    label: "PEG Ratio (TTM)"
    value_format: "0.00"
    sql: ${TABLE}.trailingPegRatio ;;
  }
  dimension: two_hundred_day_average {
    group_label: "Averages"
    type: number
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
    type: number
    value_format: "$#,##0.00;($#,##0.00)"
    group_label: "Current Data"
    description: "Current Volume"
    sql: ${TABLE}.volume ;;
  }
  dimension: website {
    group_label: "Company Details"
    description: "Website for the investor relations"
    type: string
    sql: ${TABLE}.website ;;
  }
  dimension: zip {
    label: "Zipcode"
    description: "Zipcode"
    group_label: "Contact Information"
    type: string
    sql: ${TABLE}.zip ;;
    }
  }
