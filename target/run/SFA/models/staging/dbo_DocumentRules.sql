
    


    
    

    EXEC('create view "dbt"."dbo_DocumentRules__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_DocumentRules"

),

renamed as (

    select
        country_code,
        rule_id,
        type,
        object_id,
        rulename,
        ruleoperation,
        sortorder,
        ulm,
        dlm,
        status,
        externalcode,
        standartdocumentitemid,
        cycleitem,
        allowbreakcycle,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


