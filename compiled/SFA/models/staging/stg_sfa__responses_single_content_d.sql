with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ResponsesSingleContentD"
),
renamed as (
    select
        "Country_Code",
        "Response_ID",
        "Object_ID",
        "StepNumber",
        "ContentID",
        "EntityTypeID",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed