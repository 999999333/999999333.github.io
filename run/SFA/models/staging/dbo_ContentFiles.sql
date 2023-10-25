
    


    
    

    EXEC('create view "dbt"."dbo_ContentFiles__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_ContentFiles"

),

renamed as (

    select
        country_code,
        contentfileid,
        contentid,
        contentfilename,
        contentfileuniquename,
        hash,
        status,
        dlm,
        ulm,
        comment,
        phototypeid,
        size,
        activity_id,
        creationdate,
        isedited,
        receivingresultdate,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


