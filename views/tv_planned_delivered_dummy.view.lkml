view: tv_planned_delivered_dummy {
  sql_table_name: `martech-assets.Dummy_looker_data.tv_planned_delivered_dummy` ;;

  dimension: brand {
    hidden: yes
    type: string
    sql: ${TABLE}.brand ;;
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
