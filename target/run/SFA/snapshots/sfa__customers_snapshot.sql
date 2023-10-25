
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__customers_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__customers_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__customers_snapshot" ("Country_Code", "Cust_Id", "Cust_NAME", "Cust_TradingName", "ZKPO", "MFO", "Bank_Account", "TAX_Number", "VAT_Number", "Cust_Address", "Cust_TradingAddress", "Bank_Name", "DIRECTOR", "City_Id", "Email", "Phone", "TradingPhone", "Comments", "Distr_id", "Passwd", "DLM", "Status", "PayFormMinValue", "PayFormCurrentValue", "PayFormMaxValue", "DiscountMinValue", "DiscountCurrentValue", "DiscountMaxValue", "LastSyncDateTime", "RenewSupervisorPasswd", "RenewAdminPasswd", "ULM", "DesktopOutletMinValue", "DesktopOutletCurrentValue", "DesktopOutletMaxValue", "DesktopOrderMinValue", "DesktopOrderCurrentValue", "DesktopOrderMaxValue", "MerchMinValue", "MerchMaxValue", "DesktopRouteMinValue", "DesktopRouteCurrentValue", "DesktopRouteMaxValue", "DesktopVisitMinValue", "DesktopVisitCurrentValue", "DesktopVisitMaxValue", "CheckSchedule", "Area_ID", "IEConfiguration", "SalesOrgCode", "IsBlocked", "SyncInProgress", "OL_id", "GeographyID", "Is2LevelMode", "WarehouseBaseID", "ExternalCode", "DB_ID", "IsInExchangeEquipment", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."Cust_Id", DBT_INTERNAL_SOURCE."Cust_NAME", DBT_INTERNAL_SOURCE."Cust_TradingName", DBT_INTERNAL_SOURCE."ZKPO", DBT_INTERNAL_SOURCE."MFO", DBT_INTERNAL_SOURCE."Bank_Account", DBT_INTERNAL_SOURCE."TAX_Number", DBT_INTERNAL_SOURCE."VAT_Number", DBT_INTERNAL_SOURCE."Cust_Address", DBT_INTERNAL_SOURCE."Cust_TradingAddress", DBT_INTERNAL_SOURCE."Bank_Name", DBT_INTERNAL_SOURCE."DIRECTOR", DBT_INTERNAL_SOURCE."City_Id", DBT_INTERNAL_SOURCE."Email", DBT_INTERNAL_SOURCE."Phone", DBT_INTERNAL_SOURCE."TradingPhone", DBT_INTERNAL_SOURCE."Comments", DBT_INTERNAL_SOURCE."Distr_id", DBT_INTERNAL_SOURCE."Passwd", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."PayFormMinValue", DBT_INTERNAL_SOURCE."PayFormCurrentValue", DBT_INTERNAL_SOURCE."PayFormMaxValue", DBT_INTERNAL_SOURCE."DiscountMinValue", DBT_INTERNAL_SOURCE."DiscountCurrentValue", DBT_INTERNAL_SOURCE."DiscountMaxValue", DBT_INTERNAL_SOURCE."LastSyncDateTime", DBT_INTERNAL_SOURCE."RenewSupervisorPasswd", DBT_INTERNAL_SOURCE."RenewAdminPasswd", DBT_INTERNAL_SOURCE."ULM", DBT_INTERNAL_SOURCE."DesktopOutletMinValue", DBT_INTERNAL_SOURCE."DesktopOutletCurrentValue", DBT_INTERNAL_SOURCE."DesktopOutletMaxValue", DBT_INTERNAL_SOURCE."DesktopOrderMinValue", DBT_INTERNAL_SOURCE."DesktopOrderCurrentValue", DBT_INTERNAL_SOURCE."DesktopOrderMaxValue", DBT_INTERNAL_SOURCE."MerchMinValue", DBT_INTERNAL_SOURCE."MerchMaxValue", DBT_INTERNAL_SOURCE."DesktopRouteMinValue", DBT_INTERNAL_SOURCE."DesktopRouteCurrentValue", DBT_INTERNAL_SOURCE."DesktopRouteMaxValue", DBT_INTERNAL_SOURCE."DesktopVisitMinValue", DBT_INTERNAL_SOURCE."DesktopVisitCurrentValue", DBT_INTERNAL_SOURCE."DesktopVisitMaxValue", DBT_INTERNAL_SOURCE."CheckSchedule", DBT_INTERNAL_SOURCE."Area_ID", DBT_INTERNAL_SOURCE."IEConfiguration", DBT_INTERNAL_SOURCE."SalesOrgCode", DBT_INTERNAL_SOURCE."IsBlocked", DBT_INTERNAL_SOURCE."SyncInProgress", DBT_INTERNAL_SOURCE."OL_id", DBT_INTERNAL_SOURCE."GeographyID", DBT_INTERNAL_SOURCE."Is2LevelMode", DBT_INTERNAL_SOURCE."WarehouseBaseID", DBT_INTERNAL_SOURCE."ExternalCode", DBT_INTERNAL_SOURCE."DB_ID", DBT_INTERNAL_SOURCE."IsInExchangeEquipment", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__customers_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  