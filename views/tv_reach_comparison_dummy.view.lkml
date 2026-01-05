view: tv_reach_comparison_dummy {
  sql_table_name: `martech-assets.Dummy_looker_data.tv_reach_comparison_dummy` ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: grps {
    type: number
    sql: ${TABLE}.grps ;;
  }
  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }
  dimension_group: month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month_date ;;
  }
  dimension: reach_1_plus {
    type: number
    sql: ${TABLE}.reach_1_plus ;;
  }
  dimension: reach_2_plus {
    type: number
    sql: ${TABLE}.reach_2_plus ;;
  }
  dimension: reach_3_plus {
    type: number
    sql: ${TABLE}.reach_3_plus ;;
  }
  dimension: reach_4_plus {
    type: number
    sql: ${TABLE}.reach_4_plus ;;
  }
  dimension: reach_5_plus {
    type: number
    sql: ${TABLE}.reach_5_plus ;;
  }
  measure: count {
    type: count
  }
}
