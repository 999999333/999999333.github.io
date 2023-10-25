
      

  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  
    
  UPDATE DBT_INTERNAL_DEST
  SET dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to
  FROM "snapshots"."sfa__organization_structures_snapshot" as DBT_INTERNAL_DEST
  INNER JOIN "snapshots"."sfa__organization_structures_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id
  WHERE DBT_INTERNAL_DEST.dbt_valid_to is null
  AND DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete');

  INSERT INTO "snapshots"."sfa__organization_structures_snapshot" ("Country_Code", "OrgStructureID", "ParentID", "OrgStructureCode", "Name", "Email", "AT_ID", "Level", "OrgStructureOldId", "Status", "DLM", "ULM", "TaxCode", "PhoneNumber", "NodeId", "TreeNodeHierarchy", "StaffType_id", "FullName", "AdditionalFullTextSearch", "ResetPassword", "OfficeID", "BusinessRole", "ChildOrgStructureToUserTypeLinkRequired", "ChildOrgStructureToActivityTypeLinkRequired", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
  SELECT DBT_INTERNAL_SOURCE."Country_Code", DBT_INTERNAL_SOURCE."OrgStructureID", DBT_INTERNAL_SOURCE."ParentID", DBT_INTERNAL_SOURCE."OrgStructureCode", DBT_INTERNAL_SOURCE."Name", DBT_INTERNAL_SOURCE."Email", DBT_INTERNAL_SOURCE."AT_ID", DBT_INTERNAL_SOURCE."Level", DBT_INTERNAL_SOURCE."OrgStructureOldId", DBT_INTERNAL_SOURCE."Status", DBT_INTERNAL_SOURCE."DLM", DBT_INTERNAL_SOURCE."ULM", DBT_INTERNAL_SOURCE."TaxCode", DBT_INTERNAL_SOURCE."PhoneNumber", DBT_INTERNAL_SOURCE."NodeId", DBT_INTERNAL_SOURCE."TreeNodeHierarchy", DBT_INTERNAL_SOURCE."StaffType_id", DBT_INTERNAL_SOURCE."FullName", DBT_INTERNAL_SOURCE."AdditionalFullTextSearch", DBT_INTERNAL_SOURCE."ResetPassword", DBT_INTERNAL_SOURCE."OfficeID", DBT_INTERNAL_SOURCE."BusinessRole", DBT_INTERNAL_SOURCE."ChildOrgStructureToUserTypeLinkRequired", DBT_INTERNAL_SOURCE."ChildOrgStructureToActivityTypeLinkRequired", DBT_INTERNAL_SOURCE."dbt_updated_at", DBT_INTERNAL_SOURCE."dbt_valid_from", DBT_INTERNAL_SOURCE."dbt_valid_to", DBT_INTERNAL_SOURCE."dbt_scd_id" FROM "snapshots"."sfa__organization_structures_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
  WHERE  DBT_INTERNAL_SOURCE.dbt_change_type = 'insert';

  