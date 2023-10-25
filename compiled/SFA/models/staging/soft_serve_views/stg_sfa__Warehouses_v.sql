with source as (
      select * from "DWH_Fabric"."snapshots"."warehouses_snapshot"
),
renamed as (
    select
       * 

    from source
)
select * from renamed