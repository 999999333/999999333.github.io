
      
  merge into "L50_SB_Vitek"."snapshots"."sfa__outlets_snapshot" as DBT_INTERNAL_DEST
    using "L50_SB_Vitek"."snapshots"."#sfa__outlets_snapshot__dbt_tmp" as DBT_INTERNAL_SOURCE
    on DBT_INTERNAL_SOURCE.dbt_scd_id = DBT_INTERNAL_DEST.dbt_scd_id

    when matched
     and DBT_INTERNAL_DEST.dbt_valid_to is null
     and DBT_INTERNAL_SOURCE.dbt_change_type in ('update', 'delete')
        then update
        set dbt_valid_to = DBT_INTERNAL_SOURCE.dbt_valid_to

    when not matched
     and DBT_INTERNAL_SOURCE.dbt_change_type = 'insert'
        then insert ("Country_Code", "OL_id", "OLSubType_id", "Area_id", "OLName", "OLTradingName", "OLDirector", "OLAddress", "OLDeliveryAddress", "OLTelephone", "OLFax", "OLEMail", "OLAccountant", "OLAccountantPhone", "OLMarkManager", "OLMarkManagerPhone", "OLPurchManager", "OLOpenTime", "OLCloseTime", "OLBreakTimeFrom", "OLBreakTimeTo", "ZKPO", "IPN", "VATN", "RR", "Network_ID", "OLSize", "OLWHSize", "VisitRate_id", "OLStockCoverDays", "CashFlow_id", "DLM", "Status", "OLCode", "Proximity", "Location", "VisitFrequency", "OL_Code", "BankCode", "BankName", "BankAddress", "Owner_id", "ContractNumber", "ContractDate", "ParentComp_id", "CreationDate", "Cust_id", "CPCode", "DC_Allow", "OLDistributionCentre", "OlDistributionShare", "DC_Delivery", "DC_Payer", "LicenseUsage", "Appartments", "KLADR_ID", "ContractDateFinish", "AT_ID", "ULM", "SaleType", "OrgStructureID", "GeographyID", "DeliveryDelay", "DeactivateDate", "ExternalFormat_ID", "Block", "BlockLetter", "HouseLetter", "Place", "Comment", "CloseReason", "InactivationCandidate", "HasCoordinates", "HouseId", "PrevOL_Code", "PostalCode", "KOATUU", "OutletParsingAddressId", "ReturnOrderOnly", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")
        values ("Country_Code", "OL_id", "OLSubType_id", "Area_id", "OLName", "OLTradingName", "OLDirector", "OLAddress", "OLDeliveryAddress", "OLTelephone", "OLFax", "OLEMail", "OLAccountant", "OLAccountantPhone", "OLMarkManager", "OLMarkManagerPhone", "OLPurchManager", "OLOpenTime", "OLCloseTime", "OLBreakTimeFrom", "OLBreakTimeTo", "ZKPO", "IPN", "VATN", "RR", "Network_ID", "OLSize", "OLWHSize", "VisitRate_id", "OLStockCoverDays", "CashFlow_id", "DLM", "Status", "OLCode", "Proximity", "Location", "VisitFrequency", "OL_Code", "BankCode", "BankName", "BankAddress", "Owner_id", "ContractNumber", "ContractDate", "ParentComp_id", "CreationDate", "Cust_id", "CPCode", "DC_Allow", "OLDistributionCentre", "OlDistributionShare", "DC_Delivery", "DC_Payer", "LicenseUsage", "Appartments", "KLADR_ID", "ContractDateFinish", "AT_ID", "ULM", "SaleType", "OrgStructureID", "GeographyID", "DeliveryDelay", "DeactivateDate", "ExternalFormat_ID", "Block", "BlockLetter", "HouseLetter", "Place", "Comment", "CloseReason", "InactivationCandidate", "HasCoordinates", "HouseId", "PrevOL_Code", "PostalCode", "KOATUU", "OutletParsingAddressId", "ReturnOrderOnly", "dbt_updated_at", "dbt_valid_from", "dbt_valid_to", "dbt_scd_id")

;

  