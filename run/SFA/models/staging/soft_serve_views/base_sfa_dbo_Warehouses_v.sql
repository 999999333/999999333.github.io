
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_Warehouses_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_Warehouses_v"
),
renamed as (
    select
        

    from source
)
select * from renamed;');


