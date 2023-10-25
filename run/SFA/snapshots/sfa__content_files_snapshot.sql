
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__content_files_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__content_files_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__content_files_snapshot" ("Country_Code", "ContentFileID", "ContentID", "ContentFileName", "ContentFileUniqueName", "Hash", "Status", "DLM", "ULM", "Comment", "PhotoTypeId", "Size", "Activity_ID", "CreationDate", "IsEdited", "ReceivingResultDate", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."ContentFileID", DBT_INTERNAL_SOURCE."ContentID", DBT_INTERNAL_SOURCE."ContentFileName", DBT_INTERNAL_SOURCE."ContentFileUniqueName", DBT_INTERNAL_SOURCE."Hash", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."ULM", DBT_INTERNAL_SOURCE."Comment", DBT_INTERNAL_SOURCE."PhotoTypeId", DBT_INTERNAL_SOURCE."Size", DBT_INTERNAL_SOURCE."Activity_ID", DBT_INTERNAL_SOURCE."CreationDate", DBT_INTERNAL_SOURCE."IsEdited", DBT_INTERNAL_SOURCE."ReceivingResultDate", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__content_files_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  