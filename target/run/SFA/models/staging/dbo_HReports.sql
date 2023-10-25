
    


    
    

    EXEC('create view "dbt"."dbo_HReports__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_HReports"

),

renamed as (

    select
        country_code,
        hreport_id,
        name,
        comment,
        dlm,
        status,
        ulm,
        isprintform,
        isrecalculated,
        segment,
        reporttype,
        storedproctext,
        depthcalculation,
        reportscript,
        iswebpage,
        url,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


