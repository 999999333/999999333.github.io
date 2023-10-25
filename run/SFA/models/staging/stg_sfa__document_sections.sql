
    


    
    

    EXEC('create view "dbt"."stg_sfa__document_sections__dbt_tmp" as with
    source as (select * from "DWH_Fabric"."dbt"."dbo_DocumentSections"),
    renamed as (
        select

            -- --------  ids
            "Section_ID" as questionnaire_section_id,
            "ParentSection_ID" as questionnaire_parent_section_id,
            "Document_ID" as questionnaire_id,
            "HReport_ID",
            "BO_ID",
            
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

            -- --------  strings
            "Name" as questionnaire_section_name,
            "ExternalCode" as questionnaire_section_external_code,

            -- --------  numerics
            "Level" as questionnare_section_level,
            "SortOrder" as questionnare_section_sort_order,
            "GroupingType" as questionnare_section_grouping_type,
            "RandomQuestionsNumber",
            "ULM",
            "Status",
            "ShootingAngle",

            -- --------  booleans
            "IsCallButton" as is_call_button,
            "EnableCopy" as is_enabled_copy,
            "IsPhotoReport" as is_photo_report,

            -- --------  timestamps
            "DLM",
            "Valid_From",
            "Valid_To"

        -- --------  omited
        from source
    )
select *
from renamed;');


