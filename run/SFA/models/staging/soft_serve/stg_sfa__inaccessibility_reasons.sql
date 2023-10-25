
    


    
    

    EXEC('create view "dbt"."stg_sfa__inaccessibility_reasons__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."dbo_InaccessibilityReasons"
),

renamed as (
    select
        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Reason_id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Valid_From as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as inaccessibility_reason_id,
        "Reason_id" as inaccessibility_reason_key,
        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
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
        "ExternalCode" as inaccessibility_reason_external_code,
        "Valid_From" as valid_from,
        "Valid_To" as valid_to

        ----------  omited
        --"IsLegal",
        --"DLM",


    from source
)

select * from renamed;');


