
      
  merge into "L50_SB_Vitek"."snapshots"."sfa__customers_snapshot" as DBT_INTERNAL_DEST
    using "L50_SB_Vitek"."snapshots"."#sfa__customers_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
    on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id

    when matched
     and DBT_INTERNAL_DEST.dbt_valid_to is null
     and DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete')
        then update
        set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to

    when not matched
     and DBT_INTERNAL_SOURCE.dbt_change_type = 'insert'
        then insert ("Country_Code", "Cust_Id", "Cust_NAME", "Cust_TradingName", "ZKPO", "MFO", "Bank_Account", "TAX_Number", "VAT_Number", "Cust_Address", "Cust_TradingAddress", "Bank_Name", "DIRECTOR", "City_Id", "Email", "Phone", "TradingPhone", "Comments", "Distr_id", "Passwd", "DLM", "Status", "PayFormMinValue", "PayFormCurrentValue", "PayFormMaxValue", "DiscountMinValue", "DiscountCurrentValue", "DiscountMaxValue", "LastSyncDateTime", "RenewSupervisorPasswd", "RenewAdminPasswd", "ULM", "DesktopOutletMinValue", "DesktopOutletCurrentValue", "DesktopOutletMaxValue", "DesktopOrderMinValue", "DesktopOrderCurrentValue", "DesktopOrderMaxValue", "MerchMinValue", "MerchMaxValue", "DesktopRouteMinValue", "DesktopRouteCurrentValue", "DesktopRouteMaxValue", "DesktopVisitMinValue", "DesktopVisitCurrentValue", "DesktopVisitMaxValue", "CheckSchedule", "Area_ID", "IEConfiguration", "SalesOrgCode", "IsBlocked", "SyncInProgress", "OL_id", "GeographyID", "Is2LevelMode", "WarehouseBaseID", "ExternalCode", "DB_ID", "IsInExchangeEquipment", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
        values ("Country_Code", "Cust_Id", "Cust_NAME", "Cust_TradingName", "ZKPO", "MFO", "Bank_Account", "TAX_Number", "VAT_Number", "Cust_Address", "Cust_TradingAddress", "Bank_Name", "DIRECTOR", "City_Id", "Email", "Phone", "TradingPhone", "Comments", "Distr_id", "Passwd", "DLM", "Status", "PayFormMinValue", "PayFormCurrentValue", "PayFormMaxValue", "DiscountMinValue", "DiscountCurrentValue", "DiscountMaxValue", "LastSyncDateTime", "RenewSupervisorPasswd", "RenewAdminPasswd", "ULM", "DesktopOutletMinValue", "DesktopOutletCurrentValue", "DesktopOutletMaxValue", "DesktopOrderMinValue", "DesktopOrderCurrentValue", "DesktopOrderMaxValue", "MerchMinValue", "MerchMaxValue", "DesktopRouteMinValue", "DesktopRouteCurrentValue", "DesktopRouteMaxValue", "DesktopVisitMinValue", "DesktopVisitCurrentValue", "DesktopVisitMaxValue", "CheckSchedule", "Area_ID", "IEConfiguration", "SalesOrgCode", "IsBlocked", "SyncInProgress", "OL_id", "GeographyID", "Is2LevelMode", "WarehouseBaseID", "ExternalCode", "DB_ID", "IsInExchangeEquipment", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")

;

  