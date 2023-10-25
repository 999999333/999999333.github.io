
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_ProductStocks_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ProductStocks_v"
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
        "StockEditTotal"

    from source
)
select * from renamed;');


