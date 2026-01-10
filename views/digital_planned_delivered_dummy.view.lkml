view: digital_planned_delivered_dummy {
  sql_table_name: `martech-assets.Dummy_looker_data.digital_planned_delivered_dummy` ;;

  dimension: brand {
    hidden: yes
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: planned_delivered_pk {
    primary_key: yes
    hidden: yes
    type: string
    sql:
    CONCAT(
      ${TABLE}.brand, '-',
      ${TABLE}.market, '-',
      CAST(${TABLE}.month_year AS STRING)
    ) ;;
  }
  dimension: brand_display {
    label: "Brand"
    type: string
    sql:
    CASE ${TABLE}.brand
      WHEN 'CHARGED' THEN 'Brand 1'
      WHEN 'COCA COLA' THEN 'Brand 2'
      WHEN 'COCA COLA ZERO' THEN 'Brand 3'
      WHEN 'FANTA' THEN 'Brand 4'
      WHEN 'LIMCA' THEN 'Brand 5'
      WHEN 'MAAZA' THEN 'Brand 6'
      WHEN 'SPRITE' THEN 'Brand 7'
      WHEN 'THUMS UP' THEN 'Brand 8'
      ELSE 'Other'
    END ;;
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
