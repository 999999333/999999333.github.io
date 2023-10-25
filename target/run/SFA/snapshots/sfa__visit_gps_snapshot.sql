
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__visit_gps_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__visit_gps_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__visit_gps_snapshot" ("Country_Code", "OLCard_id", "Latitude", "Longitude", "DLM", "FinishLatitude", "FinishLongitude", "isFake", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."OLCard_id", DBT_INTERNAL_SOURCE."Latitude", DBT_INTERNAL_SOURCE."Longitude", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."FinishLatitude", DBT_INTERNAL_SOURCE."FinishLongitude", DBT_INTERNAL_SOURCE."isFake", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__visit_gps_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  