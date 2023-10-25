
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__visits_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__visits_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__visits_snapshot" ("Country_Code", "Ol_id", "Merch_id", "OlCard_id", "OlCardDate", "BeginTime", "EndTime", "Inaccessible", "Reason_ID", "Comments", "OlCardYear", "OlCardMonth", "OlCardWeek", "DistributionCaptureMode", "CommentsDestination", "Route_id", "VisitTimeSec", "FacingCaptureMode", "SyncWithDBF", "OrgStructureID", "Cust_id", "OLCardType", "SyncMainWithDBF", "QuickOrder", "DelegatedOrgStructureID", "EndTimeChange", "Status", "DLM", "IsFromDDB", "HasStartImage", "HasEndImage", "DistanceToOutlet", "CompletionReasonTS", "T1CommentTS", "Incomplete", "DistanceToOutlet_End", "DocumentIsFilled", "UserStepCount", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."Ol_id", DBT_INTERNAL_SOURCE."Merch_id", DBT_INTERNAL_SOURCE."OlCard_id", DBT_INTERNAL_SOURCE."OlCardDate", DBT_INTERNAL_SOURCE."BeginTime", DBT_INTERNAL_SOURCE."EndTime", DBT_INTERNAL_SOURCE."Inaccessible", DBT_INTERNAL_SOURCE."Reason_ID", DBT_INTERNAL_SOURCE."Comments", DBT_INTERNAL_SOURCE."OlCardYear", DBT_INTERNAL_SOURCE."OlCardMonth", DBT_INTERNAL_SOURCE."OlCardWeek", DBT_INTERNAL_SOURCE."DistributionCaptureMode", DBT_INTERNAL_SOURCE."CommentsDestination", DBT_INTERNAL_SOURCE."Route_id", DBT_INTERNAL_SOURCE."VisitTimeSec", DBT_INTERNAL_SOURCE."FacingCaptureMode", DBT_INTERNAL_SOURCE."SyncWithDBF", DBT_INTERNAL_SOURCE."OrgStructureID", DBT_INTERNAL_SOURCE."Cust_id", DBT_INTERNAL_SOURCE."OLCardType", DBT_INTERNAL_SOURCE."SyncMainWithDBF", DBT_INTERNAL_SOURCE."QuickOrder", DBT_INTERNAL_SOURCE."DelegatedOrgStructureID", DBT_INTERNAL_SOURCE."EndTimeChange", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."IsFromDDB", DBT_INTERNAL_SOURCE."HasStartImage", DBT_INTERNAL_SOURCE."HasEndImage", DBT_INTERNAL_SOURCE."DistanceToOutlet", DBT_INTERNAL_SOURCE."CompletionReasonTS", DBT_INTERNAL_SOURCE."T1CommentTS", DBT_INTERNAL_SOURCE."Incomplete", DBT_INTERNAL_SOURCE."DistanceToOutlet_End", DBT_INTERNAL_SOURCE."DocumentIsFilled", DBT_INTERNAL_SOURCE."UserStepCount", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__visits_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  