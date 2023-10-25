with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_DocumentItems"

),

renamed as (

    select
        country_code,
        item_id,
        section_id,
        displayvalue,
        valuetype,
        controltype,
        totaltype,
        sortorder,
        ulm,
        dlm,
        status,
        usecontentcdb,
        usecontentmdb,
        responseformat,
        hasrestrictionrules,
        hasvalidationrules,
        hasmobilecontentrules,
        targetvalue,
        questionweight,
        externalcode,
        highlightincolor,
        useresponsefrompreviousquestionnaire,
        standartdocumentitemid,
        hint,
        isreadonly,
        bo_id,
        isprohibiteditingpreviousanswer,
        usepreviousvisitcontent,
        distribution,
        mdbcontentcountlimit,
        barcodescanning,
        valid_from,
        valid_to

    from source

)

select * from renamed