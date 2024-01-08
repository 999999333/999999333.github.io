with source as (
      select * from "L01_Stage"."sfa"."dbo_ProductCategory"
),
renamed as (
    select
        "Country_Code",
        "ProdCategory_ID",
        "ProdCategoryName",
        "ProdCategoryShortName",
        "SortOrder",
        "DLM",
        "Status",
        "ULM",
        "IsConcurrent",
        "ProdCategoryCode",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed