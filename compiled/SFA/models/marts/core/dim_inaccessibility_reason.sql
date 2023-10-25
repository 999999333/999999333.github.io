

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
from final