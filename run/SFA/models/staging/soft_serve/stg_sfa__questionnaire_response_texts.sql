
    


    
    

    EXEC('create view "dbt"."stg_sfa__questionnaire_response_texts__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ResponsesSingleD_v"
),
renamed as (
    select


       ----------  ids

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(ResponseValueId as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as questionnare_answer_id,
        "ResponseValueId" as questionnare_answer_key,       

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Response_ID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as questionnaire_response_id,
        "Response_ID" as questionnaire_response_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Item_ID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as question_id,
        "Item_ID" as question_key,

        
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
        "ResponseValue" as questionnaire_answer,
        "ExternalCode" as questionnaire_answer_external_code,

        ----------  numerics
        "StepNumber" as questionnaire_answer_step,
        "ScanMethod" as questionnaire_answer_scan_method

        ----------  booleans

        ----------  timestamps
        -- "Valid_From",
        -- "Valid_To"
        
        ----------  omited

 
    from source
)
select * from renamed;');


