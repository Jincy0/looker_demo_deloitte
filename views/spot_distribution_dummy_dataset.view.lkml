view: spot_distribution_dummy_dataset {
  sql_table_name: `martech-assets.Dummy_looker_data.spot_distribution_dummy_dataset` ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }
  dimension: hour_bucket {
    type: number
    sql: ${TABLE}.hour_bucket ;;
  }
  dimension: spends_inr {
    type: number
    sql: ${TABLE}.spends_inr ;;
  }
  dimension_group: spot {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.spot_date ;;
  }
  dimension: spot_share_pct {
    type: number
    sql: ${TABLE}.spot_share_pct ;;
  }
  dimension: spots {
    type: number
    sql: ${TABLE}.spots ;;
  }
  measure: count {
    type: count
  }
}
