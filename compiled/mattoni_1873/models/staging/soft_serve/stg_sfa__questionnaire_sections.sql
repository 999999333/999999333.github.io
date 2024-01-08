with source as (
    select * from "L50_SB_Vitek"."snapshots"."sfa__document_sections_snapshot"
),
renamed as (
    select

        ----------  ids
        "dbt_scd_id" as dbt_scd_id,

        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Section_ID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as questionnaire_section_id,
        "Section_ID" as questionnaire_section_key,

        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(ParentSection_ID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as questionnaire_section_parent_id,
        "ParentSection_ID" as questionnaire_section_parent_key,

        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Document_ID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as questionnaire_id,
        "Document_ID" as questionnaire_key,

        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(BO_ID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as questionnaire_section_bo_id,
        "BO_ID" as questionnaire_section_bo_key,

        
case
  when Country_Code = 'CZ' then 422
  when Country_Code = 'SK' then 423
  when Country_Code = 'HU' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings
        "Name" as questionnaire_section_name,
        "ExternalCode" as questionnaire_section_external_code,

        ----------  numerics
        "Level" as questionnaire_section_level,
        "SortOrder" as questionnaire_section_sort_order,
        "GroupingType" as questionnaire_section_grouping_type,
        "Status" as questionnaire_section_status,

        ----------  booleans
        "IsCallButton" as is_call_button,
        "IsPhotoReport" as is_photo_report,

        ----------  timestamps
        "DLM" as dlm,
        "dbt_valid_from" as dbt_valid_from,
        coalesce("dbt_valid_to", cast('2299-12-31' as datetime)) as dbt_valid_to

        ----------  omited
        -- "HReport_ID" as questionnaire_group_id,
        -- "ULM",
        -- "RandomQuestionsNumber",
        -- "EnableCopy" as is_enabled_copy,
        -- "ShootingAngle",



    from source
)
select *
from renamed