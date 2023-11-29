
  
    
   

   

    
    


    
    

    EXEC('create view "dbt"."dim_products__dbt_tmp_temp_view" as 


with product as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__products_v"
),

final as (
    select
        product_id,
        product_type_id,
        product_sap_code,
        product_name,
        product_name_short,
        unit_weight,
        package_quantity,
        ean_code,
        status,
        is_pos_material

    from
        product
)

select * from final;');



    
      EXEC('CREATE TABLE "dbt"."dim_products__dbt_tmp" AS (SELECT * FROM "dbt"."dim_products__dbt_tmp_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "dbt"."dim_products__dbt_tmp_temp_view";');




  