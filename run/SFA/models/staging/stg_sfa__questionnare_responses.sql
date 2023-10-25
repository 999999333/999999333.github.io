
    


    
    

    EXEC('create view "dbt"."stg_sfa__questionnare_responses__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."dbo_ResponsesH"
),

renamed as (
    select

        ----------  ids
        
CONCAT(
        ISNULL(CAST(Response_ID AS NVARCHAR(MAX)), ''-1''),
        ISNULL(CAST(Valid_From AS NVARCHAR(MAX)), ''-1'')
    )
    as _surrogate_key

, 
        "Response_ID" as questionnaire_response_id,
        "Document_ID" as questionnaire_id,
        "SourceResponse_ID"
            as questionnaire_source_response_id,
        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings

        ----------  numerics

        ----------  booleans

        ----------  timestamps
        "Valid_From",
        "Valid_To"

        ----------  omited
        -- "Status",
        -- "IsProcessed",
        -- "DLM",

    from source
)

select * from renamed;');


