with source as (
    select *
    from
        "DWH_Fabric"."dbt"."dbo_DocumentRules"
),

renamed as (
    select

        ----------  ids
        "Rule_ID" as questionnare_rule_id,
        "Object_ID" as questionnaire_question_id,
        "StandartDocumentItemId" as questionnaire_question_standard_id,
        
case
  when Country_Code = 'CZ' then 422
  when Country_Code = 'SK' then 423
  when Country_Code = 'HU' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings
        "RuleName",
        "ExternalCode",
        "CycleItem",

        ----------  numerics
        "Type",
        "RuleOperation",
        "SortOrder",
        "ULM",
        "Status",

        ----------  booleans
        "AllowBreakCycle",

        ----------  timestamps
        "DLM",
        "Valid_From",
        "Valid_To"

        ----------  omited

    from
        source
)

select *
from
    renamed