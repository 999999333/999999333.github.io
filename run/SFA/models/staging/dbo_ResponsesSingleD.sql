
    


    
    

    EXEC('create view "dbt"."dbo_ResponsesSingleD__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_ResponsesSingleD"

),

renamed as (

    select
        country_code,
        response_id,
        item_id,
        responsevalue,
        externalcode,
        responsevalueid,
        stepnumber,
        scanmethod,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


