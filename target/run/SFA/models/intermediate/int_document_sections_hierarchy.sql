
    


    
    

    EXEC('create view "dbt"."int_document_sections_hierarchy__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__questionnaire_sections"
)

select * from source;');


