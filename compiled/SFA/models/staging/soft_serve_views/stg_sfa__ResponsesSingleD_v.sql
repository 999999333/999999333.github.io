with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ResponsesSingleD_v"
),
renamed as (
    select
        *

    from source
)
select * from renamed