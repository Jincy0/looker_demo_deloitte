view: tv_planned_delivered_dummy {
  sql_table_name: `martech-assets.Dummy_looker_data.tv_planned_delivered_dummy` ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: delivered_grps {
    type: number
    sql: ${TABLE}.delivered_grps ;;
  }
  dimension: delivered_reach_freq {
    type: number
    sql: ${TABLE}.delivered_reach_freq ;;
  }
  dimension: delivered_reach_pct {
    type: number
    sql: ${TABLE}.delivered_reach_pct ;;
  }
  dimension: frequency_bucket {
    type: number
    sql: ${TABLE}.frequency_bucket ;;
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
  dimension: planned_grps {
    type: number
    sql: ${TABLE}.planned_grps ;;
  }
  dimension: planned_reach_freq {
    type: number
    sql: ${TABLE}.planned_reach_freq ;;
  }
  dimension: planned_reach_pct {
    type: number
    sql: ${TABLE}.planned_reach_pct ;;
  }
  measure: count {
    type: count
  }
}
