
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_OutLetCardH_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OutLetCardH_v"
),
renamed as (
    select
        "Country_Code",
        "Ol_id",
        "Merch_id",
        "OlCard_id",
        "OlCardDate",
        "BeginTime",
        "EndTime",
        "Inaccessible",
        "Reason_ID",
        "Comments",
        "OlCardYear",
        "OlCardMonth",
        "OlCardWeek",
        "DistributionCaptureMode",
        "CommentsDestination",
        "Route_id",
        "VisitTimeSec",
        "FacingCaptureMode",
        "SyncWithDBF",
        "OrgStructureID",
        "Cust_id",
        "OLCardType",
        "SyncMainWithDBF",
        "QuickOrder",
        "DelegatedOrgStructureID",
        "EndTimeChange",
        "Status",
        "DLM",
        "IsFromDDB",
        "HasStartImage",
        "HasEndImage",
        "DistanceToOutlet",
        "CompletionReasonTS",
        "T1CommentTS",
        "Incomplete",
        "DistanceToOutlet_End",
        "DocumentIsFilled",
        "UserStepCount"

    from source
)
select * from renamed;');


