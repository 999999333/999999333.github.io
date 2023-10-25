
    


    
    

    EXEC('create view "dbt"."dbo_DocumentRuleParams__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_DocumentRuleParams"

),

renamed as (

    select
        country_code,
        param_id,
        rule_id,
        validationitem_id,
        tablerow_id,
        displayvalue,
        validationvalue,
        replacementtype,
        sortorder,
        paramoperation,
        ulm,
        dlm,
        status,
        displayvalueid,
        validationvalueid,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


