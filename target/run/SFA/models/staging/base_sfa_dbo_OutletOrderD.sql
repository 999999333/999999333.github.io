
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_OutletOrderD__dbt_tmp" as with source as (
      select * from "SFA_Warehouse"."sfa"."dbo_OutletOrderD"
),
renamed as (
    select
        "Country_Code",
        "OrderNo",
        "Product_id",
        "Price",
        "Product_qty",
        "Discount",
        "IsReturnable",
        "VAT",
        "Recommend_qty",
        "BasePrice",
        "ConsumerUnitId",
        "InitialProductId",
        "PromoActivities_ID",
        "ReturnReasonId",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed;');


