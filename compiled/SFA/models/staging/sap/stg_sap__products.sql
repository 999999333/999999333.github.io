with source as (
      select * from "L01_Stage"."sap"."product_now_dvt_c_hv"
),
renamed as (
    select
        "Product_ID" as product_id,
        "Local_SKU_ID" as local_sku_id,
        "Material_Type_Code" as material_type_code

    from source
)
select * from renamed