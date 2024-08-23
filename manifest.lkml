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
visualization: {
  id: "two_number_comparison"
  label: "Two Number Comparison"
  file: "visualizations/two_number_comparison.js"
}
visualization: {
  id: "analyst_recommendation"
  label: "Analyst Recommendation"
  file: "visualizations/analyst_recommendation.js"
}
visualization: {
  id: "stockvisualizationcard"
  label: "Stock Visualization Card"
  file: "visualizations/stock_visualization_card.js"
}
