with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_Documents"

),

renamed as (

    select
        country_code,
        document_id,
        name,
        details,
        ulm,
        dlm,
        status,
        usecontentcdb,
        usecontentmdb,
        externalcode,
        passscore,
        highlightcolor,
        standartdocumentitemid,
        documentclassificationid,
        displaylastresponsedate,
        documentlinkstandartdocumentitemid,
        promoactivities_id,
        clearprefilledresponses,
        activityid,
        resetprefieldresponses,
        valid_from,
        valid_to

    from source

)

select * from renamed