
    


    
    

    EXEC('create view "dbt"."stg_sfa__product_categories__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ProductCategory"
),
renamed as (
    select
        "Country_Code",
        "ProdCategory_ID",
        "ProdCategoryName",
        "ProdCategoryShortName",
        "SortOrder",
        "DLM",
        "Status",
        "ULM",
        "IsConcurrent",
        "ProdCategoryCode",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed;');


