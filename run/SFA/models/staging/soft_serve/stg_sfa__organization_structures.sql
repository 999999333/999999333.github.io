
    


    
    

    EXEC('create view "dbt"."stg_sfa__organization_structures__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."snapshots"."sfa__organization_structures_snapshot"
),
renamed as (
    select



        ----------  ids
        "dbt_scd_id" as dbt_scd_id,
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(OrgStructureID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as _id,
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(OrgStructureID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as organizational_structure_id,
        "OrgStructureID" as organizational_structure_key,
        "ParentID" as parent_structure_id,
        "NodeId" as structure_node_id,
        "Level"  as structure_node_level,
        "TreeNodeHierarchy",
        "OrgStructureCode",
        "OrgStructureOldId",
        "AT_ID",
        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

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
        "DLM" as dlm,
        "dbt_valid_from" as dbt_valid_from,
        coalesce("dbt_valid_to", cast(''2299-12-31'' as datetime)) as dbt_valid_to
        
        ----------  omited
        -- "ULM",
        -- "TaxCode",
        -- "StaffType_id",
        -- "OfficeID",
        -- "ChildOrgStructureToUserTypeLinkRequired",
        -- "ChildOrgStructureToActivityTypeLinkRequired",


    from source
)
select * from renamed;');


