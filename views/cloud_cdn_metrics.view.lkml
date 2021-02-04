view: cloud_cdn_metrics {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: `sourabhjainceanalytics.cdn_logs.cloudcdn_logs`
  ;;

  dimension: session_id {
    type: string
    sql: ${TABLE}.sessionId ;;
  }

  dimension: egress_bytes {
    type: number
    sql: ${TABLE}.egressBytes ;;
  }

  dimension: client_latency {
    type: number
    sql: ${TABLE}.clientLatency ;;
  }

  dimension: is_cache_hit {
    type: yesno
    sql: ${TABLE}.isCacheHit ;;
    #sql:  case when ${TABLE}.isCacheHit = True then 1 else 0 END ;;
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
    sql: ${TABLE}.publishTime ;;
  }

  measure: cache_hit_count {
    type: count
    label: "Cache Hit Count"
    filters: {
      field: is_cache_hit
      value: "yes"
    }
  }

  # measure: cache_hit_ratio {
  #   label: "Cache Hit Ratio"
  #   type: number
  #   sql:  $(${cache_hit_count}::numeric / $ ;;
  # }

  measure: avg_client_latency {
    type: average
    sql: ${client_latency} ;;
    value_format: "0.##\s"
    drill_fields: []
  }

  measure: session_count {
    type: count_distinct
    sql:  ${session_id} ;;
    drill_fields: []
  }

  measure: total_cdn_egress_MB {
    type: sum
    sql:  ${egress_bytes}/(1024*1024)  ;;
    #value_format: "0.##\s"
    value_format: "0.##"
    drill_fields: []
  }

  # measure: cache_hit_ratio {
  #   type: percent_of_total
  #   sql:  ${cache_hit.count}/${is_cache_hit.count}  ;;
  #   value_format: "0.##\s"
  #   drill_fields: []
  # }


  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: cloud_cdn_metrics {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
