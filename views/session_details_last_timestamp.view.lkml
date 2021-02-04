view: session_details_last_timestamp {
  derived_table: {
    sql: SELECT
        video_qoe_events.sessionId  AS video_qoe_events_session_id,
        FORMAT_TIMESTAMP('%F %T', TIMESTAMP(FORMAT_TIMESTAMP('%F %H:%M:%E*S', video_qoe_events.timeStamp , 'America/Los_Angeles'))) AS video_qoe_events_time_stamp_time,
        video_qoe_events.contentName  AS video_qoe_events_content_name,
        video_qoe_events.videoSrc  AS video_qoe_events_video_src,
        video_qoe_events.startUpTime  AS video_qoe_events_start_up_time,
        video_qoe_events.totalBufferTime  AS video_qoe_events_total_buffer_time,
        video_qoe_events.totalBufferCount  AS video_qoe_events_total_buffer_count,
        video_qoe_events.srcIp  AS video_qoe_events_user_ip,
        video_qoe_events.playTime  AS video_qoe_events_watch_time,
        video_qoe_events.sessionStatus  AS video_qoe_events_session_status
      FROM `sourabhjainceanalytics.video_sessions_dataset.video_qoe_events`
           AS video_qoe_events
      WHERE timestamp = (SELECT MAX(timestamp) FROM `sourabhjainceanalytics.video_sessions_dataset.video_qoe_events` s2 WHERE video_qoe_events.sessionId = s2.sessionId)
      GROUP BY 1,2,3,4,5,6,7,8,9,10
      ORDER BY 2 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: video_qoe_events_session_id {
    type: string
    label: "Session ID"
    sql: ${TABLE}.video_qoe_events_session_id ;;
  }

  dimension: video_qoe_events_time_stamp_time {
    type: string
    label: "Timestamp"
    sql: ${TABLE}.video_qoe_events_time_stamp_time ;;
  }

  dimension: video_qoe_events_content_name {
    type: string
    label: "Content"
    sql: ${TABLE}.video_qoe_events_content_name ;;
  }

  dimension: video_qoe_events_video_src {
    type: string
    label: "Source"
    sql: ${TABLE}.video_qoe_events_video_src ;;
  }

  dimension: video_qoe_events_start_up_time {
    type: number
    label: "Start Up Time"
    sql: ${TABLE}.video_qoe_events_start_up_time ;;
  }

  dimension: video_qoe_events_total_buffer_time {
    type: number
    label: "Buffer Duration"
    sql: ${TABLE}.video_qoe_events_total_buffer_time ;;
  }

  dimension: video_qoe_events_total_buffer_count {
    type: number
    label: "Buffer Count"
    sql: ${TABLE}.video_qoe_events_total_buffer_count ;;
  }

  dimension: video_qoe_events_user_ip {
    type: string
    label: "IP"
    sql: ${TABLE}.video_qoe_events_user_ip ;;
  }

  dimension: video_qoe_events_watch_time {
    type: number
    label:  "Play Time"
    sql: ${TABLE}.video_qoe_events_watch_time ;;
  }

  dimension: video_qoe_events_session_status {
    type: string
    label:  "Status"
    sql: ${TABLE}.video_qoe_events_session_status ;;
  }

  set: detail {
    fields: [
      video_qoe_events_session_id,
      video_qoe_events_time_stamp_time,
      video_qoe_events_content_name,
      video_qoe_events_video_src,
      video_qoe_events_start_up_time,
      video_qoe_events_total_buffer_time,
      video_qoe_events_total_buffer_count,
      video_qoe_events_user_ip,
      video_qoe_events_watch_time,
      video_qoe_events_session_status
    ]
  }
}
