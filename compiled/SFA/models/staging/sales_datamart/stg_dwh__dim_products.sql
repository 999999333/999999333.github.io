with source as (
      select * from "L30_DM_Sales"."pbi"."dim_Product"
),
renamed as (
    select
        "Product_Id" as product_id,
        "SKU_Code" as sku_code

    from source
)
select * from renamed