with source as (
      select * from "L01_Stage"."sfa"."dbo_OrganizationalStructureGeographyLinksActive"
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
select * from renamed