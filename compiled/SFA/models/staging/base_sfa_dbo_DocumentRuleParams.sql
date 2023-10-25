with source as (
    select * from "DWH_Fabric"."dbt"."dbo_DocumentRuleParams"
),

renamed as (
    select
        "Country_Code",
        "Param_ID",
        "Rule_ID",
        "ValidationItem_ID",
        "TableRow_ID",
        "DisplayValue",
        "ValidationValue",
        "ReplacementType",
        "SortOrder",
        "ParamOperation",
        "ULM",
        "DLM",
        "Status",
        "DisplayValueId",
        "ValidationValueId",
        "Valid_From",
        "Valid_To"

    from source
)

select * from renamed