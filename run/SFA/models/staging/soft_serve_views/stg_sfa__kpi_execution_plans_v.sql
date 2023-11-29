
    


    
    

    EXEC('create view "dbt"."stg_sfa__kpi_execution_plans_v__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."ps_KPIExecutionPlan_v"
),

renamed as (
    select
    
        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(KpiId as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as kpi_id,
        "KpiId" as kpi_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(OL_ID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as outlet_id,
        "OL_ID" as outlet_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(KpiId as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(OL_ID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as kpi_outlet_id,

        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        "Country_Code" as country_code,

        ----------  strings
        "PlanValue" as plan_value,

        ----------  numerics
        "Status" as status,

        ----------  booleans

        ----------  timestamps
        "DateFrom" as date_from,
        "DateTo" as date_to,
        "DLM" as dlm
    
        ----------  omited

--        "Valid_From",
--        "Valid_To"

    from source
)

select * from renamed;');


