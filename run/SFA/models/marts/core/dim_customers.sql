
  
    
   

   

    
    


    
    

    EXEC('create view "dbt"."dim_customers__dbt_tmp_temp_view" as 

with customer as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__customers"
),

final as (

    select
        ----------  ids
        customer_id,
        outlet_external_code,
        country_id,
        country_code,

        ----------  strings
        customer_name,
        customer_trading_name,
        customer_adress,
        comments,
        password

        ----------  numerics

        ----------  booleans

        ----------  timestamps   

        ----------  omited

    from customer
    
    where
        dbt_valid_to >= cast(''2299-12-31'' as datetime2)
)

select * from final;');



    
      EXEC('CREATE TABLE "dbt"."dim_customers__dbt_tmp" AS (SELECT * FROM "dbt"."dim_customers__dbt_tmp_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "dbt"."dim_customers__dbt_tmp_temp_view";');




  