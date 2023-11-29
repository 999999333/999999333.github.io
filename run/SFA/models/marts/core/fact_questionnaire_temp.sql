
    


    
    

    EXEC('create view "dbt"."fact_questionnaire_temp__dbt_tmp" as with responded_on_visit as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__questionnaire_responded_on_visit"
),

response_text as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__questionnaire_response_texts"
),

response_image as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__questionnaire_response_images"
),

final as (
    select
        responded_on_visit.visit_id,
        responded_on_visit.visit_key,
        responded_on_visit.questionnaire_response_id,
        responded_on_visit.questionnaire_response_key,
        responded_on_visit.country_id,

        coalesce(response_text.question_id, response_image.question_id) as question_id,
        response_text.questionnaire_answer,
        response_text.questionnaire_answer_external_code,

        response_image.sfa_file_id as image_id,
        coalesce(
            response_image.sfa_file_id,
            
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(questionnaire_answer_step as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(response_text.question_id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(responded_on_visit.questionnaire_response_id as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))

            )  as sfa_file_id,
        response_image.question_id as image_question_id
    from
    responded_on_visit
    left join response_text
    on responded_on_visit.questionnaire_response_id = response_text.questionnaire_response_id

    left join response_image
    on responded_on_visit.questionnaire_response_id = response_image.questionnaire_response_id
)


select * from final;');


