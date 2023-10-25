with source as (

    select * from "SFA_Warehouse"."dbt"."ps_KPIExecutionPlan"

),

renamed as (

    select
        country_code,
        kpiid,
        datefrom,
        dateto,
        ol_id,
        planvalue,
        dlm,
        status,
        valid_from,
        valid_to

    from source

)

select * from renamed