
    USE [L50_SB_Vitek];
    execute('create view "sfa"."base_sap_product_now_dvt_c_hv__dbt_tmp" as
        with source as (
      select * from "L01_Stage"."sap"."product_now_dvt_c_hv"
),
renamed as (
    select
        "Product_ID",
        "Country_ID",
        "Product_Logical_ID",
        "Beverage_Company_Code",
        "Beverage_Company_Name",
        "Brand_Code",
        "Brand_Name",
        "Local_SKU_ID",
        "Local_SKU_Name",
        "Regional_SKU_Code",
        "Regional_SKU_Name",
        "Material_Type_Code",
        "Material_Type_Name",
        "Material_Group_Code",
        "Material_Group_ID",
        "Material_Group_Name",
        "Old_Product_Number",
        "Base_Unit_of_Measure_Code",
        "Base_Unit_of_Measure_ID",
        "Base_Unit_of_Measure_Name",
        "Season_Category_Code",
        "Season_Category_Name",
        "Serving_Type_Code",
        "Serving_Type_Name",
        "EAN_Code",
        "Nielsen_Code",
        "PBI_Code",
        "Package_Size_Code",
        "Package_Size_Name",
        "Package_Type_Code",
        "Package_Type_Name",
        "Case_Size_Code",
        "Case_Size_Name",
        "Flavour_Code",
        "Flavour_Name",
        "Flavour_Category_Code",
        "Flavour_Category_Name",
        "Product_Category_1_Code",
        "Product_Category_1_Name",
        "Product_Category_2_Code",
        "Product_Category_2_Name",
        "Product_Category_3_Code",
        "Product_Category_3_Name",
        "Created_On_Date",
        "Modified_On_Date",
        "_Name_ID"

    from source
)
select * from renamed
    ');

