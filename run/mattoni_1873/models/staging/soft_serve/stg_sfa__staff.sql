
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__staff__dbt_tmp" as
        with source as (
      select * from "L50_SB_Vitek"."snapshots"."sfa__staff_snapshot"
),
renamed as (
    select
        ----------  ids
        "dbt_scd_id",
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Staff_id as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as staff_id,
        "Staff_id" as staff_key,
        "Staff_Code" as staff_sap_code,
        
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
        "Name" as staff_name_whole,
        "FName" as staff_name_first,
        "LName" as staff_name_last,
        "Position" as staff_position,
        "Comment" as staff_comment,
        "EMail" as staff_email,
        reverse(
            left(
                reverse("Name"),
                patindex(''%[^0-9 ]%'', reverse("Name") + ''x'') - 1
            )
        ) as staff_telephone,

        ----------  numerics
        "Status" as status,

        ----------  booleans

        ----------  timestamps
        "DLM" as dlm,
        "dbt_valid_from",
        coalesce("dbt_valid_to", cast(''2299-12-31'' as datetime)) as dbt_valid_to
        
        ----------  omited
        -- "SName" as staff_middle_name,
        -- "BirthDate" as staff_birth_date,
        -- "Location" as staff_location,
        -- "Dept" as staff_department,
        -- "GeographyID",
        -- "StaffType_id",
        -- "ULM",

    from source
)
select * from renamed
    ');

