with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ResponsesSingleContentD"
),
renamed as (
    select
        ----------  ids
        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(8000), concat(coalesce(cast(ContentID as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Valid_From as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'))), '')), 2))

        "ContentID",
        "Response_ID",
        "Object_ID",
        
case
  when Country_Code = 'CZ' then 422
  when Country_Code = 'SK' then 423
  when Country_Code = 'HU' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings

        ----------  numerics
        "StepNumber",
        
        ----------  booleans

        ----------  timestamps
        "Valid_From",
        "Valid_To"

        ----------  omited
        -- "EntityTypeID",


    from source
)
select * from renamed