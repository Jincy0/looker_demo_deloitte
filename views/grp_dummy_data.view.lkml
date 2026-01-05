view: grp_dummy_data {
  sql_table_name: `martech-assets.Dummy_looker_data.grp_dummy_data` ;;

  dimension: advertiser {
    type: string
    sql: ${TABLE}.Advertiser ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }
  dimension: channel {
    type: string
    sql: ${TABLE}.Channel ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: grps {
    type: number
    sql: ${TABLE}.GRPs ;;
  }
  dimension: market {
    type: string
    sql: ${TABLE}.Market ;;
  }
  dimension: month {
    type: string
    sql: ${TABLE}.Month ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.Year ;;
  }
  measure: count {
    type: count
  }
}
