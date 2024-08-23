project_name: "finance_portfolio_demo"

constant: database {
  value: "looker-private-demo"
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
  # url: "https://gistcdn.githack.com/kirbsrh/b260c387d2e02503dd2d52691d890278/raw/d24366e54992bdafea24aef926d2b483a3471dfb/bundle.js"
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
