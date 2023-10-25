with source as (
    select * from "DWH_Fabric"."dbt"."dbo_ResponsesH"
),

renamed as (
    select

        ----------  ids
        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Response_ID as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Valid_From as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as link_id,
        "Response_ID" as link_key,
        "Document_ID" as questionnaire_key,
        "SourceResponse_ID"
            as questionnaire_source_response_id,
        
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

        ----------  booleans

        ----------  timestamps
        "Valid_From" as valid_from,
        "Valid_To" as valid_to

        ----------  omited
        -- "Status",
        -- "IsProcessed",
        -- "DLM",

    from source
)

select * from renamed