
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_ProductPromotionActive__dbt_tmp" as with source as (
      select * from "SFA_Warehouse"."sfa"."dbo_ProductPromotionActive"
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
select * from renamed;');


