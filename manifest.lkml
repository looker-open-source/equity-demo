
project_name: "finance_portfolio_demo"

constant: database {
  value: "looker-private-demo"
}

# # This is the ID of the BQML MODEL setup with the remote connect
# constant: BQML_REMOTE_CONNECTION_MODEL_ID {
#   value: "looker-private-demo.crypto_mvp.stock_info_embeddings_model" # replace these defaults
# }

# This is the ID of the remote connection setup in BigQuery
constant: BQML_REMOTE_CONNECTION_ID {
  value: "us.ecomm-email" # replace these defaults
}

# This is the name of the Looker BigQuery Database connection
constant: LOOKER_BIGQUERY_CONNECTION_NAME {
  value: "looker-private-demo" # replace these defaults
}

visualization: {
  id: "candlestick"
  label: "candlestick"
  file: "visualizations/candlestick.js"
}
visualization: {
  id: "company_info"
  label: "Display Company Information"
  file: "visualizations/company_info.js"
}
visualization: {
  id: "target_prices"
  label: "Plot target prices"
  file: "visualizations/target_prices.js"
}
visualization: {
  id: "equity-metric-comparison"
  label: "Equity Metric Comparison"
  file: "visualizations/two_number_comparison.js"
}
visualization: {
  id: "buy_sell_hold"
  label: "Buy/Sell/Hold Recommendation"
  file: "visualizations/analyst_recommendation.js"
}
visualization: {
  id: "stockvisualizationcard"
  label: "Stock visualization card with format selection"
  file: "visualizations/stock_visualization_card.js"
}
visualization: {
  id: "twonumflex"
  label: "Two number comparison with flexible subtitles"
  file: "visualizations/two_number_comparison_flex.js"
}
visualization: {
  id: "portfolio-overview"
  label: "Portfolio Overview"
  file: "visualizations/portfolio_viz.js"
}
visualization: {
  id: "stock_sector_heatmap"
  label: "Stock Sector Heatmap"
  file: "visualizations/stock_sector_heatmap.js"
}
visualization: {
  id: "crypto_heatmap"
  label: "Cryptocurrency Heatmap"
  file: "visualizations/crypto_heatmap.js"
}
visualization: {
  id: "ticker-scroll"
  label: "Ticker Scroll"
  file: "visualizations/ticker_scroll.js"
}

