---
- dashboard: market_overview
  title: Market Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: LBbTIdJk3stYt85L3CDo1p
  elements:
  - name: 24 Hour Price Change Comparison
    type: text
    title_text: 24 Hour Price Change Comparison
    subtitle_text: Crypto Movers and Shakers
    body_text: " "
    row: 46
    col: 12
    width: 10
    height: 2
  - title: Top 10
    name: Top 10
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.name, market_data.price_change_percentage_7d_in_currency]
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
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      market_data.id: Currency
      market_data.ath_change_percentage: Price Change %  (7 Days)
      market_data.price_change_percentage_7d_in_currency: "% Price Change (7 days)"
    series_cell_visualizations:
      market_data.ath_change_percentage:
        is_active: false
      market_data.price_change_percentage_7d_in_currency:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    header_font_color: "#FFF"
    header_background_color: "#7CB342"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 6, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    row: 40
    col: 12
    width: 5
    height: 6
  - title: Crypto Currency Outlook by Market Cap
    name: Crypto Currency Outlook by Market Cap
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.name, market_data.id, market_data.symbol, market_data.market_cap_rank,
      market_data.market_cap, market_data.market_cap_change_percentage_24h, market_data.current_price]
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
    header_background_color: "#7CB342"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [market_data.id]
    listen:
      Coin Highlight: market_data.coin_highlight
    row: 14
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
    series_labels:
      market_data.market_cap_change_percentage_24h: Market Cap % Change (24hrs)
      market_data.id: Currency
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
    row: 28
    col: 12
    width: 10
    height: 10
  - title: Equity Outlook by Market Cap
    name: Equity Outlook by Market Cap
    model: portfolio
    explore: stock_info
    type: looker_grid
    fields: [stock_info.short_name, stock_info.symbol, stock_info.current_price, stock_info.current_ratio,
      stock_info.market_cap, stock_info.regular_market_volume]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_column_widths:
      stock_info.short_name: 236
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
    defaults_version: 1
    listen: {}
    row: 14
    col: 2
    width: 10
    height: 12
  - title: Average Opening Price by Month
    name: Average Opening Price by Month
    model: portfolio
    explore: stock_info
    type: looker_line
    fields: [average_of_open, stock_history_with_date_crossjoin.id, stock_history_with_date_crossjoin.date_selection_month]
    pivots: [stock_history_with_date_crossjoin.id]
    fill_fields: [stock_history_with_date_crossjoin.date_selection_month]
    filters:
      stock_history_with_date_crossjoin.date_selection_month: 12 months
    sorts: [stock_history_with_date_crossjoin.id, stock_history_with_date_crossjoin.date_selection_month
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
    row: 28
    col: 2
    width: 10
    height: 10
  - type: button
    name: button_193
    rich_content_json: '{"text":"View My Portfolio","description":"Navigate to your
      personal portfolio to view your holdings.","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://b772aff5-4b93-454c-9b34-147289eb2172.looker.app/dashboards/jqkqrA1RP7nEsgj4XFneiu"}'
    row: 54
    col: 9
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
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      market_data.id: Currency
      market_data.price_change_percentage_24h: "% Price Change (24 hours)"
    series_cell_visualizations:
      market_data.price_change_percentage_24h:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        value_display: true
    header_font_color: "#FFF"
    header_background_color: "#7CB342"
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
    row: 48
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      market_data.id: Currency
      market_data.price_change_percentage_24h: "% Price Change (24 hours)"
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
    header_background_color: "#7CB342"
    conditional_formatting: [{type: less than, value: 0, background_color: "#e8a29c",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: equal to, value: 0, background_color: '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0, background_color: "#7CB342",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 4a00499b-c0fe-4b15-a304-4083c07ff4c4, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      Coin Highlight: market_data.coin_highlight
    row: 48
    col: 17
    width: 5
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: " "
    row: 0
    col: 0
    width: 2
    height: 62
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: " "
    row: 0
    col: 22
    width: 2
    height: 62
  - name: 7 Day  Price Change Comparison
    type: text
    title_text: 7 Day  Price Change Comparison
    subtitle_text: Crypto Movers and Shakers
    body_text: " "
    row: 38
    col: 12
    width: 10
    height: 2
  - name: Price Information
    type: text
    title_text: Price Information
    subtitle_text: ''
    body_text: ''
    row: 26
    col: 2
    width: 20
    height: 2
  - name: Key Numbers
    type: text
    title_text: Key Numbers
    subtitle_text: ''
    body_text: ''
    row: 12
    col: 2
    width: 20
    height: 2
  - title: Bottom 10
    name: Bottom 10 (2)
    model: portfolio
    explore: market_data
    type: looker_grid
    fields: [market_data.name, market_data.price_change_percentage_7d_in_currency]
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
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      market_data.id: Currency
      market_data.ath_change_percentage: Price Change %  (7 Days)
      market_data.price_change_percentage_7d_in_currency: "% Price Change (7 days)"
    series_cell_visualizations:
      market_data.ath_change_percentage:
        is_active: false
      market_data.price_change_percentage_7d_in_currency:
        is_active: true
        palette:
          palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    header_font_color: "#FFF"
    header_background_color: "#7CB342"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 6, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    row: 40
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      stock_info.52_week_change:
        is_active: true
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 5b121cce-cf79-457c-a52a-9162dc174766,
          palette_id: 12809dc5-ac61-4801-8878-10c61fb43c60, options: {steps: 5, mirror: false}},
        bold: false, italic: false, strikethrough: false, fields: [stock_info.52_week_change]}]
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
    row: 40
    col: 2
    width: 10
    height: 6
  - name: '52 Week Change Comparisons '
    type: text
    title_text: '52 Week Change Comparisons '
    subtitle_text: Losers
    body_text: " "
    row: 46
    col: 2
    width: 10
    height: 2
  - name: 52 Week Change Comparisons
    type: text
    title_text: 52 Week Change Comparisons
    subtitle_text: Winners
    body_text: " "
    row: 38
    col: 2
    width: 10
    height: 2
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      stock_info.52_week_change:
        is_active: true
    header_font_color: "#FFF"
    header_background_color: "#1A73E8"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 5b121cce-cf79-457c-a52a-9162dc174766,
          palette_id: 12809dc5-ac61-4801-8878-10c61fb43c60, options: {steps: 5, mirror: false}},
        bold: false, italic: false, strikethrough: false, fields: [stock_info.52_week_change]}]
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
    row: 48
    col: 2
    width: 10
    height: 6
  - title: scroll
    name: scroll
    model: portfolio
    explore: stock_info
    type: ticker-scroll
    fields: [stock_info.symbol, stock_info.current_price]
    sorts: [stock_info.symbol]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    scroll_speed: 100
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
    listen: {}
    row: 1
    col: 2
    width: 10
    height: 1
  - title: crypto-scroll
    name: crypto-scroll
    model: portfolio
    explore: market_data
    type: ticker-scroll
    fields: [market_data.symbol, market_data.current_price]
    sorts: [market_data.symbol]
    limit: 500
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size: 16
    scroll_speed: 100
    background_color: "#000000"
    text_color: "#ffb51d"
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
      Coin Highlight: market_data.coin_highlight
    row: 1
    col: 12
    width: 10
    height: 1
  - title: heat
    name: heat
    model: portfolio
    explore: market_data
    type: crypto_heatmap
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
    title_hidden: true
    listen:
      Coin Highlight: market_data.coin_highlight
    row: 2
    col: 12
    width: 10
    height: 10
  - title: stock sector
    name: stock sector
    model: portfolio
    explore: stock_info
    type: stock_sector_heatmap
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
    title_hidden: true
    listen: {}
    row: 2
    col: 2
    width: 10
    height: 10
  - name: Crypto Currencies
    type: text
    title_text: Crypto Currencies
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 12
    width: 10
    height: 1
  - name: Equity
    type: text
    title_text: Equity
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 2
    width: 10
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
