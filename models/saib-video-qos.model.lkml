connection: "lookerdata"

# include all the views
include: "/views/**/*.view"

include: "/**/*.dashboard"



# datagroup: saib-video-qos_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "1 hour"
# }

# persist_with: saib-video-qos_default_datagroup

# explore: video_qoe_events {
#   from:  video_qoe_events
# }

# datagroup: startup_time_datagroup {
#   sql_trigger: SELECT startup_time FROM  ;;
#   max_cache_age: "24 hours"
#   label: "ETL ID added"
#   description: "Triggered when new ID is added to ETL log"
# }

explore: video_qoe_events {}
#explore: session_details_last_timestamp {}
explore: cloud_cdn_metrics {}

# explore: video_qoe_events {
#   join: cloud_cdn_metrics {
#     type: left_outer
#     relationship:  many_to_one
#     sql_on:  ${video_qoe_events.session_id} = ${cloud_cdn_metrics.session_id} ;;
#   }
# }

explore: session_details_last_timestamp {
  join: cloud_cdn_metrics {
    type: left_outer
    relationship:  one_to_many
    sql_on: ${session_details_last_timestamp.video_qoe_events_session_id} = ${cloud_cdn_metrics.session_id} ;;
  }
}
