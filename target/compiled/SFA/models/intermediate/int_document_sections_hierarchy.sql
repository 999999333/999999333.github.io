with source as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__questionnaire_sections"
)

select * from source