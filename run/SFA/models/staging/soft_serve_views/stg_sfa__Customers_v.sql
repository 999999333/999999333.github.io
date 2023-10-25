
    


    
    

    EXEC('create view "dbt"."stg_sfa__Customers_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_Customers_v"
),
renamed as (
    select
        "Country_Code",
        "Cust_Id",
        "Cust_NAME",
        "Cust_TradingName",
        "ZKPO",
        "MFO",
        "Bank_Account",
        "TAX_Number",
        "VAT_Number",
        "Cust_Address",
        "Cust_TradingAddress",
        "Bank_Name",
        "DIRECTOR",
        "City_Id",
        "Email",
        "Phone",
        "TradingPhone",
        "Comments",
        "Distr_id",
        "Passwd",
        "DLM",
        "Status",
        "PayFormMinValue",
        "PayFormCurrentValue",
        "PayFormMaxValue",
        "DiscountMinValue",
        "DiscountCurrentValue",
        "DiscountMaxValue",
        "LastSyncDateTime",
        "RenewSupervisorPasswd",
        "RenewAdminPasswd",
        "ULM",
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
        "OL_id",
        "GeographyID",
        "Is2LevelMode",
        "WarehouseBaseID",
        "ExternalCode",
        "DB_ID",
        "IsInExchangeEquipment"

    from source
)
select * from renamed;');


