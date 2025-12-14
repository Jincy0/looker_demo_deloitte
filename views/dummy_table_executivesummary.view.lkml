view: dummy_table_executivesummary {
  sql_table_name: `Dummy_looker_data.dummy_table_executivesummary` ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: brand_love {
    type: number
    sql: ${TABLE}.brand_love ;;
  }
  dimension: cpc {
    type: number
    sql: ${TABLE}.cpc ;;
  }
  dimension: cpm {
    type: number
    sql: ${TABLE}.cpm ;;
  }
  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
  }
  dimension: digital_complete_views {
    type: number
    sql: ${TABLE}.digital_complete_views ;;
  }
  dimension: digital_impressions {
    type: number
    sql: ${TABLE}.digital_impressions ;;
  }
  dimension: digital_reach {
    type: number
    sql: ${TABLE}.digital_reach ;;
  }
  dimension: digital_spends_inr_cr {
    type: number
    sql: ${TABLE}.digital_spends_inr_cr ;;
  }
  dimension: digital_true_views {
    type: number
    sql: ${TABLE}.digital_true_views ;;
  }
  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }
  dimension: month_num {
    type: number
    sql: ${TABLE}.month_num ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension: platform_group {
    type: string
    sql: ${TABLE}.platform_group ;;
  }
  dimension: sales_value_inr_cr {
    type: number
    sql: ${TABLE}.sales_value_inr_cr ;;
  }
  dimension: sales_volume_uc_m {
    type: number
    sql: ${TABLE}.sales_volume_uc_m ;;
  }
  dimension: spont {
    type: number
    sql: ${TABLE}.spont ;;
  }
  dimension: tom {
    type: number
    sql: ${TABLE}.tom ;;
  }
  dimension: top_viral_grade {
    type: number
    sql: ${TABLE}.top_viral_grade ;;
  }
  dimension: total_reach {
    type: number
    sql: ${TABLE}.total_reach ;;
  }
  dimension: tv_grps {
    type: number
    sql: ${TABLE}.tv_grps ;;
  }
  dimension: tv_impressions {
    type: number
    sql: ${TABLE}.tv_impressions ;;
  }
  dimension: tv_spends_inr_cr {
    type: number
    sql: ${TABLE}.tv_spends_inr_cr ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  dimension_group: month {
    type: time
    timeframes: [month, year]
    sql: ${TABLE}.month_date ;;
  }
  measure: total_spend_tv_digital {
    type: sum
    sql: COALESCE(${tv_spends_inr_cr}, 0)
      + COALESCE(${digital_spends_inr_cr}, 0) ;;
    value_format_name: "decimal_2"
  }
  measure: total_impressions_tv_digital {
    type: sum
    sql: COALESCE(${tv_impressions}, 0)
      + COALESCE(${digital_impressions}, 0) ;;
    value_format_name: "decimal_2"
  }

  measure: count {
    type: count
  }
}
