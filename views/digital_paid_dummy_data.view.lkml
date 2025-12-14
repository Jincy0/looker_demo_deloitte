view: digital_paid_dummy_data {
  sql_table_name: `martech-assets.Dummy_looker_data.digital_paid_dummy_data` ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }
  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: complete_video_views {
    type: number
    sql: ${TABLE}.complete_video_views ;;
  }
  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }
  dimension_group: month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month ;;
  }
  dimension: placement {
    type: string
    sql: ${TABLE}.placement ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension: quarter {
    type: string
    sql: ${TABLE}.quarter ;;
  }
  dimension: reach_dv360 {
    type: number
    sql: ${TABLE}.reach_dv360 ;;
  }
  dimension: reach_meta {
    type: number
    sql: ${TABLE}.reach_meta ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
  dimension: spends_inr {
    type: number
    sql: ${TABLE}.spends_inr ;;
  }
  dimension: video_views {
    type: number
    sql: ${TABLE}.video_views ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: impressions_m {
    type: sum
    sql: ${TABLE}.impressions ;;
  }
  measure: clicks_m {
    type: sum
    sql: ${TABLE}.clicks ;;
    value_format_name: decimal_0
    drill_fields: [brand, year, platform]
  }
  measure: spends_m {
    type: sum
    sql: ${TABLE}.spends_inr ;;
    value_format_name: decimal_2
  }

  measure: ctr {
    type: number
    sql: ${clicks_m} / NULLIF(${impressions_m}, 0) ;;
    value_format_name: percent_2
  }
  measure: reach_dv360_m {
    type: sum
    sql: ${TABLE}.reach_dv360 ;;
    value_format_name: decimal_0
    drill_fields: [brand, year, platform, region]
  }
  measure: reach_meta_m {
    type: sum
    sql: ${TABLE}.reach_meta ;;
    value_format_name: decimal_0
    drill_fields: [brand, year, platform, region]
  }
  measure: video_views_m {
    type: sum
    sql: ${TABLE}.video_views ;;
    value_format_name: decimal_0
    drill_fields: [brand, year, platform, region]
  }
  measure: complete_video_views_m {
    type: sum
    sql: ${TABLE}.complete_video_views ;;
    value_format_name: decimal_0
    drill_fields: [brand, year, platform, region]
  }


  measure: count {
    type: count
  }
}
