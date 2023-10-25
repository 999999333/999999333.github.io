with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ResponsesSingleD"
),
renamed as (
    select
        "Country_Code",
        "Response_ID",
        "Item_ID",
        "ResponseValue",
        "ExternalCode",
        "ResponseValueId",
        "StepNumber",
        "ScanMethod",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed