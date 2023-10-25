
    


    
    

    EXEC('create view "dbt"."ps_KPI__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."ps_KPI"

),

renamed as (

    select
        country_code,
        kpiid,
        parentid,
        activitytype,
        name,
        comment,
        externalcode,
        type,
        level,
        status,
        dlm,
        ulm,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


