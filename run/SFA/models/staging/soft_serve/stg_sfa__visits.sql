
    


    
    

    EXEC('create view "dbt"."stg_sfa__visits__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."snapshots"."sfa__visits_snapshot"
),

renamed as (
    select

        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(OlCard_id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as visit_id,
        "OlCard_id" as visit_key,
      
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Ol_id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as outlet_id,
        "Ol_id" as outlet_key,
        
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Merch_id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as merchant_id,
        "Merch_id" as merchant_key,

        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        "Reason_ID" as inaccessibility_reason_id,
        "Route_id" as route_id,
        "OrgStructureID" as organizational_structure_id,
        "Cust_id" as customer_id,

        ----------  strings
        "Comments" as visit_comment,
        "CompletionReasonTS",
        "T1CommentTS",

        ----------  numerics
        "OlCardYear" as visit_year,
        "OlCardMonth" as visit_month,
        "OlCardWeek" as visit_week,
        "DistributionCaptureMode",
        "CommentsDestination",
        "VisitTimeSec",
        "DistanceToOutlet" as visit_start_distance,
        "DistanceToOutlet_End" as visit_end_distance,
        "FacingCaptureMode",
        "UserStepCount",
        "Status",

        ----------  booleans
        "Inaccessible",
        "IsFromDDB",
        "HasStartImage",
        "HasEndImage",
        "Incomplete",
        "DocumentIsFilled",
        "SyncWithDBF",
        "SyncMainWithDBF",
        "QuickOrder" as is_quick_order,

        ----------  timestamps
        "OlCardDate" as visit_date,
        "BeginTime" as visit_start_time,
        "EndTime" as visit_end_time,
        "EndTimeChange" as visit_end_time_edit,
        "DLM" as dlm,
        dbt_valid_from as valid_from,
        dbt_valid_to as valid_to

        
        ----------  omited
        -- "OLCardType",
        -- "DelegatedOrgStructureID",

    from source
)

select * from renamed;');


