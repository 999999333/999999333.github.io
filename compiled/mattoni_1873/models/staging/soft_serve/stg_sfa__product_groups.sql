with source as (
      select * from "L01_Stage"."sfa"."dbo_ProductGroups"
),
renamed as (
    select
        "Country_Code",
        "ProdGroup_ID",
        "ProdGroupName",
        "ProdGroupShortName",
        "SortOrder",
        "DLM",
        "Status",
        "ULM",
        "IsConcurrent",
        "ProdCategory_ID",
        "ProdGroupCode",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed