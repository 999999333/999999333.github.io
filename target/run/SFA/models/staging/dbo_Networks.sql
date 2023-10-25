
    


    
    

    EXEC('create view "dbt"."dbo_Networks__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_Networks"

),

renamed as (

    select
        country_code,
        network_id,
        network_name,
        notes,
        dlm,
        status,
        ulm,
        appliestoallcities,
        networktype_id,
        networkcode,
        juridicalname,
        juridicaladdress,
        grdcode,
        networklevel,
        orgstructureid,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


