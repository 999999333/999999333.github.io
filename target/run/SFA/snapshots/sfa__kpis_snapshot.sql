
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__kpis_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__kpis_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__kpis_snapshot" ("Country_Code", "KpiId", "ParentId", "ActivityType", "Name", "Comment", "ExternalCode", "Type", "Level", "Status", "DLM", "ULM", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."KpiId", DBT_INTERNAL_SOURCE."ParentId", DBT_INTERNAL_SOURCE."ActivityType", DBT_INTERNAL_SOURCE."Name", DBT_INTERNAL_SOURCE."Comment", DBT_INTERNAL_SOURCE."ExternalCode", DBT_INTERNAL_SOURCE."Type", DBT_INTERNAL_SOURCE."Level", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."ULM", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__kpis_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  