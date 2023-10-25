
  
    
   

   

    
    


    
    

    EXEC('create view "dbt"."fct_visit__dbt_tmp_temp_view" as 

with inaccessibility_reason as (
    select * from "DWH_Fabric"."dbt"."dim_inaccessibility_reasons"

),

visit as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__visits"

),

final as (
    select
        visit.visit_id,
        inaccessibility_reason.inaccessibility_reason

    from
        visit
        left join inaccessibility_reason
            on visit.inaccessibility_reason_key = inaccessibility_reason.inaccessibility_reason_key

)

select * from final;');



    
      EXEC('CREATE TABLE "dbt"."fct_visit__dbt_tmp" AS (SELECT * FROM "dbt"."fct_visit__dbt_tmp_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "dbt"."fct_visit__dbt_tmp_temp_view";');




  