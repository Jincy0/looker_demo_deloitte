view: volume_and_media_spends_dummydata {
  sql_table_name: `martech-assets.Dummy_looker_data.Volume_and_media_spends_dummydata` ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }
  dimension: grps {
    type: number
    sql: ${TABLE}.grps ;;
  }
  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }
  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
  }
  dimension: month_num {
    type: number
    sql: ${TABLE}.month_num ;;
  }
  dimension_group: month_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month_start_date ;;
  }
  dimension: number_of_campaigns {
    type: number
    sql: ${TABLE}.number_of_campaigns ;;
  }
  dimension: quarter {
    type: string
    sql: ${TABLE}.quarter ;;
  }
  dimension: sales_value_inr {
    type: number
    sql: ${TABLE}.sales_value_inr ;;
  }
  dimension: sales_volume_unit_cases {
    type: number
    sql: ${TABLE}.sales_volume_unit_cases ;;
  }
  dimension: spends_inr {
    type: number
    sql: ${TABLE}.spends_inr ;;
  }
  dimension: state_code {
    type: string
    sql: ${TABLE}.state_code ;;
  }
  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }
  dimension: state_location {
    type: location
    sql_latitude: ${TABLE}.state_lat ;;
    sql_longitude: ${TABLE}.state_lng ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
    drill_fields: [month_name, state_name]
  }
}
