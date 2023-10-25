
    


    
    

    EXEC('create view "dbt"."dbo_ResponsesH__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_ResponsesH"

),

renamed as (

    select
        country_code,
        response_id,
        document_id,
        dlm,
        status,
        isprocessed,
        sourceresponse_id,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


