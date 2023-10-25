

with inaccessibility_reason as (
    select * from "DWH_Fabric"."dbt"."dim_inaccessibility_reasons"

),

visit as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__visits"

),

final as (
    select
        visit.visit_id,
        inaccessibility_reason.inaccessibility_reason

    from
        visit
        left join inaccessibility_reason
            on visit.inaccessibility_reason_key = inaccessibility_reason.inaccessibility_reason_key

)

select * from final