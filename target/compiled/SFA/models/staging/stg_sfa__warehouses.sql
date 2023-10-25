with source as (
    select * from "DWH_Fabric"."dbt"."dbo_Warehouses"
),

renamed as (
    select
        "Country_Code",
        "W_id" as warehouse_id,
        "W_ExternalCode" as warehouse_external_code,
        "WType_id" as warehouse_type_id,
        "Cust_id" as customer_id,
        "W_LongName" as long_name,
        "W_ShortName" as short_name,
        "StockAccounting",
        "StockManagement",
        "StockOrder",
        "DeliveryDelay",
        "LotAccounting",
        "Status",
        "ULM",
        "DLM",
        "StockNegative",
        "Priority",
        "Address",
        "StartingStockDate",
        "CountHolidaysForDelivery",
        "Email" as warehouse_email,
        "Valid_From" as valid_from,
        "Valid_To" as valid_to

    from source
)

select * from renamed