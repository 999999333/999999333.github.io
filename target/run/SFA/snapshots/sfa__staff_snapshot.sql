
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__staff_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__staff_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__staff_snapshot" ("Country_Code", "Staff_id", "Staff_Code", "GeographyID", "Name", "LName", "FName", "SName", "BirthDate", "Location", "Dept", "Position", "Comment", "EMail", "StaffType_id", "Status", "DLM", "ULM", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."Staff_id", DBT_INTERNAL_SOURCE."Staff_Code", DBT_INTERNAL_SOURCE."GeographyID", DBT_INTERNAL_SOURCE."Name", DBT_INTERNAL_SOURCE."LName", DBT_INTERNAL_SOURCE."FName", DBT_INTERNAL_SOURCE."SName", DBT_INTERNAL_SOURCE."BirthDate", DBT_INTERNAL_SOURCE."Location", DBT_INTERNAL_SOURCE."Dept", DBT_INTERNAL_SOURCE."Position", DBT_INTERNAL_SOURCE."Comment", DBT_INTERNAL_SOURCE."EMail", DBT_INTERNAL_SOURCE."StaffType_id", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."ULM", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__staff_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  