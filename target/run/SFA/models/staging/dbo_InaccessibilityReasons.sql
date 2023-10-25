
    


    
    

    EXEC('create view "dbt"."dbo_InaccessibilityReasons__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_InaccessibilityReasons"

),

renamed as (

    select
        country_code,
        reason_id,
        reason,
        dlm,
        status,
        ulm,
        externalcode,
        islegal,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


