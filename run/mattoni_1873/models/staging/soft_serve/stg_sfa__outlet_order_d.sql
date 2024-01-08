
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__outlet_order_d__dbt_tmp" as
        with source as (
      select * from "L01_Stage"."sfa"."dbo_OutletOrderD"
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
select * from renamed
    ');

