with source as (
      select * from "L30_DM_Sales"."pbi"."dim_Product"
),
renamed as (
    select
        "Product_Id",
        "SKU_Code",
        "SKU_Label",
        "Product_Planning_Base_Id",
        "Product_Planning_Base_Label",
        "Product_Planning_Base_Code",
        "Product_Planning_Base_Order",
        "Segment",
        "Brand_Segment",
        "Category",
        "Category_Order",
        "Subcategory",
        "Subcategory_Order",
        "Contract_Portfolio",
        "Brand_Owner",
        "Brand",
        "Brand_Order",
        "Brand_Full",
        "Brand_Plan",
        "Brand_Plan_Order",
        "SubBrand",
        "SubBrand_Order",
        "BrandLine",
        "Flavour_Name",
        "Format",
        "Format_Order",
        "Size_Format",
        "Case_Size_Name",
        "Package_Format",
        "Package_Size_Name",
        "Package_Size",
        "Package_Size_Unit",
        "Sugar"

    from source
)
select * from renamed