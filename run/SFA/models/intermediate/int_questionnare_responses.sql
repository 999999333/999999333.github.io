
    USE [L50_SB_Vitek];
    execute('create view "sfa"."int_questionnare_responses__dbt_tmp" as
        

with questionnaire_response as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_responses"
),

questionnare_responded_on_visit as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_responded_on_visit"

),

final as (
    select
    questionnaire_response_id
    from
    questionnare_responded_on_visit

)

select * from final
    ');

