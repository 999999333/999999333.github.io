
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__networks_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__networks_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__networks_snapshot" ("Country_Code", "Network_id", "Network_Name", "Notes", "DLM", "Status", "ULM", "AppliesToAllCities", "NetworkType_ID", "NetworkCode", "JuridicalName", "JuridicalAddress", "GrdCode", "NetworkLevel", "OrgStructureID", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."Network_id", DBT_INTERNAL_SOURCE."Network_Name", DBT_INTERNAL_SOURCE."Notes", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."ULM", DBT_INTERNAL_SOURCE."AppliesToAllCities", DBT_INTERNAL_SOURCE."NetworkType_ID", DBT_INTERNAL_SOURCE."NetworkCode", DBT_INTERNAL_SOURCE."JuridicalName", DBT_INTERNAL_SOURCE."JuridicalAddress", DBT_INTERNAL_SOURCE."GrdCode", DBT_INTERNAL_SOURCE."NetworkLevel", DBT_INTERNAL_SOURCE."OrgStructureID", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__networks_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  