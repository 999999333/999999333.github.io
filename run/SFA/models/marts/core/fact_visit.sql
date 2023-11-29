
      
  
    
   

   

    
    


    
    

    EXEC('create view "dbt"."fact_visit_temp_view" as 

with visit as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__visits"
),

final as (
    select 
        ----------  ids
        visit_id,
        visit_key,
        country_id,
        country_code,
        inaccessibility_reason_id,
        outlet_id,
        route_id,
        organizational_structure_id,
        customer_id,

        ----------  strings
        visit_comment,

        ----------  numerics
        visit_start_distance,
        visit_end_distance,
        visit_duration_sec,

        ----------  booleans
        is_quick_order,

        ----------  timestamps
        visit_date,
        visit_start_time,
        visit_end_time
    

    from visit

    where

    

    dbt_valid_to >= cast(''2299-12-31'' as datetime2)

)

select * from final;');



    
      EXEC('CREATE TABLE "dbt"."fact_visit" AS (SELECT * FROM "dbt"."fact_visit_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "dbt"."fact_visit_temp_view";');




  
  