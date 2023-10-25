
    


    
    

    EXEC('create view "dbt"."dbo_OrganizationalStructure__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_OrganizationalStructure"

),

renamed as (

    select
        country_code,
        orgstructureid,
        parentid,
        orgstructurecode,
        name,
        email,
        at_id,
        level,
        orgstructureoldid,
        status,
        dlm,
        ulm,
        taxcode,
        phonenumber,
        nodeid,
        treenodehierarchy,
        stafftype_id,
        fullname,
        additionalfulltextsearch,
        resetpassword,
        officeid,
        businessrole,
        childorgstructuretousertypelinkrequired,
        childorgstructuretoactivitytypelinkrequired,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


