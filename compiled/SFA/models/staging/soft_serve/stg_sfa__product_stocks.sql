with source as (
    select * from "DWH_Fabric"."dbt"."dbo_ProductStocks"
),

renamed as (
    select
        "Country_Code",
        "W_id",
        "Product_id",
        "Stock",
        "Required",
        "DLM",
        "StockEditAdd",
        "StockEditTotal",
        "Valid_From",
        "Valid_To"

    from source
)

select * from renamed