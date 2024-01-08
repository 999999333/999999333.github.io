with source as (
      select * from "L01_Stage"."sfa"."dbo_QuestionnaireVisibleSections"
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