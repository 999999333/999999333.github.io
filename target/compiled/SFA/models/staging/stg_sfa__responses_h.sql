with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ResponsesH"
),
renamed as (
    select
        "Country_Code",
        "Response_ID",
        "Document_ID",
        "DLM",
        "Status",
        "IsProcessed",
        "SourceResponse_ID",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed