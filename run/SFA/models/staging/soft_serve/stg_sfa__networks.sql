
    


    
    

    EXEC('create view "dbt"."stg_sfa__networks__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_Networks"
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
select * from renamed;');


