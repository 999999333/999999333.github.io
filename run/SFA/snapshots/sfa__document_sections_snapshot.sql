
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__document_sections_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__document_sections_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__document_sections_snapshot" ("Country_Code", "Section_ID", "ParentSection_ID", "Document_ID", "Name", "SortOrder", "GroupingType", "BO_ID", "ULM", "DLM", "Status", "Level", "ExternalCode", "RandomQuestionsNumber", "HReport_ID", "IsCallButton", "EnableCopy", "IsPhotoReport", "ShootingAngle", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."Section_ID", DBT_INTERNAL_SOURCE."ParentSection_ID", DBT_INTERNAL_SOURCE."Document_ID", DBT_INTERNAL_SOURCE."Name", DBT_INTERNAL_SOURCE."SortOrder", DBT_INTERNAL_SOURCE."GroupingType", DBT_INTERNAL_SOURCE."BO_ID", DBT_INTERNAL_SOURCE."ULM", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."Level", DBT_INTERNAL_SOURCE."ExternalCode", DBT_INTERNAL_SOURCE."RandomQuestionsNumber", DBT_INTERNAL_SOURCE."HReport_ID", DBT_INTERNAL_SOURCE."IsCallButton", DBT_INTERNAL_SOURCE."EnableCopy", DBT_INTERNAL_SOURCE."IsPhotoReport", DBT_INTERNAL_SOURCE."ShootingAngle", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__document_sections_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  