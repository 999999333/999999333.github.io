
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__warehouses_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__warehouses_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__warehouses_snapshot" ("Country_Code", "W_id", "W_ExternalCode", "WType_id", "Cust_id", "W_LongName", "W_ShortName", "StockAccounting", "StockManagement", "StockOrder", "DeliveryDelay", "LotAccounting", "Status", "ULM", "DLM", "StockNegative", "Priority", "Address", "StartingStockDate", "CountHolidaysForDelivery", "Email", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."W_id", DBT_INTERNAL_SOURCE."W_ExternalCode", DBT_INTERNAL_SOURCE."WType_id", DBT_INTERNAL_SOURCE."Cust_id", DBT_INTERNAL_SOURCE."W_LongName", DBT_INTERNAL_SOURCE."W_ShortName", DBT_INTERNAL_SOURCE."StockAccounting", DBT_INTERNAL_SOURCE."StockManagement", DBT_INTERNAL_SOURCE."StockOrder", DBT_INTERNAL_SOURCE."DeliveryDelay", DBT_INTERNAL_SOURCE."LotAccounting", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."ULM", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."StockNegative", DBT_INTERNAL_SOURCE."Priority", DBT_INTERNAL_SOURCE."Address", DBT_INTERNAL_SOURCE."StartingStockDate", DBT_INTERNAL_SOURCE."CountHolidaysForDelivery", DBT_INTERNAL_SOURCE."Email", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__warehouses_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  