
    


    
    

    EXEC('create view "dbt"."dbo_OrganizationalStructureGeographyLinksActive__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_OrganizationalStructureGeographyLinksActive"

),

renamed as (

    select
        country_code,
        orgstructureid,
        geographyid,
        dlm,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


