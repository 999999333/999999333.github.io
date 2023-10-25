
    


    
    

    EXEC('create view "dbt"."stg_sfa__Products_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_Products_v"
),
renamed as (
    select
        "Country_Code",
        "Product_Id",
        "ProductCode",
        "ProductType_Id",
        "ProductName",
        "ProductShortName",
        "Unit_Id",
        "UnitWeight",
        "Package_QTY",
        "SortOrder",
        "DLM",
        "Status",
        "ULM",
        "Price",
        "IsMix",
        "IsTare",
        "Tare_Id",
        "TarePack_Qty",
        "IsReturnable",
        "IsConcurrent",
        "ProductVolume",
        "IsProductWeight",
        "CertificateNo",
        "CertificateBeginDate",
        "CertificateEndDate",
        "HLCode",
        "IsBonuse",
        "EANCode",
        "LicenseType_ID",
        "ProductBrand_ID",
        "Delisted",
        "Quant_Qty",
        "ProductCode2",
        "SyncToDDB",
        "ServiceBit",
        "IsPromotional",
        "IsLinkedToAllCustomers",
        "FrontWidth",
        "FrontHeight",
        "HasActiveContentFile",
        "IsSeasonal",
        "IsBaseProduct",
        "ForRecognition",
        "IsExchangeBottle",
        "IsPosm"

    from source
)
select * from renamed;');


