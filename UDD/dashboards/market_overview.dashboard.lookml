---
- dashboard: market_overview
  title: Market Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: DrvcA0QMh1n95F4cVNngbT
  elements:
  - name: 24 Hour Price Change Comparison
    type: text
    title_text: 24 Hour Price Change Comparison
    subtitle_text: ''
    body_text: " "
    row: 23
    col: 13
    width: 9
    height: 1
  - title: Top 10
    name: Top 10
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.symbol, market_data.price_change_percentage_7d_in_currency]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [market_data.price_change_percentage_7d_in_currency desc]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      market_data.id: Currency
      market_data.ath_change_percentage: Price Change %  (7 Days)
      market_data.price_change_percentage_7d_in_currency: Price Change 7d
    series_cell_visualizations:
      market_data.ath_change_percentage:
        is_active: false
      market_data.price_change_percentage_7d_in_currency:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0,
          options: {steps: 6, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    listen:
      Coin Highlight: market_data.coin_highlight
    row: 17
    col: 12
    width: 5
    height: 6
  - title: Crypto Currency Outlook by Market Cap
    name: Crypto Currency Outlook by Market Cap
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.name, market_data.id, market_data.market_cap_rank, market_data.market_cap,
      market_data.market_cap_change_percentage_24h, market_data.current_price]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [market_data.market_cap desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    show_sql_query_menu_options: false
    column_order: [market_data.name, market_data.symbol, market_data.current_price,
      market_data.high_24h, market_data.low_24h]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      market_data.market_cap_change_percentage_24h: Market Cap % Change (24hrs)
      market_data.id: Currency
    series_cell_visualizations:
      market_data.market_cap_change_percentage_24h:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    series_text_format:
      market_data.id:
        align: left
    header_font_color: "#fff"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [market_data.id]
    listen:
      Coin Highlight: market_data.coin_highlight
    row: 42
    col: 12
    width: 10
    height: 12
  - title: Averages Price by Week
    name: Averages Price by Week
    model: portfolio
    explore: market_data
    type: looker_line
    fields: [history_with_date_crossjoin.history_date_week, average_of_price, history_with_date_crossjoin.coin_id]
    pivots: [history_with_date_crossjoin.coin_id]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [history_with_date_crossjoin.coin_id, history_with_date_crossjoin.history_date_week
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: history_with_date_crossjoin.price
      expression: ''
      label: Average of Price
      measure: average_of_price
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      market_data.market_cap_change_percentage_24h: Market Cap % Change (24hrs)
      market_data.id: Currency
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
      market_data.market_cap_change_percentage_24h:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    column_order: [market_data.name, market_data.symbol, market_data.current_price,
      market_data.high_24h, market_data.low_24h]
    hidden_pivots: {}
    listen:
      Coin Highlight: market_data.coin_highlight
    row: 31
    col: 12
    width: 10
    height: 10
  - title: Equity Outlook by Market Cap
    name: Equity Outlook by Market Cap
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.short_name, stock_info.current_price, stock_info.market_cap,
      stock_info.regular_market_volume]
    sorts: [stock_info.market_cap desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
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
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      stock_info.short_name: Name
      stock_info.current_price: Price
      stock_info.regular_market_volume: Volume
    series_column_widths:
      stock_info.short_name: 236
    header_font_color: "#FFF"
    header_background_color: "#7CB342"
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
    listen: {}
    row: 42
    col: 2
    width: 10
    height: 12
  - title: Average Opening Price by Month
    name: Average Opening Price by Month
    model: portfolio
    explore: stock_info
    type: looker_line
    fields: [average_of_open, stock_history_with_date_crossjoin.date_selection_month,
      stock_info.sector]
    pivots: [stock_info.sector]
    fill_fields: [stock_history_with_date_crossjoin.date_selection_month]
    filters:
      stock_history_with_date_crossjoin.date_selection_month: 12 months
    sorts: [stock_info.sector, stock_history_with_date_crossjoin.date_selection_month
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_history_with_date_crossjoin.open
      expression: ''
      label: Average of Open
      measure: average_of_open
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
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
    listen: {}
    row: 31
    col: 2
    width: 10
    height: 10
  - type: button
    name: button_1846
    rich_content_json: '{"text":"View My Portfolio","description":"Navigate to your
      personal portfolio to view your holdings.","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://b772aff5-4b93-454c-9b34-147289eb2172.looker.app/dashboards/jqkqrA1RP7nEsgj4XFneiu"}'
    row: 54
    col: 10
    width: 4
    height: 1
  - title: Top 10
    name: Top 10 (2)
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.name, market_data.price_change_percentage_24h]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [market_data.price_change_percentage_24h desc]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      market_data.id: Currency
      market_data.price_change_percentage_24h: Price Change 24h
    series_cell_visualizations:
      market_data.price_change_percentage_24h:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        value_display: true
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: less than, value: 0, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: equal to, value: 0, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      Coin Highlight: market_data.coin_highlight
    row: 24
    col: 12
    width: 5
    height: 6
  - title: Bottom 10
    name: Bottom 10
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.name, market_data.price_change_percentage_24h]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [market_data.price_change_percentage_24h]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      market_data.id: Currency
      market_data.price_change_percentage_24h: Price Change 24h
    series_cell_visualizations:
      market_data.price_change_percentage_24h:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        value_display: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: less than, value: 0, background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: equal
          to, value: 0, background_color: "#1A73E8", font_color: !!null '', color_application: {
          collection_id: google-theme, palette_id: google-theme-sequential-0, options: {
            constraints: {min: {type: minimum}, mid: {type: number, value: 0}, max: {
                type: maximum}}, mirror: true, reverse: false, stepped: false}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}, {type: greater than,
        value: 0, background_color: "#1A73E8", font_color: !!null '', color_application: {
          collection_id: google-theme, palette_id: google-theme-sequential-0, options: {
            constraints: {min: {type: minimum}, mid: {type: number, value: 0}, max: {
                type: maximum}}, mirror: true, reverse: false, stepped: false}}, bold: true,
        italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      Coin Highlight: market_data.coin_highlight
    row: 24
    col: 17
    width: 5
    height: 6
  - name: ''
    type: text
    title_text: ''
    body_text: " "
    row: 0
    col: 0
    width: 2
    height: 62
  - name: " (2)"
    type: text
    title_text: ''
    body_text: " "
    row: 0
    col: 22
    width: 2
    height: 62
  - name: 7 Day  Price Change Comparison
    type: text
    title_text: 7 Day  Price Change Comparison
    subtitle_text: ''
    body_text: " "
    row: 16
    col: 12
    width: 10
    height: 1
  - name: Price Information
    type: text
    title_text: Price Information
    body_text: ''
    row: 30
    col: 2
    width: 20
    height: 1
  - name: Key Numbers
    type: text
    title_text: Key Numbers
    body_text: ''
    row: 41
    col: 2
    width: 20
    height: 1
  - title: Bottom 10
    name: Bottom 10 (2)
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.symbol, market_data.price_change_percentage_7d_in_currency]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [market_data.price_change_percentage_7d_in_currency]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      market_data.id: Currency
      market_data.ath_change_percentage: Price Change %  (7 Days)
      market_data.price_change_percentage_7d_in_currency: Price Change 7d
    series_cell_visualizations:
      market_data.ath_change_percentage:
        is_active: false
      market_data.price_change_percentage_7d_in_currency:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0,
          options: {steps: 6, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    listen:
      Coin Highlight: market_data.coin_highlight
    row: 17
    col: 17
    width: 5
    height: 6
  - title: Top 10
    name: Top 10 (3)
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.symbol, stock_info.52_week_change]
    sorts: [stock_info.52_week_change desc]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      stock_info.52_week_change:
        is_active: true
        palette:
          palette_id: 81acb7b7-27d1-b388-f5be-a2a761836567
          collection_id: google-theme
          custom_colors:
          - "#FFF"
          - "#4ee807"
    header_font_color: "#FFF"
    header_background_color: "#7CB342"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0,
          options: {steps: 5, mirror: false}}, bold: false, italic: false, strikethrough: false,
        fields: [stock_info.52_week_change]}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
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
    row: 17
    col: 2
    width: 10
    height: 6
  - name: '52 Week Change Comparisons '
    type: text
    title_text: '52 Week Change Comparisons '
    subtitle_text: ''
    body_text: " "
    row: 16
    col: 2
    width: 10
    height: 1
  - name: 52 Week Change Comparisons
    type: text
    title_text: 52 Week Change Comparisons
    subtitle_text: ''
    body_text: " "
    row: 23
    col: 2
    width: 9
    height: 1
  - title: Bottom 10
    name: Bottom 10 (3)
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.symbol, stock_info.52_week_change]
    sorts: [stock_info.52_week_change]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      stock_info.52_week_change:
        is_active: true
        palette:
          palette_id: 024070dc-f61f-be2e-2f99-63b792f55896
          collection_id: google-theme
          custom_colors:
          - "#FFF"
          - "#42e80d"
    header_font_color: "#FFF"
    header_background_color: "#7CB342"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0,
          options: {steps: 5, mirror: false}}, bold: false, italic: false, strikethrough: false,
        fields: [stock_info.52_week_change]}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: normal
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
    row: 24
    col: 2
    width: 10
    height: 6
  - title: Crypto Segment
    name: Crypto Segment
    model: portfolio
    explore: market_data
    type: finance_portfolio_demo::crypto_heatmap
    fields: [market_data.symbol, market_data.market_cap, market_data.market_cap_change_percentage_24h,
      market_data.current_price]
    filters:
      history_with_date_crossjoin.history_granularity: month
    sorts: [market_data.market_cap desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      market_data.market_cap_change_percentage_24h: Market Cap % Change (24hrs)
      market_data.id: Currency
    show_view_names: false
    min_font_size: 8
    positive_color: "#25d4ff"
    neutral_color: "#10789e"
    negative_color: "#0d1566"
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [market_data.name, market_data.symbol, market_data.current_price,
      market_data.high_24h, market_data.low_24h]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      market_data.market_cap_change_percentage_24h:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    header_font_color: "#fff"
    header_background_color: "#7CB342"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 0
    listen:
      Coin Highlight: market_data.coin_highlight
    row: 6
    col: 12
    width: 10
    height: 10
  - title: Stock by Sector
    name: Stock by Sector
    model: portfolio
    explore: stock_info
    type: finance_portfolio_demo::stock_sector_heatmap
    fields: [stock_info.symbol, stock_info.current_price, stock_info.market_cap, stock_info.sector,
      stock_info.52_week_change]
    sorts: [stock_info.market_cap desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    show_row_numbers: false
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
    series_column_widths:
      stock_info.symbol: 94
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
    defaults_version: 0
    listen: {}
    row: 6
    col: 2
    width: 10
    height: 10
  - name: Crypto Currencies
    type: text
    title_text: Crypto Currencies
    body_text: ''
    row: 1
    col: 14
    width: 8
    height: 1
  - name: Equity
    type: text
    title_text: Equity
    body_text: ''
    row: 1
    col: 2
    width: 8
    height: 1
  - title: S&P 500 52 Week Change
    name: S&P 500 52 Week Change
    model: portfolio
    explore: stock_info
    type: single_value
    fields: [stock_info.sandp_52_week_change]
    sorts: [stock_info.sandp_52_week_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    conditional_formatting: [{type: greater than, value: 0, background_color: "#F9AB00",
        font_color: "#FFF", color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 2
    col: 9
    width: 6
    height: 4
  - title: Avg 52 Wk Change Equity
    name: Avg 52 Wk Change Equity
    model: portfolio
    explore: stock_info
    type: single_value
    fields: [average_of_52_week_change]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: stock_info.52_week_change
      expression: ''
      label: Average of 52 Week Change
      measure: average_of_52_week_change
      type: average
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    conditional_formatting: [{type: greater than, value: 0, background_color: "#7CB342",
        font_color: "#FFF", color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen: {}
    row: 2
    col: 2
    width: 7
    height: 4
  - title: Avg 7d Change  Crypto
    name: Avg 7d Change  Crypto
    model: portfolio
    explore: market_data
    type: single_value
    fields: [average_of_price_change_percentage_in_currency_7_days]
    filters: {}
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: market_data.price_change_percentage_7d_in_currency
      expression: ''
      label: Average of Price Change Percentage in currency - 7 days
      measure: average_of_price_change_percentage_in_currency_7_days
      type: average
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google-theme
      palette_id: google-theme-categorical-0
    conditional_formatting: [{type: greater than, value: 0, background_color: "#7CB342",
        font_color: !!null '', color_application: {collection_id: google-theme, palette_id: google-theme-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 0, background_color: "#7CB342", font_color: "#FFF", color_application: {
          collection_id: google-theme, palette_id: google-theme-diverging-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Coin Highlight: market_data.coin_highlight
    row: 2
    col: 15
    width: 7
    height: 4
  - title: tickerscroll
    name: tickerscroll
    model: portfolio
    explore: portfolio
    type: finance_portfolio_demo::ticker-scroll
    fields: [portfolio.id, portfolio.current_price]
    sorts: [portfolio.current_price desc]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size: 16
    scroll_speed: 200
    background_color: "#000000"
    text_color: "#1dff63"
    hidden_pivots: {}
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
    defaults_version: 0
    title_hidden: true
    listen: {}
    row: 0
    col: 2
    width: 20
    height: 1
  - name: Market Benchmark
    type: text
    title_text: Market Benchmark
    subtitle_text: ''
    body_text: ''
    row: 1
    col: 10
    width: 4
    height: 1
  filters:
  - name: Coin Highlight
    title: Coin Highlight
    type: field_filter
    default_value: Bitcoin
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: portfolio
    explore: market_data
    listens_to_filters: []
    field: market_data.coin_highlight
