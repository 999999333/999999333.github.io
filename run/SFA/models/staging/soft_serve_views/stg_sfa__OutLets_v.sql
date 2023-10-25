
    


    
    

    EXEC('create view "dbt"."stg_sfa__OutLets_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OutLets_v"
),
renamed as (
    select
        "Country_Code",
        "OL_id",
        "OLSubType_id",
        "Area_id",
        "OLName",
        "OLTradingName",
        "OLDirector",
        "OLAddress",
        "OLDeliveryAddress",
        "OLTelephone",
        "OLFax",
        "OLEMail",
        "OLAccountant",
        "OLAccountantPhone",
        "OLMarkManager",
        "OLMarkManagerPhone",
        "OLPurchManager",
        "OLOpenTime",
        "OLCloseTime",
        "OLBreakTimeFrom",
        "OLBreakTimeTo",
        "ZKPO",
        "IPN",
        "VATN",
        "RR",
        "Network_ID",
        "OLSize",
        "OLWHSize",
        "VisitRate_id",
        "OLStockCoverDays",
        "CashFlow_id",
        "DLM",
        "Status",
        "OLCode",
        "Proximity",
        "Location",
        "VisitFrequency",
        "OL_Code",
        "BankCode",
        "BankName",
        "BankAddress",
        "Owner_id",
        "ContractNumber",
        "ContractDate",
        "ParentComp_id",
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
        "AT_ID",
        "ULM",
        "SaleType",
        "OrgStructureID",
        "GeographyID",
        "DeliveryDelay",
        "DeactivateDate",
        "ExternalFormat_ID",
        "Block",
        "BlockLetter",
        "HouseLetter",
        "Place",
        "Comment",
        "CloseReason",
        "InactivationCandidate",
        "HasCoordinates",
        "HouseId",
        "PrevOL_Code",
        "PostalCode",
        "KOATUU",
        "OutletParsingAddressId",
        "ReturnOrderOnly"

    from source
)
select * from renamed;');


