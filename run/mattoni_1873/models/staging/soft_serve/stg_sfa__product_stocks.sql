
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__product_stocks__dbt_tmp" as
        with source as (
    select * from "L01_Stage"."sfa"."dbo_ProductStocks"
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
    ');

