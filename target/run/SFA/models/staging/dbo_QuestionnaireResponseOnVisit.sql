
    


    
    

    EXEC('create view "dbt"."dbo_QuestionnaireResponseOnVisit__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_QuestionnaireResponseOnVisit"

),

renamed as (

    select
        country_code,
        response_id,
        visit_id,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


