
    


    
    

    EXEC('create view "dbt"."base_sfa_ps_KPI_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."ps_KPI_v"
),
renamed as (
    select
        

    from source
)
select * from renamed;');


