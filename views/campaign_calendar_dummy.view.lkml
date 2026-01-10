view: campaign_calendar_dummy {
  sql_table_name: `martech-assets.Dummy_looker_data.campaign_calendar_dummy` ;;

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

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }
  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }
  measure: count {
    type: count
    drill_fields: [campaign_name]
  }
}
