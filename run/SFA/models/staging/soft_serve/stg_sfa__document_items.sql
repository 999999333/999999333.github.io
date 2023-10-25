
    


    
    

    EXEC('create view "dbt"."stg_sfa__document_items__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."snapshots"."sfa__document_items_snapshot"
),
renamed as (
    select

        ----------  ids
        "dbt_scd_id" as dbt_scd_id,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Item_ID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as questionnaire_question_id,
        "Item_ID" as questionnaire_question_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Section_ID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as questionnaire_section_id,
        "Section_ID" as questionnaire_section_key,
        
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(StandartDocumentItemId as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as questionnaire_question_standard_id,
        "StandartDocumentItemId" as questionnaire_question_standard_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(BO_ID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as questionnaire_question_bo_id,
        "BO_ID" as questionnaire_question_bo_key,

        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings
        "DisplayValue" as questionnaire_question,
        "TargetValue" as questionnaire_question_target_value,

        ----------  numerics
        "SortOrder" as questionnaire_question_sort_order,
        "ExternalCode" as questionnaire_question_external_code, 
        "QuestionWeight" as questionnaire_question_weight,
        "Status" as questionnaire_question_status,
        "ResponseFormat" as questionnaire_question_response_format,

        ----------  booleans

        "UseResponseFromPreviousQuestionnaire"  as questionnaire_question_has_use_previous_answer,
        "IsReadOnly" as questionnaire_question_is_read_only,
        "Distribution" as questionnaire_question_is_distribution,

        ----------  timestamps
        "DLM" as dlm,
        "dbt_valid_from" as dbt_valid_from,
        coalesce("dbt_valid_to", cast(''2299-12-31'' as datetime)) as dbt_valid_to

        ----------  omited
        -- "HighlightInColor",
        -- "Hint",
        -- "IsProhibitEditingPreviousAnswer",
        -- "UsePreviousVisitContent",
        -- "ULM",
        -- "ControlType" as questionnaire_control_type,
        -- "TotalType" as questionnaire_total_type,
        -- "ValueType" as questionnaire_value_type,
        -- "UseContentCDB" as questionnaire_,
        -- "UseContentMDB" as questionnaire_,
        -- "HasRestrictionRules" as questionnaire_,
        -- "HasValidationRules" as questionnaire_,
        -- "HasMobileContentRules" as questionnaire_,
        -- "MDBContentCountLimit"  as questionnaire_question_,
        -- "BarCodeScanning" as questionnaire_question_is_,


    from source
)
select * from renamed;');


