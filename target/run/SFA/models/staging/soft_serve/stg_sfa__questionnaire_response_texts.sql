
    


    
    

    EXEC('create view "dbt"."stg_sfa__questionnaire_response_texts__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ResponsesSingleD"
),
renamed as (
    select


       ----------  ids
        
CONCAT(
        ISNULL(CAST(ResponseValueId AS NVARCHAR(MAX)), ''-1''),
        ISNULL(CAST(Valid_From AS NVARCHAR(MAX)), ''-1'')
    )
    as _surrogate_key

, 
        "ResponseValueId" as questionnare_answer_id,       
        "Response_ID" as questionnaire_response_id,
        "Item_ID" as question_id,
        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings
        "ResponseValue" as questionnare_answer,
        "ExternalCode" as questionnare_answer_external_code,

        ----------  numerics
        "StepNumber" as questionnare_answer_step,
        "ScanMethod" as questionnare_answer_scan_method,

        ----------  booleans

        ----------  timestamps
        "Valid_From",
        "Valid_To"
        
        ----------  omited

 
    from source
)
select * from renamed;');


