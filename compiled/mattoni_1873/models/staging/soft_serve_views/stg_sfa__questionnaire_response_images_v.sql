with source as (
      select * from "L01_Stage"."sfa"."dbo_ResponsesSingleContentD_v"
),
renamed as (
    select
        ----------  ids
        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(ContentID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as sfa_file_id,
        "ContentID" as sfa_file_key,
    
        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Response_ID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Object_ID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as image_id,


        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Response_ID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as questionnaire_response_id,
        "Response_ID" as questionnaire_response_key,
    
        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Object_ID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as question_id,
        "Object_ID" as question_key,

        
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
        "StepNumber" as step
        
        ----------  booleans

        ----------  timestamps
        -- "Valid_From",
        -- "Valid_To"

        ----------  omited
        -- "EntityTypeID",


    from source
)
select * from renamed