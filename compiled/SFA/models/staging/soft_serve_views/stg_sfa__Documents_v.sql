with source as (
      select * from "DWH_Fabric"."dbt"."dbo_Documents_v"
),
renamed as (
    select
        *
    from source
)
select * from renamed