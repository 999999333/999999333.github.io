with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ProductGroups_v"
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
        "ProdGroupCode"

    from source
)
select * from renamed