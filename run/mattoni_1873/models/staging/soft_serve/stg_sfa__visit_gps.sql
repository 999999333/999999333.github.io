
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__visit_gps__dbt_tmp" as
        with source as (
    select * from "L01_Stage"."sfa"."dbo_OutletCardGPS_v"
),

renamed as (
    select

        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(OLCard_id as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as visit_id,
        "OLCard_id" as visit_key,

        
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

        ----------  numerics
        "Latitude" as visit_start_latitude,
        "Longitude" as visit_start_longtitude,
        "FinishLatitude" as visit_finish_latitude,
        "FinishLongitude" as visit_finish_longtitude,

        ----------  booleans
        "isFake" as is_fake_gps,

        ----------  timestamps
        "DLM" as dlm
        -- "Valid_From" as valid_from,
        -- "Valid_To" as valid_to

        ----------  omited
        

    from source
)

select * from renamed
    ');

