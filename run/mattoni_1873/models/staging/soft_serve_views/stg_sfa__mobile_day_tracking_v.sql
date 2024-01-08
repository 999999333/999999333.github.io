
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__mobile_day_tracking_v__dbt_tmp" as
        with source as (
      select * from "L01_Stage"."sfa"."dbo_MobileModuleUserTimeTrack_v"
),
renamed as (
    select

        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(MobileModuleUserID as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as mobile_user_id,
        "MobileModuleUserID" as mobile_user_key,
        
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
        "StartLatitude" as start_latitude,
        "StartLongitude" as start_longitude,
        "EndLatitude" as end_latitude,
        "EndLongitude" as end_longitude,

        ----------  numerics

        ----------  booleans

        ----------  timestamps
        cast("Date" as date) as day_date,
        cast("StartTime" as time(2)) as day_start_time,
        cast("EndTime" as time(2)) as day_end_time

        ----------  omited
--        "DLM"

    from source
)
select * from renamed
    ');

