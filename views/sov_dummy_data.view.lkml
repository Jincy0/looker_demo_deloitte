view: sov_dummy_data {
  sql_table_name: `martech-assets.Dummy_looker_data.sov_dummy_data` ;;

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
  dimension: sov {
    type: number
    sql: ${TABLE}.SOV ;;
  }
  dimension: market {
    type: string
    sql: ${TABLE}.Market ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }
  parameter: sov_view_selector {
    type: string
    default_value: "Month"

    allowed_value: {
      label: "SOV by Month"
      value: "Month"
    }

    allowed_value: {
      label: "SOV by Category"
      value: "Category"
    }

    allowed_value: {
      label: "SOV by Brand"
      value: "Brand"
    }

    allowed_value: {
      label: "SOV by Advertiser"
      value: "Advertiser"
    }
  }
  dimension: sov_dynamic_dimension {
    label: "SOV View"
    type: string

    sql:
    CASE
      WHEN {% parameter sov_view_selector %} = 'Month'
        THEN CAST(${date_month} AS STRING)

      WHEN {% parameter sov_view_selector %} = 'Category'
      THEN ${category}

      WHEN {% parameter sov_view_selector %} = 'Brand'
      THEN ${brand}

      WHEN {% parameter sov_view_selector %} = 'Advertiser'
      THEN ${advertiser}
      END ;;
  }
  dimension: sov_dynamic_sort {
    hidden: yes
    type: number

    sql:
    CASE
      WHEN {% parameter sov_view_selector %} = 'Month'
        THEN EXTRACT(YEAR FROM ${date_month}) * 100
           + EXTRACT(MONTH FROM ${date_month})
      ELSE NULL
    END ;;
  }
  measure: sov_percent {
    label: "SOV %"
    type: max
    sql: ${sov} ;;
    value_format: "0.0"
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
