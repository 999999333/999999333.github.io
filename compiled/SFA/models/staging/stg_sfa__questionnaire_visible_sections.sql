with source as (
      select * from "DWH_Fabric"."dbt"."dbo_QuestionnaireVisibleSections"
),
renamed as (
    select
        "Country_Code",
        "Response_Id",
        "Section_Id",
        "StepNumber",
        "IsVisible",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed