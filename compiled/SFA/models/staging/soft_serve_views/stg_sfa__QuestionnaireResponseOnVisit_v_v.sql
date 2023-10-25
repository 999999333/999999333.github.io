with source as (
      select * from "DWH_Fabric"."dbt"."dbo_QuestionnaireResponseOnVisit_v"
),
renamed as (
    select
        
*
    from source
)
select * from renamed