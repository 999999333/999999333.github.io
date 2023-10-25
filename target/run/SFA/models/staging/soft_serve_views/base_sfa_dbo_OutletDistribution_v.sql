
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_OutletDistribution_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OutletDistribution_v"
),
renamed as (
    select
        "Country_Code",
        "OLCard_ID",
        "Product_id",
        "IsPresent",
        "Price",
        "IsSetup",
        "OutOfStockReason"

    from source
)
select * from renamed;');


