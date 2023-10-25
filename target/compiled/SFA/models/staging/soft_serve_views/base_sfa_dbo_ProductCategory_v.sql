with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ProductCategory_v"
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
        "ProdCategoryCode"

    from source
)
select * from renamed