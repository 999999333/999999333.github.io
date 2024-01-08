with source as (
      select * from "L01_Stage"."sfa"."dbo_Networks"
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
        "OrgStructureID",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed