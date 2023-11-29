
    


    
    

    EXEC('create view "dbt"."stg_sfa__products_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_Products_v"
),

renamed as (
    select
       
        "DLM",
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
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Product_Id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as product_id,
        "Product_Id" as product_key,

        "ProductCode" as product_sap_code,

        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        "Country_Code" as country_code,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(ProductType_Id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as product_type_id,
        "ProductType_Id" as product_type_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Country_Code as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Unit_Id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as product_unit_id,
        "Unit_Id" as product_unit_key,


        ----------  strings
        "ProductName" as product_name,
        "ProductShortName" as product_name_short,
        "EANCode" as ean_code,

        ----------  numerics
  
        "UnitWeight" as unit_weight,
        "Package_QTY" as package_quantity,
        "SortOrder" as sort_order,
        "Status" as status,

        ----------  booleans
        "IsPosm" as is_pos_material
        ----------  timestamps

        ----------  omited
        -- "ULM"


    from source
)

select * from renamed;');


