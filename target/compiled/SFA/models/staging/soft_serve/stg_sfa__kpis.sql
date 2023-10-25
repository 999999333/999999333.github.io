with source as (
      select * from "DWH_Fabric"."dbt"."ps_KPI"
),
renamed as (
    select
        "Country_Code",
        "KpiId",
        "ParentId",
        "ActivityType",
        "Name",
        "Comment",
        "ExternalCode",
        "Type",
        "Level",
        "Status",
        "DLM",
        "ULM",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed