project_name: "finance_portfolio_demo"

constant: database {
  value: "looker-private-demo"
}

visualization: {
  id: "candlestick"
  label: "Candlestick Chart"
  file: "visualizations/candlestick.js"
}
visualization: {
  id: "company_info"
  label: "Company Info"
  file: "visualizations/company_info.js"
}
visualization: {
  id: "target_prices"
  label: "Target Prices"
  file: "visualizations/target_prices.js"
}
