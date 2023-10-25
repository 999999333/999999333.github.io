
    


    
    

    EXEC('create view "dbt"."dbo_ResponsesSingleContentD__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_ResponsesSingleContentD"

),

renamed as (

    select
        country_code,
        response_id,
        object_id,
        stepnumber,
        contentid,
        entitytypeid,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


