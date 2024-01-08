
    USE [L50_SB_Vitek];
    execute('create view "sfa"."int_document_sections_hierarchy__dbt_tmp" as
        with source as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_sections"
)

select * from source
    ');

