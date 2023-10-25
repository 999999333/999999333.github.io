
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__product_stocks_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__product_stocks_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__product_stocks_snapshot" ("Country_Code", "W_id", "Product_id", "Stock", "Required", "DLM", "StockEditAdd", "StockEditTotal", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."W_id", DBT_INTERNAL_SOURCE."Product_id", DBT_INTERNAL_SOURCE."Stock", DBT_INTERNAL_SOURCE."Required", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."StockEditAdd", DBT_INTERNAL_SOURCE."StockEditTotal", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__product_stocks_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  