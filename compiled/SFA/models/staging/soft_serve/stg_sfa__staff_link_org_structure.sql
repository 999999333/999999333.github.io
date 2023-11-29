with source as (
      select * from "DWH_Fabric"."dbt"."dbo_StaffOrganizationalStructureLinksActive"
),

renamed as (
    select
        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(OrgStructureID as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as organizational_structure_id,
        "OrgStructureID" as organizational_structure_key,
        
        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Staff_id as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as staff_id,
        "Staff_id" as staff_key,

        
case
  when Country_Code = 'CZ' then 422
  when Country_Code = 'SK' then 423
  when Country_Code = 'HU' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        "Country_Code" as country_code,
     
        "StartDate" as link_start_date,
        "EndDate" as link_end_date,
        "IsMain" as is_main,
        "DLM" as dlm,
        "RecordNumber" as record_number,
        "Valid_From",
        "Valid_To"


    from source
)

select * from renamed