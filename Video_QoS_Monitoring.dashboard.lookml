- dashboard: video-qos-monitoring
  title: Video QoS
  layout: newspaper
  refresh: 5 hours
  preferred_viewer: dashboards-next
  elements:
  - title: ''
    name: ''
    model: saib-video-qos
    explore: video_qoe_events
    type: single_value
    fields: [video_qoe_events.avg_buffer_time]
    limit: 500
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Avg. Buffer Time
    defaults_version: 1
    listen: {}
    row: 0
    col: 9
    width: 3
    height: 3
  - title: ''
    name: " (2)"
    model: saib-video-qos
    explore: video_qoe_events
    type: single_value
    fields: [video_qoe_events.avg_startup_time]
    sorts: [video_qoe_events.avg_startup_time desc]
    limit: 500
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    single_value_title: Avg. Startup Time
    defaults_version: 1
    listen: {}
    row: 0
    col: 5
    width: 3
    height: 3
  - title: ''
    name: " (3)"
    model: saib-video-qos
    explore: video_qoe_events
    type: single_value
    fields: [video_qoe_events.session_count]
    limit: 500
    query_timezone: UTC
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
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#EA8600"
    single_value_title: Unique Sessions
    defaults_version: 1
    listen: {}
    row: 0
    col: 13
    width: 3
    height: 3
  - title: Session Details
    name: Session Details
    model: saib-video-qos
    explore: session_details_last_timestamp
    type: looker_grid
    fields: [session_details_last_timestamp.video_qoe_events_session_id,session_details_last_timestamp.video_qoe_events_time_stamp_time,
    session_details_last_timestamp.video_qoe_events_content_name,session_details_last_timestamp.video_qoe_events_video_src,
    session_details_last_timestamp.video_qoe_events_start_up_time,session_details_last_timestamp.video_qoe_events_total_buffer_time,
    session_details_last_timestamp.video_qoe_events_total_buffer_count,session_details_last_timestamp.video_qoe_events_user_ip,
    session_details_last_timestamp.video_qoe_events_watch_time,session_details_last_timestamp.video_qoe_events_session_status
    ]
    sorts: [session_details_last_timestamp.video_qoe_events_time_stamp_time desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
    collection_id: google
    palette_id: google-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
    video_qoe_events.time_stamp_time: 272
    video_qoe_events.video_src: 629
    video_qoe_events.total_buffer_time: 179
    video_qoe_events.start_up_time: 163
    video_qoe_events.total_buffer_count: 162
    video_qoe_events.session_id: 245
    header_font_color: ''
    header_background_color: "#34A853"
    custom_color_enabled: true
    custom_color: "#EA8600"
    show_single_value_title: true
    single_value_title: Unique Sessions
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    series_types: {}
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
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 3
    col: 1
    width: 23
    height: 12
