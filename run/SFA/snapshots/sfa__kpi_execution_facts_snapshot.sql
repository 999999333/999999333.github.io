
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__kpi_execution_facts_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__kpi_execution_facts_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__kpi_execution_facts_snapshot" ("Country_Code", "KpiId", "VersionId", "OlCard_id", "Date", "OL_ID", "OrgStructureID", "Fact", "DLM", "Status", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."KpiId", DBT_INTERNAL_SOURCE."VersionId", DBT_INTERNAL_SOURCE."OlCard_id", DBT_INTERNAL_SOURCE."Date", DBT_INTERNAL_SOURCE."OL_ID", DBT_INTERNAL_SOURCE."OrgStructureID", DBT_INTERNAL_SOURCE."Fact", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__kpi_execution_facts_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  