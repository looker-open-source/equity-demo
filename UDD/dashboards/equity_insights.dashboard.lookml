---
- dashboard: equity_insights
  title: Equity Insights
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: W8b8wacUnIY9GLXVwWDy60
  elements:
  - title: Income Statement
    name: Income Statement
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.revenue_per_share, stock_info.revenue_growth, stock_info.ebitda,
      stock_info.earnings_quarterly_growth]
    sorts: [stock_info.earnings_quarterly_growth desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 37
    col: 2
    width: 20
    height: 3
  - title: Management Effectiveness
    name: Management Effectiveness
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.return_on_assets, stock_info.return_on_equity]
    sorts: [stock_info.return_on_assets]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 35
    col: 2
    width: 20
    height: 2
  - title: Profitability
    name: Profitability
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.profit_margins, stock_info.operating_margins]
    sorts: [stock_info.operating_margins desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 33
    col: 2
    width: 20
    height: 2
  - name: Financial Highlights
    type: text
    title_text: Financial Highlights
    body_text: ''
    row: 30
    col: 2
    width: 20
    height: 1
  - title: Fiscal Year
    name: Fiscal Year
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.last_fiscal_year_end, stock_info.most_recent_q, stock_info.upcoming_fye]
    sorts: [stock_info.last_fiscal_year_end desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 31
    col: 2
    width: 20
    height: 2
  - title: Balance Sheet
    name: Balance Sheet
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.total_cash, stock_info.total_cash_per_share, stock_info.total_debt,
      stock_info.current_ratio, stock_info.book_value]
    sorts: [stock_info.total_cash]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 40
    col: 2
    width: 20
    height: 3
  - name: ''
    type: text
    title_text: ''
    body_text: " "
    row: 0
    col: 0
    width: 2
    height: 117
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "   "
    row: 0
    col: 22
    width: 2
    height: 117
  - title: Analyst Targets
    name: Analyst Targets
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::target_prices
    fields: [stock_info.target_low_price, stock_info.current_price, stock_info.target_average_price,
      stock_info.target_median_price, stock_info.target_high_price]
    filters: {}
    sorts: [stock_info.target_low_price]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 13
    col: 11
    width: 11
    height: 6
  - title: Average Trends
    name: Average Trends
    model: portfolio
    explore: stock_info
    type: looker_column
    fields: [stock_history_with_date_crossjoin.date_selection_month, average_of_open,
      average_of_low, average_of_high, average_of_close]
    fill_fields: [stock_history_with_date_crossjoin.date_selection_month]
    sorts: [stock_history_with_date_crossjoin.date_selection_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_history_with_date_crossjoin.volume
      expression: ''
      label: Average of Volume
      measure: average_of_volume
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_history_with_date_crossjoin.open
      expression: ''
      label: Average of Open
      measure: average_of_open
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_history_with_date_crossjoin.low
      expression: ''
      label: Average of Low
      measure: average_of_low
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_history_with_date_crossjoin.high
      expression: ''
      label: Average of High
      measure: average_of_high
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_history_with_date_crossjoin.close
      expression: ''
      label: Average of Close
      measure: average_of_close
      type: average
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      custom:
        id: f9eac9ef-7d33-f68f-6c8b-4fd0dbd62794
        label: Custom
        type: discrete
        colors:
        - "#4285F4"
        - "#EA4335"
        - "#34A853"
        - "#FBBC04"
      options:
        steps: 5
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [average_of_volume]
    series_colors: {}
    series_labels: {}
    reference_lines: []
    trend_lines: []
    hidden_fields: []
    hidden_points_if_no: []
    hidden_pivots: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 13
    col: 2
    width: 9
    height: 6
  - name: Price Information
    type: text
    title_text: Price Information
    body_text: ''
    row: 5
    col: 2
    width: 20
    height: 1
  - title: Valuation Measures
    name: Valuation Measures
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.market_cap, stock_info.enterprise_value, stock_info.trailing_pe,
      stock_info.forward_pe, stock_info.peg_ratio, stock_info.price_to_sales_trailing12_months,
      stock_info.price_to_book, stock_info.enterprise_to_revenue, stock_info.enterprise_to_ebitda]
    sorts: [stock_info.market_cap]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    header_font_color: "#FFFF"
    header_background_color: "#1A73E8"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 19
    col: 2
    width: 20
    height: 3
  - title: companyinfo
    name: companyinfo
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::company_info
    fields: [stock_info.short_name, stock_info.long_business_summary, stock_info.website,
      stock_info.full_time_employees, stock_info.sector, stock_info.upcoming_fye,
      stock_info.industry]
    sorts: [stock_info.upcoming_fye desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    primary_color: "#1A73E8"
    secondary_color: "#1A73E8"
    use_background: true
    background_color: "#e4eff5"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    minimum_column_width: 75
    series_column_widths:
      stock_info.website: 158
    title_hidden: true
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 22
    col: 2
    width: 20
    height: 8
  - title: candlesticktest
    name: candlesticktest
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::candlestick
    fields: [stock_history_with_date_crossjoin.date_selection_date, stock_history_with_date_crossjoin.high,
      stock_history_with_date_crossjoin.low, stock_history_with_date_crossjoin.open,
      stock_history_with_date_crossjoin.close]
    filters:
      stock_history_with_date_crossjoin.date_selection_date: 3 months
    sorts: [stock_history_with_date_crossjoin.date_selection_date]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    title_hidden: true
    listen:
      ID: stock_info.id
      Historic Month: stock_history_with_date_crossjoin.date_selection_month
    row: 6
    col: 2
    width: 20
    height: 7
  - title: comparison
    name: comparison
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::equity-metric-comparison
    fields: [stock_info.trailing_eps, stock_info.forward_eps]
    filters: {}
    sorts: [stock_info.trailing_eps]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    chart_title: EPS Comparison
    background_color: "#4285F4"
    text_color: "#FFF"
    corner_style: 16px
    metric_name: ''
    ttm_color: "#3498db"
    forward_color: "#2ecc71"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    title_hidden: true
    listen:
      ID: stock_info.id
    row: 0
    col: 6
    width: 4
    height: 5
  - title: comparison
    name: comparison (2)
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::equity-metric-comparison
    fields: [stock_info.trailing_pe, stock_info.forward_pe]
    filters: {}
    sorts: [stock_info.trailing_pe]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    chart_title: P/E Ratio Comparison
    background_color: "#00BB72"
    text_color: "#FFF"
    corner_style: 16px
    ttm_color: "#c8ccc9"
    forward_color: "#c8ccc9"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    defaults_version: 0
    title_hidden: true
    listen:
      ID: stock_info.id
    row: 0
    col: 10
    width: 4
    height: 5
  - title: recommendation
    name: recommendation
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::buy_sell_hold
    fields: [stock_info.recommendation_key, stock_info.recommendation_mean, stock_info.number_of_analyst_opinions]
    sorts: [stock_info.recommendation_key]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    title_hidden: true
    listen:
      ID: stock_info.id
    row: 0
    col: 18
    width: 4
    height: 5
  - title: 52weekchange
    name: 52weekchange
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::twonumflex
    fields: [stock_info.52_week_change, stock_info.sandp_52_week_change]
    sorts: [stock_info.52_week_change]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    chart_title: 52 Week Change Comparison
    background_color: "#F4B400"
    text_color: "#FFF"
    corner_style: 16px
    left_subtitle: Selected
    right_subtitle: S&P
    use_percentage: true
    decimal_places: 2
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    defaults_version: 0
    title_hidden: true
    listen:
      ID: stock_info.id
    row: 0
    col: 14
    width: 4
    height: 5
  - title: stocktile
    name: stocktile
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::stockvisualizationcard
    fields: [stock_info.short_name, stock_info.symbol, stock_info.current_price, stock_info.previous_close]
    sorts: [stock_info.short_name]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    style: colorful
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    title_hidden: true
    listen:
      ID: stock_info.id
    row: 0
    col: 2
    width: 4
    height: 5
  filters:
  - name: ID
    title: ID
    type: field_filter
    default_value: goog
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
    model: portfolio
    explore: stock_info
    listens_to_filters: []
    field: stock_info.id
  - name: Historic Month
    title: Historic Month
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: portfolio
    explore: stock_info
    listens_to_filters: []
    field: stock_history_with_date_crossjoin.date_selection_month
