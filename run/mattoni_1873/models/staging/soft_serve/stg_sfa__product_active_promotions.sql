
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__product_active_promotions__dbt_tmp" as
        with source as (
      select * from "L01_Stage"."sfa"."dbo_ProductPromotionActive"
),
renamed as (
    select
        "Country_Code",
        "Product_Id",
        "ComponentId",
        "DLM",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed
    ');

