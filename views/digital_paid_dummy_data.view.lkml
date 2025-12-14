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
  parameter: metric_selector {
    type: string
    default_value: "SPENDS"

    allowed_value: { label: "Spends"                value: "SPENDS" }
    allowed_value: { label: "Impressions"           value: "IMPRESSIONS" }
    allowed_value: { label: "Clicks"                value: "CLICKS" }
    allowed_value: { label: "CTR"                   value: "CTR" }
    allowed_value: { label: "Reach (DV360)"         value: "REACH_DV360" }
    allowed_value: { label: "Reach (Meta)"          value: "REACH_META" }
    allowed_value: { label: "Video Views"           value: "VIDEO_VIEWS" }
    allowed_value: { label: "Complete Video Views"  value: "COMPLETE_VIDEO_VIEWS" }
  }




  measure: selected_metric {
    type: number
    sql:
    CASE
      WHEN REPLACE({% parameter metric_selector %}, "\\'", "") = 'SPENDS'               THEN ${spends_m}
      WHEN REPLACE({% parameter metric_selector %}, "\\'", "") = 'IMPRESSIONS'          THEN ${impressions_m}
      WHEN REPLACE({% parameter metric_selector %}, "\\'", "") = 'CLICKS'               THEN ${clicks_m}
      WHEN REPLACE({% parameter metric_selector %}, "\\'", "") = 'CTR'                  THEN ${ctr}
      WHEN REPLACE({% parameter metric_selector %}, "\\'", "") = 'REACH_DV360'          THEN ${reach_dv360_m}
      WHEN REPLACE({% parameter metric_selector %}, "\\'", "") = 'REACH_META'           THEN ${reach_meta_m}
      WHEN REPLACE({% parameter metric_selector %}, "\\'", "") = 'VIDEO_VIEWS'          THEN ${video_views_m}
      WHEN REPLACE({% parameter metric_selector %}, "\\'", "") = 'COMPLETE_VIDEO_VIEWS' THEN ${complete_video_views_m}
      ELSE ${spends_m}
    END ;;
  }



  dimension: selected_metric_name {
    type: string
    sql:
    CASE
      WHEN {% parameter metric_selector %} = 'SPENDS'               THEN 'Spends'
      WHEN {% parameter metric_selector %} = 'IMPRESSIONS'          THEN 'Impressions'
      WHEN {% parameter metric_selector %} = 'CLICKS'               THEN 'Clicks'
      WHEN {% parameter metric_selector %} = 'CTR'                  THEN 'CTR'
      WHEN {% parameter metric_selector %} = 'REACH_DV360'          THEN 'Reach (DV360)'
      WHEN {% parameter metric_selector %} = 'REACH_META'           THEN 'Reach (Meta)'
      WHEN {% parameter metric_selector %} = 'VIDEO_VIEWS'          THEN 'Video Views'
      WHEN {% parameter metric_selector %} = 'COMPLETE_VIDEO_VIEWS' THEN 'Complete Video Views'
      ELSE 'Spends'
    END ;;
    hidden: yes
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
