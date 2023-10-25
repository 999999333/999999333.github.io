with source as (
      select * from "DWH_Fabric"."dbt"."dbo_Networks_v"
),
renamed as (
    select
        "Country_Code",
        "Network_id",
        "Network_Name",
        "Notes",
        "DLM",
        "Status",
        "ULM",
        "AppliesToAllCities",
        "NetworkType_ID",
        "NetworkCode",
        "JuridicalName",
        "JuridicalAddress",
        "GrdCode",
        "NetworkLevel",
        "OrgStructureID"

    from source
)
select * from renamed