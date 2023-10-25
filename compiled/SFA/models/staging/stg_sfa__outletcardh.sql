with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OutLetCardH"
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
        "UserStepCount",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed