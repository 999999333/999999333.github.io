
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__visits__dbt_tmp" as
        with source as (
    select * from "L50_SB_Vitek"."snapshots"."sfa__visits_snapshot"
),

renamed as (
    select

        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(OlCard_id as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as visit_id,
        "OlCard_id" as visit_key,
      
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Ol_id as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as outlet_id,
        "Ol_id" as outlet_key,
        
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Merch_id as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
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
         "Country_Code" as country_code,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Reason_ID as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as inaccessibility_reason_id,
        "Reason_ID" as inaccessibility_reason_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Route_id as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as route_id,
        "Route_id" as route_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(OrgStructureID as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as organizational_structure_id,
        "OrgStructureID" as organizational_structure_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Cust_id as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as customer_id,
        "Cust_id" as customer_key,

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
        cast("OlCardDate" as date) as visit_date,
        cast("BeginTime" as time(2)) as visit_start_time,
        cast("EndTime" as time(2)) as visit_end_time,
        "VisitTimeSec" as visit_duration_sec,
        "EndTimeChange" as visit_end_time_edit,
        "DLM" as dlm,
        dbt_valid_from as dbt_valid_from,
        coalesce("dbt_valid_to", cast(''2299-12-31'' as datetime)) as dbt_valid_to

        
        ----------  omited
        -- "OLCardType",
        -- "DelegatedOrgStructureID",

    from source
)

select * from renamed
    ');

