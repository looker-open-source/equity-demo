---
- dashboard: portfolio
  title: Portfolio
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 2SLIwwSGqN5O72n4IMbh70
  elements:
  - title: Portfolio Value
    name: Portfolio Value
    model: portfolio
    explore: portfolio
    type: single_value
    fields: [portfolio_history.total_value]
    filters:
      portfolio_history.history_date_date: 1 days
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 2
    width: 6
    height: 4
  - title: Investments by Value
    name: Investments by Value
    model: portfolio
    explore: portfolio
    type: looker_grid
    fields: [portfolio_history.id, portfolio_history.price, portfolio_history.amount,
      portfolio_history.value]
    filters:
      portfolio_history.history_date_date: 1 days
    sorts: [portfolio_history.id]
    limit: 15
    column_limit: 50
    show_view_names: false
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      portfolio.value: Value
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 13
    col: 14
    width: 8
    height: 6
  - title: Investment Value by Sector
    name: Investment Value by Sector
    model: portfolio
    explore: portfolio
    type: looker_pie
    fields: [portfolio.sector, portfolio_history.total_value]
    filters:
      portfolio_history.history_date_date: 1 days
    sorts: [portfolio.sector]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 70
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    hidden_pivots: {}
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
    defaults_version: 1
    listen: {}
    row: 13
    col: 2
    width: 12
    height: 6
  - title: Investment Type
    name: Investment Type
    model: portfolio
    explore: portfolio
    type: looker_bar
    fields: [portfolio_history.investment_type, portfolio_history.total_value]
    pivots: [portfolio_history.investment_type]
    filters:
      portfolio_history.history_date_date: 1 days
    sorts: [portfolio_history.investment_type]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: left
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: Crypto Currency -
              portfolio.total_value, id: Crypto Currency - portfolio.total_value,
            name: Crypto Currency}, {axisId: Equity - portfolio.total_value, id: Equity
              - portfolio.total_value, name: Equity}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      Equity: "#F9AB00"
      Crypto Currency - portfolio_history.total_value: "#1A73E8"
    value_labels: labels
    label_type: labPer
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 10
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
    height: 91
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "  "
    row: 0
    col: 22
    width: 2
    height: 91
  - name: Portfolio Distribution by Value
    type: text
    title_text: Portfolio Distribution by Value
    body_text: ''
    row: 8
    col: 2
    width: 20
    height: 2
  - type: button
    name: button_1900
    rich_content_json: '{"text":"Market Overview","description":"Take a peek at how
      the market is performing as a whole.","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://b772aff5-4b93-454c-9b34-147289eb2172.looker.app/dashboards/LBbTIdJk3stYt85L3CDo1p?Coin%20Highlight=Bitcoin&History%20Granularity=month"}'
    row: 28
    col: 2
    width: 20
    height: 1
  - name: Investment History
    type: text
    title_text: Investment History
    body_text: ''
    row: 19
    col: 2
    width: 20
    height: 2
  - title: Initial Investment
    name: Initial Investment
    model: portfolio
    explore: portfolio
    type: single_value
    fields: [portfolio_history.history_date_date, portfolio_history.total_value]
    fill_fields: [portfolio_history.history_date_date]
    filters:
      portfolio_history.id: "-NULL"
      portfolio_history.history_date_date: before 364 days ago
    sorts: [portfolio_history.history_date_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: list
      based_on: portfolio_history.id
      expression: ''
      label: List of ID
      measure: list_of_id
      type: list
    - _kind_hint: measure
      _type_hint: number
      based_on: portfolio_history.value
      expression: ''
      label: Sum of Available Value
      measure: sum_of_available_value
      type: sum
    - category: table_calculation
      description: The change in the number of shares/coins from the initial investment
        to today's current holdings.
      expression: "${portfolio.amount}-${portfolio_history.amount}"
      label: Change in Quantity
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: change_in_quantity
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      description: Change in value from the initial investment to today's current
        holdings.
      expression: "${portfolio.total_value}-${sum_of_available_value}"
      label: Growth
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: growth
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Initial Investment Date
    conditional_formatting: [{type: greater than, value: 0, background_color: "#F4B400",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      portfolio_history.history_date_date: Orig. Investment Date
      sum_of_available_value: Initial Investment
      portfolio.total_value: Current Investment Value
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      sum_of_available_value:
        is_active: false
      growth:
        is_active: true
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    hidden_pivots: {}
    defaults_version: 1
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
    listen: {}
    row: 4
    col: 2
    width: 6
    height: 4
  - title: All Account Growth
    name: All Account Growth
    model: portfolio
    explore: portfolio
    type: looker_grid
    fields: [portfolio_history.history_date_date, portfolio_history.total_value]
    fill_fields: [portfolio_history.history_date_date]
    filters:
      portfolio_history.history_date_date: NOT NULL
      portfolio_history.total_value: NOT NULL
    sorts: [portfolio_history.history_date_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${portfolio_history.total_value}/offset(${portfolio_history.total_value},-1)-1"
      label: Percent Change
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: percent_change
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
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
    series_labels:
      portfolio_history.history_date_date: Date
    series_cell_visualizations:
      portfolio_history.total_value:
        is_active: true
        palette:
          palette_id: 0c80a097-7fb5-ed98-54d9-684f561732fa
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
          custom_colors:
          - "#e6d80c"
          - "#e86f36"
    header_background_color: "#F9AB00"
    conditional_formatting: [{type: greater than, value: 0, background_color: '',
        font_color: "#7CB342", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [percent_change]}, {type: less than, value: 0,
        background_color: '', font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [percent_change]}]
    series_value_format:
      percent_change:
        name: percent_2
        decimals: '2'
        format_string: "#,##0.00%"
        label: Percent (2)
        label_prefix: Percent
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
    defaults_version: 1
    listen: {}
    row: 21
    col: 6
    width: 12
    height: 7
  - title: Daily Growth
    name: Daily Growth
    model: portfolio
    explore: portfolio
    type: looker_line
    fields: [portfolio_history.total_value, portfolio_history.history_date_date]
    fill_fields: [portfolio_history.history_date_date]
    filters:
      portfolio_history.history_date_month: 3 months
    sorts: [portfolio_history.history_date_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${portfolio_history.total_value}/offset(${portfolio_history.total_value},-1)-1"
      label: Percent Change
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: percent_change
      _type_hint: number
      is_disabled: true
    x_axis_gridlines: true
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_label: Date
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      portfolio_history.total_value: "#E52592"
    series_labels:
      portfolio_history.history_date_date: Date
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
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
    series_cell_visualizations:
      portfolio_history.total_value:
        is_active: true
    conditional_formatting: [{type: greater than, value: 0, background_color: '',
        font_color: "#7CB342", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: []}, {type: less than, value: 0, background_color: '',
        font_color: "#EA4335", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 8
    width: 14
    height: 8
