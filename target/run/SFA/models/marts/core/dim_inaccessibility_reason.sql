
  
    
   

   

    
    


    
    

    EXEC('create view "dbt"."dim_inaccessibility_reason__dbt_tmp_temp_view" as 

with inaccessibility_reason as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__inaccessibility_reasons"

),

final as (
    select
        inaccessibility_reason_id,
        inaccessibility_reason_key,
        inaccessibility_reason,
        country_code,
        inaccessibility_reason_external_code,
        valid_from,
        valid_to
    from
        inaccessibility_reason
)

select *
from final;');



    
      EXEC('CREATE TABLE "dbt"."dim_inaccessibility_reason__dbt_tmp" AS (SELECT * FROM "dbt"."dim_inaccessibility_reason__dbt_tmp_temp_view");');
    

    
      
      
      

    
    

    EXEC('DROP view IF EXISTS "dbt"."dim_inaccessibility_reason__dbt_tmp_temp_view";');




  