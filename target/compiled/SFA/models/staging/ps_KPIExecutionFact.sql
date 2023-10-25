with source as (

    select * from "SFA_Warehouse"."dbt"."ps_KPIExecutionFact"

),

renamed as (

    select
        country_code,
        kpiid,
        versionid,
        olcard_id,
        date,
        ol_id,
        orgstructureid,
        fact,
        dlm,
        status,
        valid_from,
        valid_to

    from source

)

select * from renamed