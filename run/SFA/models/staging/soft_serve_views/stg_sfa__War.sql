
    


    
    

    EXEC('create view "dbt"."stg_sfa__War__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."snapshots"."warehouses_snapshot"
),
renamed as (
    select
       dbt_valid_from,
       dbt_scd_id

    from source
)
select * from renamed;');


