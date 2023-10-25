with source as (
      select * from "DWH_Fabric"."dbt"."ps_KPI_v"
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
        "ULM"

    from source
)
select * from renamed