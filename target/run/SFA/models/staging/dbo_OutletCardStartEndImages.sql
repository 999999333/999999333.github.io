
    


    
    

    EXEC('create view "dbt"."dbo_OutletCardStartEndImages__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_OutletCardStartEndImages"

),

renamed as (

    select
        country_code,
        olcard_id,
        imageid,
        imagename,
        image,
        isstartimage,
        dlm,
        phototypeid,
        comment,
        ischecked,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


