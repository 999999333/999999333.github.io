with source as (
      select * from "L01_Stage"."sfa"."dbo_OutLets_v"
),
renamed as (
    select


        "Status",
        "OLCode",
        "Proximity",
        "Location",
        "VisitFrequency",
        "OL_Code"  as outlet_sap_code,
        "BankCode",
        "BankName",
        "BankAddress",
        "ContractNumber",
        "ContractDate",
        "CreationDate",
        "Cust_id",
        "CPCode",
        "DC_Allow",
        "OLDistributionCentre",
        "OlDistributionShare",
        "DC_Delivery",
        "DC_Payer",
        "LicenseUsage",
        "Appartments",
        "KLADR_ID",
        "ContractDateFinish",
        "ULM",
        "SaleType",
        "DeliveryDelay",
        "DeactivateDate",
        "InactivationCandidate",

        "PrevOL_Code",
        "PostalCode",
        "KOATUU",
        "OutletParsingAddressId",
        "ReturnOrderOnly",

        ----------  ids
        
        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(OL_id as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as outlet_id,
        "OL_id" as outlet_key,

        "OLSubType_id" as outlet_subtype_id,
        "Area_id" as area_id,
        
case
  when Country_Code = 'CZ' then 422
  when Country_Code = 'SK' then 423
  when Country_Code = 'HU' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        "Network_ID" as network_id,
        "VisitRate_id" as visit_rate_id,
        "Owner_id" as owner_id,
        "ParentComp_id" as parent_company_id,
        "Cust_id" as customer_id,
        "AT_ID" as at_id,

        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(OrgStructureID as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as organizational_structure_id,
        "OrgStructureID" as organizational_structure_key,

        "GeographyID" as geography_id,
        "ExternalFormat_ID" as external_format_id,
        "HouseId" as house_id,

        ----------  strings
        "OLName" as outlet_name,
        "OLTradingName" as outlet_trading_name,
        "OLDirector" as outlet_director,
        "OLAddress" as outlet_adress,
        "OLDeliveryAddress" as outlet_delivery_adress,
        "OLTelephone" as outlet_telephone,
        "OLFax" as outlet_fax,
        "OLEMail" as outlet_email,
        "OLAccountant" as outlet_accountant,
        "OLAccountantPhone" as outlet_accountant_phone,
        "OLMarkManager" as outlet_marketing,
        "OLMarkManagerPhone" as outlet_marketing_phone,
        "OLPurchManager" as outlet_purchasing,
        "ZKPO",
        "IPN",
        "VATN",
        "Block",
        "BlockLetter",
        "HouseLetter",
        "Place",
        "Comment" as outlet_comment,
        "CloseReason",


        ----------  numerics

        ----------  booleans
        "HasCoordinates" as has_coordinates,


        ----------  timestamps
        "DLM" as dlm
        
        ----------  omited
        -- "OLOpenTime",
        -- "OLCloseTime",
        -- "OLBreakTimeFrom",
        -- "OLBreakTimeTo",
        -- "RR",
        -- "OLSize",
        -- "OLWHSize",
        -- "OLStockCoverDays",
        -- "CashFlow_id",


    from source
)
select * from renamed