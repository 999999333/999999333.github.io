
    


    
    

    EXEC('create view "dbt"."stg_sfa__document_items__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_DocumentItems"
),
renamed as (
    select

        ----------  ids
        "Item_ID" as questionnaire_question_id,
        "Section_ID" as questionnaire_section_id,
        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        "BO_ID",
        "StandartDocumentItemId" as questionnaire_question_standard_id,

        ----------  strings
        "DisplayValue" as questionnaire_question,
        "TargetValue" as questionnaire_question_target_value,

        ----------  numerics
        "SortOrder" as questionnaire_question_sort_order,
        "ExternalCode" as questionnaire_question_external_code, 
        "ValueType",
        "QuestionWeight" as questionnaire_question_weight,
        "ControlType",
        "TotalType",
        "MDBContentCountLimit",
        "Status" as questionnaire_question_status,
        "ResponseFormat" as questionnaire_question_response_format,

        ----------  booleans
        "UseContentCDB",
        "UseContentMDB",
        "HasRestrictionRules",
        "HasValidationRules",
        "HasMobileContentRules",
        "IsReadOnly",
        "Distribution",
        "BarCodeScanning",

        ----------  timestamps
        "DLM",
        "Valid_From",
        "Valid_To"

        ----------  omited
        -- "HighlightInColor",
        -- "UseResponseFromPreviousQuestionnaire",
        -- "Hint",
        -- "IsProhibitEditingPreviousAnswer",
        -- "UsePreviousVisitContent",
        -- "ULM",

    from source
)
select * from renamed;');


