
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_Customers__dbt_tmp" as 

with source as (
      select * from "SFA_Warehouse"."dbt"."dbo_Customers"
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
 as country_code,
        --"Country_Code" as country_code,
        cast("Cust_Id" as int) as customer_id,
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
        "City_Id" as city_id,
        "Email" as email,
        "Phone" as phone,
        "TradingPhone" as trading_phone,
        "Comments" as comments,
        "Distr_id" as distributor_id,
        "Passwd" as passwd,
        "DLM",
        "Status" as ''status'',
        "PayFormMinValue",
        "PayFormCurrentValue",
        "PayFormMaxValue",
        "DiscountMinValue",
        "DiscountCurrentValue",
        "DiscountMaxValue",
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

    from source
)
select * from renamed;');


