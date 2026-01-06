connection: "demo_dashboard_replica_domo"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: martech_assets_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: martech_assets_default_datagroup

explore: dummy_table_executivesummary {}
explore: digital_paid_dummy_data {}
explore: spot_distribution_dummy_dataset {}
explore: volume_and_media_spends_dummydata {}
explore: grp_dummy_data{
    join: sov_dummy_data {
      type: left_outer
      sql_on:
      ${grp_dummy_data.date_month} = ${sov_dummy_data.date_month}
      AND ${grp_dummy_data.brand} = ${sov_dummy_data.brand} ;;
      relationship: many_to_one
    }

}
explore: sov_dummy_data {}
explore: tv_reach_comparison_dummy {}
explore: tv_planned_delivered_dummy {}
explore: digital_planned_delivered_dummy {}
explore: campaign_calendar_dummy {
  label: "Planned vs Delivered"

  join: digital_planned_delivered_dummy {
    type: left_outer
    relationship: many_to_one
    sql_on:
      ${campaign_calendar_dummy.brand} = ${digital_planned_delivered_dummy.brand}
      AND ${campaign_calendar_dummy.market} = ${digital_planned_delivered_dummy.market}
      AND ${campaign_calendar_dummy.start_month} =
          ${digital_planned_delivered_dummy.month_year_month} ;;
  }

  join: tv_planned_delivered_dummy {
    type: left_outer
    relationship: many_to_one
    sql_on:
      ${campaign_calendar_dummy.brand} = ${tv_planned_delivered_dummy.brand}
      AND ${campaign_calendar_dummy.market} = ${tv_planned_delivered_dummy.market}
      AND ${campaign_calendar_dummy.start_month} =
          ${tv_planned_delivered_dummy.month_year_month} ;;
  }
}
