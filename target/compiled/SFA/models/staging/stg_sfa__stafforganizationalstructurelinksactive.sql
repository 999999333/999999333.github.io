with source as (
      select * from "DWH_Fabric"."dbt"."dbo_StaffOrganizationalStructureLinksActive"
),
renamed as (
    select
        "Country_Code",
        "Staff_id",
        "OrgStructureID",
        "StartDate",
        "EndDate",
        "IsMain",
        "DLM",
        "RecordNumber",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed