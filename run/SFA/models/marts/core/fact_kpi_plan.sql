
  
    
   

   

    
    


    
    

    EXEC('create view "dbt"."fact_kpi_plan__dbt_tmp_temp_view" as 

with kpi_plan as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__kpi_execution_plans_v"
),

final as (
    select
        country_code,
        -- period = format(date_to, ''yyyyMMdd''), 
        date_to,
        plan_value,
        outlet_id,
        kpi_id,
        kpi_outlet_id,
        dlm
    from kpi_plan
)

select * from final;');



    
      EXEC('CREATE TABLE "dbt"."fact_kpi_plan__dbt_tmp" AS (SELECT * FROM "dbt"."fact_kpi_plan__dbt_tmp_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "dbt"."fact_kpi_plan__dbt_tmp_temp_view";');




  