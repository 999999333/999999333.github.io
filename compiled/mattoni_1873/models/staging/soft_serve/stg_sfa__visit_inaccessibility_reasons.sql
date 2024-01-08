with source as (
    select * from "L50_SB_Vitek"."snapshots"."sfa__visit_inaccessibility_reasons_snapshot"
),

renamed as (
    select
        ----------  ids
        "dbt_scd_id" as dbt_scd_id,

        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Reason_id as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as inaccessibility_reason_id,       
        "Reason_id" as inaccessibility_reason_key,

        "ExternalCode" as inaccessibility_reason_external_code,
            
        
case
  when Country_Code = 'CZ' then 422
  when Country_Code = 'SK' then 423
  when Country_Code = 'HU' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings
        "Reason" as inaccessibility_reason,
        "Country_Code" as country_code,

        ----------  numerics
        "Status" as status,
        "ULM" as ulm,

        ----------  booleans

        ----------  timestamps
        "DLM" as dlm,
        "dbt_valid_from" as dbt_valid_from,
        coalesce("dbt_valid_to", cast('2299-12-31' as datetime2)) as dbt_valid_to

        ----------  omited
        --"IsLegal",



    from source
)

select * from renamed