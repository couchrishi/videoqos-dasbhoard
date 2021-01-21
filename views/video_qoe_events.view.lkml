view: video_qoe_events {
  sql_table_name: `sourabhjainceanalytics.video_sessions_dataset.video_qoe_events`
    ;;

  dimension: session_id {
    type: string
    sql: ${TABLE}.sessionId ;;
  }

  dimension: content_name {
    type: string
    sql: ${TABLE}.contentName ;;
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

  dimension: session_status {
    type: string
    sql: ${TABLE}.sessionStatus ;;
  }

  dimension: video_length {
    type: string
    sql: ${TABLE}.videoLength ;;
  }

  dimension: watch_time {
    type: string
    sql: ${TABLE}.playTime ;;
  }

  dimension: user_ip {
    type: string
    sql: ${TABLE}.srcIp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: last_time_stamp {
    type: date_time
    sql:  MAX(${time_stamp_time}) ;;
    convert_tz:  no
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

  measure: total_watch_time {
    type: sum
    sql:  ${ playTime } ;;
    value_format: "0.##\s"
    drill_fields: []
  }
}
