with source as (
      select * from "L01_Stage"."sfa"."dbo_OutletCardSteps"
),
renamed as (
    select
        "Country_Code",
        "OlCard_Id",
        "Step_No",
        "Step_ID",
        "Step_Detail",
        "Step_Begin_DateTime",
        "Step_End_DateTime",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed