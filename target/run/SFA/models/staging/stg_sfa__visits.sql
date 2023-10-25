
    


    
    

    EXEC('create view "dbt"."stg_sfa__visits__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."dbo_OutLetCardH"
),

renamed as (
    select
        "OlCard_id" as visit_id,
        "Ol_id" as outlet_id,
        "Country_Code",
        "Merch_id" as merchant_id,
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

select * from renamed;');


