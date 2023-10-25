
    


    
    

    EXEC('create view "dbt"."stg_sfa__customers__dbt_tmp" as 

with source as (

    select *
    from
        "DWH_Fabric"."dbt"."dbo_Customers"
),

renamed as (
    select
        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        -- "Country_Code" as country_code,
        cast("Cust_Id" as INT) as customer_id,
        "Cust_NAME" as customer_name,
        "Cust_TradingName" as customer_trading_name,
        "ZKPO" as zkpo,
        "MFO" as mfo,
        "Bank_Account" as bank_account,
        "TAX_Number",
        "VAT_Number",
        "Cust_Address" as customer_adress,
        "Cust_TradingAddress" as customer_trading_address,
        "Bank_Name" as bank_name,
        "DIRECTOR" as director,
        cast("City_Id" as INT) as city_id,
        "Email" as email,
        "Phone" as phone,
        "TradingPhone" as trading_phone,
        "Comments" as comments,
        cast("Distr_id" as INT) as distributor_id,
        "Passwd" as passwd,
        "DLM",
        "Status" as status,
        cast("PayFormMinValue" as INT) as payform_min_value,
        cast("PayFormCurrentValue" as INT) as payform_current_value,
        cast("PayFormMaxValue" as INT) as payform_max_value,
        cast("DiscountMinValue" as INT) as discount_min_value,
        cast("DiscountCurrentValue" as INT) as discount_current_value,
        cast("DiscountMaxValue" as INT) as discount_max_value,
        "LastSyncDateTime",
        "RenewSupervisorPasswd",
        "RenewAdminPasswd",
        "ULM" as ulm,
        "DesktopOutletMinValue",
        "DesktopOutletCurrentValue",
        "DesktopOutletMaxValue",
        "DesktopOrderMinValue",
        "DesktopOrderCurrentValue",
        "DesktopOrderMaxValue",
        "MerchMinValue",
        "MerchMaxValue",
        "DesktopRouteMinValue",
        "DesktopRouteCurrentValue",
        "DesktopRouteMaxValue",
        "DesktopVisitMinValue",
        "DesktopVisitCurrentValue",
        "DesktopVisitMaxValue",
        "CheckSchedule",
        "Area_ID",
        "IEConfiguration",
        "SalesOrgCode",
        "IsBlocked",
        "SyncInProgress",
        "OL_id" as outlet_id,
        "GeographyID" as geography_id,
        "Is2LevelMode",
        "WarehouseBaseID",
        "ExternalCode",
        "DB_ID" as database_id,
        "IsInExchangeEquipment",
        "Valid_From",
        "Valid_To"
    from
        source
)

select *
from
    renamed;');


