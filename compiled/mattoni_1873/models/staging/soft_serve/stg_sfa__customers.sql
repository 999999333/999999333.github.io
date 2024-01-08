

with source as (

    select * from "L50_SB_Vitek"."snapshots"."sfa__customers_snapshot"
),

renamed as (
    select


        "ULM" as ulm,
        "DesktopOutletMinValue",
        "DesktopOutletCurrentValue",
        "DesktopOutletMaxValue",
        "DesktopOrderMinValue",
        "DesktopOrderCurrentValue",
        "DesktopOrderMaxValue",



        ----------  ids
        "dbt_scd_id" as dbt_scd_id,

        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(Cust_Id as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as customer_id,
        "Cust_Id" as customer_key,

        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(OL_id as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as outlet_id,
        "OL_id" as outlet_key,

        "DB_ID" as database_key,
        "GeographyID" as geography_key,

        
case
  when Country_Code = 'CZ' then 422
  when Country_Code = 'SK' then 423
  when Country_Code = 'HU' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        "Country_Code" as country_code,
        
        "City_Id" as city_id,
        "Distr_id" as distributor_id,
        "Area_ID" as area_id,
        "WarehouseBaseID" as warehouse_base_id,


        ----------  strings
        "Cust_NAME" as customer_name,
        "Cust_TradingName" as customer_trading_name,
        "ZKPO" as zkpo,
        "MFO" as mfo,
        "Bank_Account" as bank_account,
        "TAX_Number" as tax_number,
        "VAT_Number" as vat_number,
        "Cust_Address" as customer_adress,
        "Cust_TradingAddress" as customer_trading_address,
        "Bank_Name" as bank_name,
        "DIRECTOR" as director,
        "Email" as email,
        "Phone" as phone,
        "TradingPhone" as trading_phone,
        "Comments" as comments,
        "Passwd" as password,
        "ExternalCode" as customer_external_code,

        ----------  numerics
        "Status" as status,
        cast("PayFormMinValue" as INT) as payform_min_value,
        cast("PayFormCurrentValue" as INT) as payform_current_value,
        cast("PayFormMaxValue" as INT) as payform_max_value,
        cast("DiscountMinValue" as INT) as discount_min_value,
        cast("DiscountCurrentValue" as INT) as discount_current_value,
        cast("DiscountMaxValue" as INT) as discount_max_value,
        
        ----------  booleans
        "IsBlocked",
        "Is2LevelMode",
        "IsInExchangeEquipment",

        ----------  timestamps
        "DLM" as dlm,
        "dbt_valid_from" as dbt_valid_from,
        coalesce("dbt_valid_to", cast('2299-12-31' as datetime)) as dbt_valid_to
        
        ----------  omited
        -- "MerchMinValue",
        -- "MerchMaxValue",
        -- "DesktopRouteMinValue",
        -- "DesktopRouteCurrentValue",
        -- "DesktopRouteMaxValue",
        -- "DesktopVisitMinValue",
        -- "DesktopVisitCurrentValue",
        -- "DesktopVisitMaxValue",
        -- "CheckSchedule",
        -- "IEConfiguration",
        -- "SalesOrgCode",
        -- "SyncInProgress",
        -- "LastSyncDateTime",
        -- "RenewSupervisorPasswd",
        -- "RenewAdminPasswd",



    from
        source
)

select *
from
    renamed