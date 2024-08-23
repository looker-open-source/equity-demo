- dashboard: chain_trends
  title: Chain Trends
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: DIELmk76yWyHWn5EyIT9Lm
  elements:
  - title: Avg Transaction Count per Block -  3 Mo
    name: Avg Transaction Count per Block -  3 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, full_public_dataset.avg_transaction_count]
    filters:
      full_public_dataset.real_block_timestamp_month: 3 months
    sorts: [full_public_dataset.avg_transaction_count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    minimum_column_width: 75
    defaults_version: 1
    series_column_widths:
      full_public_dataset.coin_id: 156
    hidden_pivots: {}
    listen: {}
    row: 42
    col: 2
    width: 7
    height: 4
  - title: Average Block Size - Last 6 Months
    name: Average Block Size - Last 6 Months
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [average_of_block_size, full_public_dataset.coin_id]
    filters:
      full_public_dataset.real_block_timestamp_month: 6 months
    sorts: [average_of_block_size desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    minimum_column_width: 75
    defaults_version: 1
    series_column_widths:
      full_public_dataset.coin_id: 156
    listen: {}
    row: 26
    col: 9
    width: 7
    height: 5
  - title: Average Block Size - Last 9 Months
    name: Average Block Size - Last 9 Months
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [average_of_block_size, full_public_dataset.coin_id]
    filters:
      full_public_dataset.real_block_timestamp_month: 9 months
    sorts: [average_of_block_size desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    minimum_column_width: 75
    defaults_version: 1
    series_column_widths:
      full_public_dataset.coin_id: 156
    listen: {}
    row: 26
    col: 16
    width: 6
    height: 5
  - title: Avg Transaction Count per Block -  6 Mo
    name: Avg Transaction Count per Block -  6 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, full_public_dataset.avg_transaction_count]
    filters:
      full_public_dataset.real_block_timestamp_month: 6 months
    sorts: [full_public_dataset.avg_transaction_count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    minimum_column_width: 75
    defaults_version: 1
    series_column_widths:
      full_public_dataset.coin_id: 156
    hidden_pivots: {}
    listen: {}
    row: 42
    col: 9
    width: 6
    height: 4
  - title: Avg Transaction Count per Block -  9 Mo
    name: Avg Transaction Count per Block -  9 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, full_public_dataset.avg_transaction_count]
    filters:
      full_public_dataset.real_block_timestamp_month: 9 months
    sorts: [full_public_dataset.avg_transaction_count desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    minimum_column_width: 75
    defaults_version: 1
    series_column_widths:
      full_public_dataset.coin_id: 156
    hidden_pivots: {}
    listen: {}
    row: 42
    col: 15
    width: 7
    height: 4
  - title: Count of No-Fee Transactions - 6 Mo
    name: Count of No-Fee Transactions - 6 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, sum_of_transaction_count]
    filters:
      full_public_dataset.fee: '0'
      full_public_dataset.real_block_timestamp_month: 6 months
    sorts: [full_public_dataset.coin_id]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_count
      expression: ''
      label: Sum of Transaction Count
      measure: sum_of_transaction_count
      type: sum
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
      sum_of_transaction_count: Total Transaction Count
    series_cell_visualizations:
      sum_of_transaction_count:
        is_active: true
    series_value_format:
      sum_of_transaction_count:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 49
    col: 2
    width: 6
    height: 4
  - title: Total Transaction Count - Fee Incurred -  6 Mo
    name: Total Transaction Count - Fee Incurred -  6 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, sum_of_transaction_count]
    filters:
      full_public_dataset.fee: not 0
      full_public_dataset.real_block_timestamp_month: 6 months
    sorts: [full_public_dataset.coin_id]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_count
      expression: ''
      label: Sum of Transaction Count
      measure: sum_of_transaction_count
      type: sum
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
      sum_of_transaction_count: Total Transaction Count
    series_cell_visualizations:
      sum_of_transaction_count:
        is_active: true
    series_value_format:
      sum_of_transaction_count:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 49
    col: 8
    width: 7
    height: 4
  - title: Fee Comparison -  6 Mo
    name: Fee Comparison -  6 Mo
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [full_public_dataset.coin_id, sum_of_fee, average_of_fee]
    filters:
      full_public_dataset.real_block_timestamp_month: 6 months
    sorts: [full_public_dataset.coin_id]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_count
      expression: ''
      label: Sum of Transaction Count
      measure: sum_of_transaction_count
      type: sum
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.fee
      expression: ''
      label: Sum of Fee
      measure: sum_of_fee
      type: sum
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.fee
      expression: ''
      label: Average of Fee
      measure: average_of_fee
      type: average
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
      sum_of_transaction_count: Total Transaction Count
      average_of_fee: Average Fee Paid
      sum_of_fee: Total Fee Paid
    series_cell_visualizations:
      sum_of_transaction_count:
        is_active: true
    series_value_format:
      sum_of_fee:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      average_of_fee:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
    hidden_pivots: {}
    defaults_version: 1
    listen: {}
    row: 49
    col: 15
    width: 7
    height: 4
  - title: Average Transaction Size - Comparison
    name: Average Transaction Size - Comparison
    model: portfolio
    explore: full_public_dataset
    type: looker_line
    fields: [full_public_dataset.coin_id, average_of_transaction_size, full_public_dataset.block_timestamp_year]
    pivots: [full_public_dataset.coin_id]
    fill_fields: [full_public_dataset.block_timestamp_year]
    sorts: [full_public_dataset.coin_id, full_public_dataset.block_timestamp_year]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_size
      expression: ''
      label: Average of Transaction Size
      measure: average_of_transaction_size
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
    y_axes: [{label: Average Transaction Size (Bytes), orientation: left, series: [
          {axisId: average_of_transaction_size, id: bitcoin - average_of_transaction_size,
            name: bitcoin}, {axisId: average_of_transaction_size, id: bitcoin-cash
              - average_of_transaction_size, name: bitcoin-cash}, {axisId: average_of_transaction_size,
            id: dogecoin - average_of_transaction_size, name: dogecoin}, {axisId: average_of_transaction_size,
            id: litecoin - average_of_transaction_size, name: litecoin}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Year
    x_axis_zoom: true
    y_axis_zoom: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      average_of_block_size:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen: {}
    row: 2
    col: 2
    width: 20
    height: 10
  - title: Average Transaction Count per Block - Comparison
    name: Average Transaction Count per Block - Comparison
    model: portfolio
    explore: full_public_dataset
    type: looker_line
    fields: [full_public_dataset.coin_id, full_public_dataset.block_timestamp_year,
      full_public_dataset.avg_transaction_count]
    pivots: [full_public_dataset.coin_id]
    fill_fields: [full_public_dataset.block_timestamp_year]
    sorts: [full_public_dataset.coin_id, full_public_dataset.block_timestamp_year]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_size
      expression: ''
      label: Average of Transaction Size
      measure: average_of_transaction_size
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
    y_axes: [{label: Average Count of Transactions per Block, orientation: left, series: [
          {axisId: full_public_dataset.avg_transaction_count, id: bitcoin - full_public_dataset.avg_transaction_count,
            name: bitcoin}, {axisId: full_public_dataset.avg_transaction_count, id: bitcoin-cash
              - full_public_dataset.avg_transaction_count, name: bitcoin-cash}, {
            axisId: full_public_dataset.avg_transaction_count, id: dogecoin - full_public_dataset.avg_transaction_count,
            name: dogecoin}, {axisId: full_public_dataset.avg_transaction_count, id: litecoin
              - full_public_dataset.avg_transaction_count, name: litecoin}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Year
    x_axis_zoom: true
    y_axis_zoom: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      average_of_block_size:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen: {}
    row: 34
    col: 2
    width: 20
    height: 8
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---"
    row: 31
    col: 2
    width: 20
    height: 1
  - title: Average Block Size - Comparison
    name: Average Block Size - Comparison
    model: portfolio
    explore: full_public_dataset
    type: looker_line
    fields: [full_public_dataset.coin_id, full_public_dataset.block_timestamp_year,
      average_of_block_size]
    pivots: [full_public_dataset.coin_id]
    fill_fields: [full_public_dataset.block_timestamp_year]
    sorts: [full_public_dataset.coin_id, full_public_dataset.block_timestamp_year]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.transaction_size
      expression: ''
      label: Average of Transaction Size
      measure: average_of_transaction_size
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
    y_axes: [{label: Average Size of Blocks (Bytes), orientation: left, series: [
          {axisId: average_of_block_size, id: bitcoin - average_of_block_size, name: bitcoin},
          {axisId: average_of_block_size, id: bitcoin-cash - average_of_block_size,
            name: bitcoin-cash}, {axisId: average_of_block_size, id: dogecoin - average_of_block_size,
            name: dogecoin}, {axisId: average_of_block_size, id: litecoin - average_of_block_size,
            name: litecoin}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Year
    x_axis_zoom: true
    y_axis_zoom: true
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_cell_visualizations:
      average_of_block_size:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    listen: {}
    row: 15
    col: 2
    width: 20
    height: 11
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Average Transaction Size","color":"hsl(0,
      0%, 0%)"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 2
    width: 20
    height: 2
  - name: " (Copy 2)"
    type: text
    title_text: " (Copy 2)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Average Block Size","color":"hsl(0,
      0%, 0%)"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 13
    col: 2
    width: 20
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---"
    row: 46
    col: 2
    width: 20
    height: 1
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---"
    row: 12
    col: 2
    width: 20
    height: 1
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Transaction Fees","color":"hsl(0,
      0%, 0%)"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 47
    col: 2
    width: 20
    height: 2
  - name: " (Copy 3)"
    type: text
    title_text: " (Copy 3)"
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Average Transaction Count Per Block","color":"hsl(0,
      0%, 0%)"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 32
    col: 2
    width: 20
    height: 2
  - name: " (6)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 2
    height: 69
  - name: " (7)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: " "
    row: 0
    col: 22
    width: 2
    height: 69
  - name: " (8)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "###Learn more about this project, the data sources, architecture,\
      \ and how to best use this and other related dashboards:"
    row: 53
    col: 9
    width: 5
    height: 5
  - type: button
    name: button_136
    rich_content_json: '{"text":"go/crypto-docs","description":"Internal project documentation
      go-link","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"go/crypto-docs"}'
    row: 53
    col: 15
    width: 5
    height: 5
  - name: " (9)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":""}],"id":"imocu"},{"type":"h1","children":[{"text":"Note:","fontSize":"10.5pt","backgroundColor":"transparent","color":"rgb(38,
      45, 51)","bold":true},{"text":" To dig further into a single chain, click on
      the three dots to the right of the chain name in a chart to navigate to a dashboard
      filtered on that specific chain.","fontSize":"10.5pt","backgroundColor":"transparent","color":"rgb(38,
      45, 51)"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 53
    col: 2
    width: 7
    height: 6
  - title: Average Block Size - Last 3 Months
    name: Average Block Size - Last 3 Months
    model: portfolio
    explore: full_public_dataset
    type: looker_grid
    fields: [average_of_block_size, full_public_dataset.coin_id]
    filters:
      full_public_dataset.real_block_timestamp_month: 3 months
    sorts: [average_of_block_size desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: full_public_dataset.block_size
      expression: ''
      label: Average of Block Size
      measure: average_of_block_size
      type: average
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    minimum_column_width: 75
    defaults_version: 1
    series_column_widths:
      full_public_dataset.coin_id: 156
    row: 26
    col: 2
    width: 7
    height: 5
