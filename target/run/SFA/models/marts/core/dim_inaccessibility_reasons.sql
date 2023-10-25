
  
    
   

   

    
    


    
    

    EXEC('create view "dbt"."dim_inaccessibility_reasons__dbt_tmp_temp_view" as 

with inaccessibility_reason as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__visit_inaccessibility_reasons"

),

final as (
    select
        dbt_scd_id as inaccessibility_reason_id,
        inaccessibility_reason,
        country_id,
        country_code,
        inaccessibility_reason_external_code,
        dbt_valid_from,
        dbt_valid_to
    from
        inaccessibility_reason
)

select *
from final;');



    
      EXEC('CREATE TABLE "dbt"."dim_inaccessibility_reasons__dbt_tmp" AS (SELECT * FROM "dbt"."dim_inaccessibility_reasons__dbt_tmp_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "dbt"."dim_inaccessibility_reasons__dbt_tmp_temp_view";');




  