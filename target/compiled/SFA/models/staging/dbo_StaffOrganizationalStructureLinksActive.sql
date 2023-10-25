with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_StaffOrganizationalStructureLinksActive"

),

renamed as (

    select
        country_code,
        staff_id,
        orgstructureid,
        startdate,
        enddate,
        ismain,
        dlm,
        recordnumber,
        valid_from,
        valid_to

    from source

)

select * from renamed