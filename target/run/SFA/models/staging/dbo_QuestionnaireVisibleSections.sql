
    


    
    

    EXEC('create view "dbt"."dbo_QuestionnaireVisibleSections__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_QuestionnaireVisibleSections"

),

renamed as (

    select
        country_code,
        response_id,
        section_id,
        stepnumber,
        isvisible,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


