
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__document_items_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__document_items_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__document_items_snapshot" ("Country_Code", "Item_ID", "Section_ID", "DisplayValue", "ValueType", "ControlType", "TotalType", "SortOrder", "ULM", "DLM", "Status", "UseContentCDB", "UseContentMDB", "ResponseFormat", "HasRestrictionRules", "HasValidationRules", "HasMobileContentRules", "TargetValue", "QuestionWeight", "ExternalCode", "HighlightInColor", "UseResponseFromPreviousQuestionnaire", "StandartDocumentItemId", "Hint", "IsReadOnly", "BO_ID", "IsProhibitEditingPreviousAnswer", "UsePreviousVisitContent", "Distribution", "MDBContentCountLimit", "BarCodeScanning", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."Item_ID", DBT_INTERNAL_SOURCE."Section_ID", DBT_INTERNAL_SOURCE."DisplayValue", DBT_INTERNAL_SOURCE."ValueType", DBT_INTERNAL_SOURCE."ControlType", DBT_INTERNAL_SOURCE."TotalType", DBT_INTERNAL_SOURCE."SortOrder", DBT_INTERNAL_SOURCE."ULM", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."UseContentCDB", DBT_INTERNAL_SOURCE."UseContentMDB", DBT_INTERNAL_SOURCE."ResponseFormat", DBT_INTERNAL_SOURCE."HasRestrictionRules", DBT_INTERNAL_SOURCE."HasValidationRules", DBT_INTERNAL_SOURCE."HasMobileContentRules", DBT_INTERNAL_SOURCE."TargetValue", DBT_INTERNAL_SOURCE."QuestionWeight", DBT_INTERNAL_SOURCE."ExternalCode", DBT_INTERNAL_SOURCE."HighlightInColor", DBT_INTERNAL_SOURCE."UseResponseFromPreviousQuestionnaire", DBT_INTERNAL_SOURCE."StandartDocumentItemId", DBT_INTERNAL_SOURCE."Hint", DBT_INTERNAL_SOURCE."IsReadOnly", DBT_INTERNAL_SOURCE."BO_ID", DBT_INTERNAL_SOURCE."IsProhibitEditingPreviousAnswer", DBT_INTERNAL_SOURCE."UsePreviousVisitContent", DBT_INTERNAL_SOURCE."Distribution", DBT_INTERNAL_SOURCE."MDBContentCountLimit", DBT_INTERNAL_SOURCE."BarCodeScanning", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__document_items_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  