with responded_on_visit as (
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
        responded_on_visit.questionnaire_response_id,
        responded_on_visit.country_id,

        coalesce(response_text.question_id, response_image.question_id) as question_id,
        response_text.questionnaire_answer,
        response_text.questionnaire_answer_external_code,

        response_image.sfa_file_id,
        response_image.question_id as image_question_id
    from
    responded_on_visit
    left join response_text
    on responded_on_visit.questionnaire_response_id = response_text.questionnaire_response_id

    full outer join response_image
    on responded_on_visit.questionnaire_response_id = response_image.questionnaire_response_id
    and (response_text.question_id = response_image.question_id OR (response_text.question_id is null and response_image.question_id is not null))
)


select * from final