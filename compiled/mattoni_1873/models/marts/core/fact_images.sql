

with sfa_file as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__files_v"
),

response_image as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_response_images_v"
),

responded_on_visit as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_responded_on_visit"
),

question as (
    select * from "L50_SB_Vitek"."sfa"."dim_questions"
),

final as (
    select 



        ----------  ids
        
    lower(convert(varchar(50), hashbytes('md5', coalesce(convert(varchar(max), concat(coalesce(cast(responded_on_visit.visit_id as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'), '-', coalesce(cast(question.section as VARCHAR(MAX)), '_dbt_utils_surrogate_key_null_'))), '')), 2))
 as visit_question_id,
        sfa_file.sfa_file_id,
        responded_on_visit.visit_id,
        responded_on_visit.visit_key,
        response_image.question_id,

        sfa_file.country_id,
        sfa_file.country_code,

        ----------  strings
        sfa_file.sfa_file_name_unique,
        sfa_file.content_file_key,
        sfa_file.comment,

        case
            when sfa_file.country_code = 'CZ' then
                concat('https://mattonicz.softservebs.com/swimages/r.im?t=tblOutletCardStartEndImages&v=', sfa_file.content_file_key)
            when sfa_file.country_code = 'HU' then
                concat('https://mattonihu.softservebs.com/swimages/r.im?t=tblOutletCardStartEndImages&v=', sfa_file.content_file_key)
            when sfa_file.country_code = 'SK' then
                concat('https://mattonisk.softservebs.com/swimages/r.im?t=tblOutletCardStartEndImages&v=', sfa_file.content_file_key)
            else
                NULL
        end as image_url,

        ----------  numerics

        ----------  booleans
        sfa_file.is_edited

        ----------  timestamps
    
        ----------  omited
        

    from 
    response_image
    left join sfa_file
    on response_image.sfa_file_id = sfa_file.sfa_file_id

    left join responded_on_visit
    on response_image.questionnaire_response_id = responded_on_visit.questionnaire_response_id

    left join question
    on response_image.question_id = question.question_id
)

select * from final