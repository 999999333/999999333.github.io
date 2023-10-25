with source as (
      select * from "DWH_Fabric"."dbt"."ps_KPIExecutionFact_v"
),
renamed as (
    select
        "Country_Code",
        "KpiId",
        "VersionId",
        "OlCard_id",
        "Date",
        "OL_ID",
        "OrgStructureID",
        "Fact",
        "DLM",
        "Status",
        --"Valid_From",
        --"Valid_To"

    from source
)
select * from renamed