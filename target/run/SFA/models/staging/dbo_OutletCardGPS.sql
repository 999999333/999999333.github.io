
    


    
    

    EXEC('create view "dbt"."dbo_OutletCardGPS__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_OutletCardGPS"

),

renamed as (

    select
        country_code,
        olcard_id,
        latitude,
        longitude,
        dlm,
        finishlatitude,
        finishlongitude,
        isfake,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


