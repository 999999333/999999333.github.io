
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."questionnaire_report__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."questionnaire_report__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."questionnaire_report__dbt_tmp_temp_view" as
    

with response as (
    select * from "L50_SB_Vitek"."sfa"."fact_questionnaire_responses"
),

question as (
    select * from "L50_SB_Vitek"."sfa"."dim_questions"
),

visit as (
    select * from "L50_SB_Vitek"."sfa"."fact_visit"
),

final as (
    select 
    response.visit_id,
    
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(response.visit_id as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(question.section as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as visit_question_id,
    response.questionnaire_answer,
    visit.visit_date,
    response.visit_key,
    response.country_id,
    response.questionnaire_answer_step,
    question.questionnaire,
    question.section,
    question.question

    from response
    left join question
    on response.question_id = question.question_id
    left join visit
    on response.visit_id = visit.visit_id

    


)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."questionnaire_report__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."questionnaire_report__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."questionnaire_report__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."questionnaire_report__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_questionnaire_report__dbt_tmp_cci'
        AND object_id=object_id('sfa_questionnaire_report__dbt_tmp')
    )
  DROP index "sfa"."questionnaire_report__dbt_tmp".sfa_questionnaire_report__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_questionnaire_report__dbt_tmp_cci
    ON "sfa"."questionnaire_report__dbt_tmp"

  