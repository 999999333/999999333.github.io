with source as (
      select * from "DWH_Fabric"."dbt"."dbo_Products"
),

renamed as (
    select
        "ProductType_Id",
        "Unit_Id",
        "UnitWeight",
        "Package_QTY",
        "SortOrder",
        "DLM",
        "Status",
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


        ----------  ids
        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Product_Id as VARCHAR(8000)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as product_id,
        "Product_Id" as product_key,

        "ProductCode" as product_code,

        
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
        "ProductName" as product_name,
        "ProductShortName" as product_name_short,

        ----------  numerics

        ----------  booleans
        "IsPosm" as is_pos_material,

        ----------  timestamps
        "Valid_From",
        "Valid_To"

        ----------  omited
        -- "ULM"


    from source
)
select * from renamed