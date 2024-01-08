
      
  merge into "L50_SB_Vitek"."snapshots"."sfa__visits_snapshot" as DBT_INTERNAL_DEST
    using "L50_SB_Vitek"."snapshots"."#sfa__visits_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
    on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id

    when matched
     and DBT_INTERNAL_DEST.dbt_valid_to is null
     and DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete')
        then update
        set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to

    when not matched
     and DBT_INTERNAL_SOURCE.dbt_change_type = 'insert'
        then insert ("Country_Code", "Ol_id", "Merch_id", "OlCard_id", "OlCardDate", "BeginTime", "EndTime", "Inaccessible", "Reason_ID", "Comments", "OlCardYear", "OlCardMonth", "OlCardWeek", "DistributionCaptureMode", "CommentsDestination", "Route_id", "VisitTimeSec", "FacingCaptureMode", "SyncWithDBF", "OrgStructureID", "Cust_id", "OLCardType", "SyncMainWithDBF", "QuickOrder", "DelegatedOrgStructureID", "EndTimeChange", "Status", "DLM", "IsFromDDB", "HasStartImage", "HasEndImage", "DistanceToOutlet", "CompletionReasonTS", "T1CommentTS", "Incomplete", "DistanceToOutlet_End", "DocumentIsFilled", "UserStepCount", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
        values ("Country_Code", "Ol_id", "Merch_id", "OlCard_id", "OlCardDate", "BeginTime", "EndTime", "Inaccessible", "Reason_ID", "Comments", "OlCardYear", "OlCardMonth", "OlCardWeek", "DistributionCaptureMode", "CommentsDestination", "Route_id", "VisitTimeSec", "FacingCaptureMode", "SyncWithDBF", "OrgStructureID", "Cust_id", "OLCardType", "SyncMainWithDBF", "QuickOrder", "DelegatedOrgStructureID", "EndTimeChange", "Status", "DLM", "IsFromDDB", "HasStartImage", "HasEndImage", "DistanceToOutlet", "CompletionReasonTS", "T1CommentTS", "Incomplete", "DistanceToOutlet_End", "DocumentIsFilled", "UserStepCount", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")

;

  