
    


    
    

    EXEC('create view "dbt"."stg_sfa__KPIExecutionPlan_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."ps_KPIExecutionPlan_v"
),
renamed as (
    select
        

    from source
)
select * from renamed;');


