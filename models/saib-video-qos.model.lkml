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
