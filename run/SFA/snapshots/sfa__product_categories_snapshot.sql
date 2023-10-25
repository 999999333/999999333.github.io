
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__product_categories_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__product_categories_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__product_categories_snapshot" ("Country_Code", "ProdCategory_ID", "ProdCategoryName", "ProdCategoryShortName", "SortOrder", "DLM", "Status", "ULM", "IsConcurrent", "ProdCategoryCode", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."ProdCategory_ID", DBT_INTERNAL_SOURCE."ProdCategoryName", DBT_INTERNAL_SOURCE."ProdCategoryShortName", DBT_INTERNAL_SOURCE."SortOrder", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."ULM", DBT_INTERNAL_SOURCE."IsConcurrent", DBT_INTERNAL_SOURCE."ProdCategoryCode", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__product_categories_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  