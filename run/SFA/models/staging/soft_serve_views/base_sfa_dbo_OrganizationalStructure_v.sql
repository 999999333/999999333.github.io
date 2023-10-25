
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_OrganizationalStructure_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OrganizationalStructure_v"
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
        "ChildOrgStructureToActivityTypeLinkRequired"

    from source
)
select * from renamed;');


