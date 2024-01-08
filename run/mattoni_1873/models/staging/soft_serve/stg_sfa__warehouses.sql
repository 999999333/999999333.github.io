
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__warehouses__dbt_tmp" as
        with source as (
    select * from "L01_Stage"."sfa"."dbo_Warehouses"
),

renamed as (
    select
    
        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(W_id as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Valid_From as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as _id,
        "W_id" as warehouse_id,
        "WType_id" as warehouse_type_id,
        "Cust_id" as customer_id,

        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings
        "W_ExternalCode" as warehouse_external_code,
        "W_ShortName" as warehouse_short_name,
        "W_LongName" as warehouse_long_name,
        "Address" as warehouse_address,
        "Email" as warehouse_email,


        ----------  numerics
        "DeliveryDelay",
        "Status",
        "ULM",

        ----------  booleans
        "StockAccounting",
        "StockManagement",
        "StockOrder",
        "LotAccounting",
        "StockNegative",
        "CountHolidaysForDelivery",

        ----------  timestamps
        "StartingStockDate",
        "DLM",
        "Valid_From" as valid_from,
        "Valid_To" as valid_to

        ----------  omited
        -- "Priority",

    from source
)

select * from renamed
    ');

