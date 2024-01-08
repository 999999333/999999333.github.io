

with inaccessibility_reason as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__visit_inaccessibility_reasons"

),

final as (
    select



        ----------  ids
        inaccessibility_reason_id,
        inaccessibility_reason_external_code,

        country_id,
        country_code,

        ----------  strings
        inaccessibility_reason

        ----------  numerics

        ----------  booleans

        ----------  timestamps
    
        ----------  omited


    from
        inaccessibility_reason
    where
        dbt_valid_to >= cast('2299-12-31' as datetime2)
)

select *
from final