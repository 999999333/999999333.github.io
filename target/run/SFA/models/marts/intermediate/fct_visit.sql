
  
    
   

   

    
    


    
    

    EXEC('create view "dbt"."fct_visit__dbt_tmp_temp_view" as 

with inaccessibility_reason as (
    select * from "DWH_Fabric"."dbt"."dim_inaccessibility_reasons"

),

visit_gps as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__visit_gps"
),

visit as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__visits"

),

final as (
    select
        visit.visit_id,
        visit.visit_key,
        visit_gps.visit_start_longtitude,
        visit_gps.visit_start_latitude,
        inaccessibility_reason.inaccessibility_reason_id

    from
        visit
        left join inaccessibility_reason
            on visit.inaccessibility_reason_key = inaccessibility_reason.inaccessibility_reason_key
                and
                visit.country_id = inaccessibility_reason.country_id
                and
                visit.visit_date between inaccessibility_reason.valid_from and inaccessibility_reason.valid_to
        left join visit_gps
            on visit.visit_key = visit_gps.visit_key
                and
                visit.country_id = visit_gps.country_id
                and
                visit.visit_date between visit_gps.valid_from and visit_gps.valid_to
)

select * from final;');



    
      EXEC('CREATE TABLE "dbt"."fct_visit__dbt_tmp" AS (SELECT * FROM "dbt"."fct_visit__dbt_tmp_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "dbt"."fct_visit__dbt_tmp_temp_view";');




  