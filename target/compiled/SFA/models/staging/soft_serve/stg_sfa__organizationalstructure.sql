with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OrganizationalStructure"
),
renamed as (
    select
        "Country_Code",
        "OrgStructureID",
        "ParentID",
        "OrgStructureCode",
        "Name",
        "Email",
        "AT_ID",
        "Level",
        "OrgStructureOldId",
        "Status",
        "DLM",
        "ULM",
        "TaxCode",
        "PhoneNumber",
        "NodeId",
        "TreeNodeHierarchy",
        "StaffType_id",
        "FullName",
        "AdditionalFullTextSearch",
        "ResetPassword",
        "OfficeID",
        "BusinessRole",
        "ChildOrgStructureToUserTypeLinkRequired",
        "ChildOrgStructureToActivityTypeLinkRequired",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed