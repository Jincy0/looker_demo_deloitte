view: digital_planned_delivered_dummy {
  sql_table_name: `martech-assets.Dummy_looker_data.digital_planned_delivered_dummy` ;;

  dimension: brand {
    primary_key: yes
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: delivered_clicks {
    type: number
    sql: ${TABLE}.delivered_clicks ;;
  }
  dimension: delivered_impressions {
    type: number
    sql: ${TABLE}.delivered_impressions ;;
  }
  dimension: delivered_spend {
    type: number
    sql: ${TABLE}.delivered_spend ;;
  }
  dimension: delivered_views {
    type: number
    sql: ${TABLE}.delivered_views ;;
  }
  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }
  dimension_group: month_year {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month_year ;;
  }
  dimension: planned_clicks {
    type: number
    sql: ${TABLE}.planned_clicks ;;
  }
  dimension: planned_impressions {
    type: number
    sql: ${TABLE}.planned_impressions ;;
  }
  dimension: planned_spend {
    type: number
    sql: ${TABLE}.planned_spend ;;
  }
  dimension: planned_views {
    type: number
    sql: ${TABLE}.planned_views ;;
  }
  measure: count {
    type: count
  }
}
