
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_QuestionnaireVisibleSections_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_QuestionnaireVisibleSections_v"
),
renamed as (
    select
        "Country_Code",
        "Response_Id",
        "Section_Id",
        "StepNumber",
        "IsVisible"

    from source
)
select * from renamed;');


