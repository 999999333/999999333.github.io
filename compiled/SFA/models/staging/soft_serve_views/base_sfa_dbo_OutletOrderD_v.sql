with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OutletOrderD_v"
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
        "ReturnReasonId"

    from source
)
select * from renamed