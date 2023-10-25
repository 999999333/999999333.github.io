
    


    
    

    EXEC('create view "dbt"."dbo_OutletCardSteps__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_OutletCardSteps"

),

renamed as (

    select
        country_code,
        olcard_id,
        step_no,
        step_id,
        step_detail,
        step_begin_datetime,
        step_end_datetime,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


