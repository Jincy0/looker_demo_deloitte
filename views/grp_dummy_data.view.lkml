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
  parameter: grp_view_selector {
    type: string
    default_value: "Month"

    allowed_value: {
      label: "GRPs by Month"
      value: "Month"
    }

    allowed_value: {
      label: "GRPs by Brand"
      value: "Brand"
    }

    allowed_value: {
      label: "GRPs by Market"
      value: "Market"
    }

    allowed_value: {
      label: "GRPs by Channel"
      value: "Channel"
    }
  }
  dimension: grp_dynamic_dimension {
    label: "GRPs View"
    type: string

    sql:
    CASE
      WHEN {% parameter grp_view_selector %} = 'Month'
        THEN CAST(${date_month} AS STRING)

      WHEN {% parameter grp_view_selector %} = 'Brand'
      THEN ${brand}

      WHEN {% parameter grp_view_selector %} = 'Market'
      THEN ${market}

      WHEN {% parameter grp_view_selector %} = 'Channel'
      THEN ${channel}
      END ;;
  }
  dimension: grp_dynamic_sort {
    hidden: yes
    type: number

    sql:
    CASE
      WHEN {% parameter grp_view_selector %} = 'Month'
        THEN EXTRACT(YEAR FROM ${date_month}) * 100
           + EXTRACT(MONTH FROM ${date_month})
      ELSE NULL
    END ;;
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
  measure: total_grps {
    type: sum
    sql: ${grps} ;;
    value_format_name: decimal_0
  }

  measure: count {
    type: count
  }
}
