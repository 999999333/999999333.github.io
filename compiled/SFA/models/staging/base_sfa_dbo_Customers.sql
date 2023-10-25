

WITH source AS (

    SELECT
        *
    FROM
        "DWH_Fabric"."dbt"."dbo_Customers"
),
renamed AS (
    SELECT
        
case
  when Country_Code = 'CZ' then 422
  when Country_Code = 'SK' then 423
  when Country_Code = 'HU' then 424
  when Country_Code is null then -1
  else -2
end
 AS country_code,
        -- "Country_Code" as country_code,
        CAST("Cust_Id" AS INT) AS customer_id,
        "Cust_NAME" AS customer_name,
        "Cust_TradingName" AS customer_trading_name,
        "ZKPO" AS zkpo,
        "MFO" AS mfo,
        "Bank_Account" AS bank_account,
        "TAX_Number",
        "VAT_Number",
        "Cust_Address" AS customer_adress,
        "Cust_TradingAddress" AS customer_trading_address,
        "Bank_Name" AS bank_name,
        "DIRECTOR" AS director,
        CAST("City_Id" AS INT) AS city_id,
        "Email" AS email,
        "Phone" AS phone,
        "TradingPhone" AS trading_phone,
        "Comments" AS comments,
        CAST("Distr_id" AS INT) AS distributor_id,
        "Passwd" AS passwd,
        "DLM",
        "Status" AS status,
        CAST("PayFormMinValue" AS INT),
        CAST("PayFormCurrentValue" AS INT),
        CAST("PayFormMaxValue" AS INT),
        CAST("DiscountMinValue" AS INT),
        CAST("DiscountCurrentValue" AS INT),
        CAST("DiscountMaxValue" AS INT),
        "LastSyncDateTime",
        "RenewSupervisorPasswd",
        "RenewAdminPasswd",
        "ULM" AS ulm,
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
        "OL_id" AS outlet_id,
        "GeographyID" AS geography_id,
        "Is2LevelMode",
        "WarehouseBaseID",
        "ExternalCode",
        "DB_ID" AS database_id,
        "IsInExchangeEquipment",
        "Valid_From",
        "Valid_To"
    FROM
        source
)
SELECT
    *
FROM
    renamed