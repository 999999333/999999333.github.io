
    


    
    

    EXEC('create view "dbt"."dbo_Staff__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_Staff"

),

renamed as (

    select
        country_code,
        staff_id,
        staff_code,
        geographyid,
        name,
        lname,
        fname,
        sname,
        birthdate,
        location,
        dept,
        position,
        comment,
        email,
        stafftype_id,
        status,
        dlm,
        ulm,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


