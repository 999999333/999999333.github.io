
  
    
   

   

    
    


    
    

    EXEC('create view "dbt"."dim_visit_gps__dbt_tmp_temp_view" as 

with visit_gps as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__visit_gps"
),

final as (
    select
        visit_id,
        visit_key,
        country_id,
        country_code,
        visit_start_latitude,
        visit_start_longtitude,
        visit_finish_latitude,
        visit_finish_longtitude,
        is_fake_gps,
        dlm

    from
        visit_gps
)

select * from final;');



    
      EXEC('CREATE TABLE "dbt"."dim_visit_gps__dbt_tmp" AS (SELECT * FROM "dbt"."dim_visit_gps__dbt_tmp_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "dbt"."dim_visit_gps__dbt_tmp_temp_view";');




  