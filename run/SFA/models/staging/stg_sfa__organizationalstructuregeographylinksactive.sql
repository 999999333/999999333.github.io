
    


    
    

    EXEC('create view "dbt"."stg_sfa__organizationalstructuregeographylinksactive__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OrganizationalStructureGeographyLinksActive"
),
renamed as (
    select
        "Country_Code",
        "OrgStructureID",
        "GeographyID",
        "DLM",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed;');


