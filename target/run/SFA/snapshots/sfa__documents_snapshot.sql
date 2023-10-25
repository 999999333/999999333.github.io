
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__documents_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__documents_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__documents_snapshot" ("Country_Code", "Document_ID", "Name", "Details", "ULM", "DLM", "Status", "UseContentCDB", "UseContentMDB", "ExternalCode", "PassScore", "HighlightColor", "StandartDocumentItemId", "DocumentClassificationId", "DisplayLastResponseDate", "DocumentLinkStandartDocumentItemId", "PromoActivities_ID", "ClearPreFilledResponses", "ActivityId", "ResetPreFieldResponses", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."Document_ID", DBT_INTERNAL_SOURCE."Name", DBT_INTERNAL_SOURCE."Details", DBT_INTERNAL_SOURCE."ULM", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."UseContentCDB", DBT_INTERNAL_SOURCE."UseContentMDB", DBT_INTERNAL_SOURCE."ExternalCode", DBT_INTERNAL_SOURCE."PassScore", DBT_INTERNAL_SOURCE."HighlightColor", DBT_INTERNAL_SOURCE."StandartDocumentItemId", DBT_INTERNAL_SOURCE."DocumentClassificationId", DBT_INTERNAL_SOURCE."DisplayLastResponseDate", DBT_INTERNAL_SOURCE."DocumentLinkStandartDocumentItemId", DBT_INTERNAL_SOURCE."PromoActivities_ID", DBT_INTERNAL_SOURCE."ClearPreFilledResponses", DBT_INTERNAL_SOURCE."ActivityId", DBT_INTERNAL_SOURCE."ResetPreFieldResponses", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__documents_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  