
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__organizationalstructuregeographylinksactive__dbt_tmp" as
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
    ');

