with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_DocumentSections"

),

renamed as (

    select
        country_code,
        section_id,
        parentsection_id,
        document_id,
        name,
        sortorder,
        groupingtype,
        bo_id,
        ulm,
        dlm,
        status,
        level,
        externalcode,
        randomquestionsnumber,
        hreport_id,
        iscallbutton,
        enablecopy,
        isphotoreport,
        shootingangle,
        valid_from,
        valid_to

    from source

)

select * from renamed