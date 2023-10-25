
    


    
    

    EXEC('create view "dbt"."stg_sfa__Warehouses_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."snapshots"."warehouses_snapshot"
),
renamed as (
    select
       * 

    from source
)
select * from renamed;');


