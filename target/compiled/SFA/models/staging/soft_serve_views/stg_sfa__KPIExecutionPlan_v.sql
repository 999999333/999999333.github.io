with source as (
      select * from "DWH_Fabric"."dbt"."ps_KPIExecutionPlan_v"
),
renamed as (
    select
        *

    from source
)
select * from renamed