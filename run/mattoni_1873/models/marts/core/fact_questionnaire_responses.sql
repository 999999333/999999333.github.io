
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."fact_questionnaire_responses__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."fact_questionnaire_responses__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."fact_questionnaire_responses__dbt_tmp_temp_view" as
    

with responded_on_visit as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_responded_on_visit"
),

response_text as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_response_texts"
),

response_image as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_response_images"
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
        response_text.questionnaire_answer_step,

        response_image.sfa_file_id as image_id,
        coalesce(
            response_image.sfa_file_id,
            
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(questionnaire_answer_step as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(response_text.question_id as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(responded_on_visit.questionnaire_response_id as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))

            )  as sfa_file_id,
        response_image.question_id as image_question_id
    from
    responded_on_visit
    left join response_text
    on responded_on_visit.questionnaire_response_id = response_text.questionnaire_response_id

    left join response_image
    on responded_on_visit.questionnaire_response_id = response_image.questionnaire_response_id
    and (response_text.question_id = response_image.question_id OR (response_text.question_id is null and response_image.question_id is not null))
)


select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."fact_questionnaire_responses__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."fact_questionnaire_responses__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."fact_questionnaire_responses__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."fact_questionnaire_responses__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_fact_questionnaire_responses__dbt_tmp_cci'
        AND object_id=object_id('sfa_fact_questionnaire_responses__dbt_tmp')
    )
  DROP index "sfa"."fact_questionnaire_responses__dbt_tmp".sfa_fact_questionnaire_responses__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_fact_questionnaire_responses__dbt_tmp_cci
    ON "sfa"."fact_questionnaire_responses__dbt_tmp"

  