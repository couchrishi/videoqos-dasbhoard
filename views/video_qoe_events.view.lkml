view: video_qoe_events {
  sql_table_name: `sourabhjainceanalytics.video_sessions_dataset.video_qoe_events`
    ;;

  dimension: session_id {
    type: string
    sql: ${TABLE}.sessionId ;;
  }

  dimension: start_up_time {
    type: number
    sql: ${TABLE}.startUpTime ;;
  }

  dimension_group: time_stamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timeStamp ;;
  }

  dimension: total_buffer_count {
    type: number
    sql: ${TABLE}.totalBufferCount ;;
  }

  dimension: total_buffer_time {
    type: number
    sql: ${TABLE}.totalBufferTime ;;
  }

  dimension: video_src {
    type: string
    sql: ${TABLE}.videoSrc ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: avg_buffer_time {
    type: average
    sql:  ${total_buffer_time} ;;
    value_format: "0.##\s"
    drill_fields: []
  }

  measure: avg_startup_time {
    type: average
    sql: ${start_up_time} ;;
    value_format: "0.##\s"
    drill_fields: []
  }

  measure: session_count {
    type: count_distinct
    sql:  ${session_id} ;;
    drill_fields: []
  }
}
