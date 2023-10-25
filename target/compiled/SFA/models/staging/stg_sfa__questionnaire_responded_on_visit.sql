with source as (
    select * from "DWH_Fabric"."dbt"."dbo_QuestionnaireResponseOnVisit"
),

renamed as (
    select

        ----------  ids
        
CONCAT(
        ISNULL(CAST(Response_ID AS NVARCHAR(MAX)), '-1'),
        ISNULL(CAST(Valid_To AS NVARCHAR(MAX)), '-1')
    )
    as _surrogate_key

,
        "Visit_ID" as visit_id,
        "Response_ID" as questionnaire_response_id,
        
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
        "Valid_From",
        "Valid_To"

        ----------  omited
    from source
)

select * from renamed