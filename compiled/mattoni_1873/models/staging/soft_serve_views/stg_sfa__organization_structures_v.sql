with source as (
      select * from "L01_Stage"."sfa"."dbo_OrganizationalStructure_v"
),
renamed as (
    select

        ----------  ids
        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(OrgStructureID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as organizational_structure_id,
        "OrgStructureID" as organizational_structure_key,
        
        "ParentID" as organizational_structure_parent_key,

        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(NodeId as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as structure_node_id,
        "NodeId" as structure_node_key,
        "Level"  as structure_node_level,
        "TreeNodeHierarchy" as structure_node_tree_hierarchy,
        "OrgStructureCode" as structure_code,
        "OrgStructureOldId" as structure_old_key,

        
case
  when Country_Code = 'CZ' then 422
  when Country_Code = 'SK' then 423
  when Country_Code = 'HU' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        "Country_Code" as country_code,

        ----------  strings
        "Name" as structure_name,
        "PhoneNumber" as structure_telephone,
        "Email" as structure_email,
        "FullName" as structure_whole_node_tree,
        "AdditionalFullTextSearch" as structure_name_detail,

        ----------  numerics
        "Status",
        "BusinessRole",

        ----------  booleans
        "ResetPassword",

        ----------  timestamps
        "DLM" as dlm
        
        ----------  omited
        -- "ULM",
        -- "TaxCode",
        -- "StaffType_id",
        -- "OfficeID",
        -- "ChildOrgStructureToUserTypeLinkRequired",
        -- "ChildOrgStructureToActivityTypeLinkRequired",
        -- "AT_ID",



    from source
)
select * from renamed