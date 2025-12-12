connection: "demo_dashboard_replica_domo"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: martech_assets_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: martech_assets_default_datagroup

explore: dummy_table_executivesummary {}

