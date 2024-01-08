
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_questions__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_questions__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."dim_questions__dbt_tmp_temp_view" as
    

with questionnaire_base as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaires"

),

questionnaire as (

   



    

    

    

    

    



select
    questionnaire_base.questionnaire_id, questionnaire_base.questionnaire_external_code, questionnaire_base.questionnaire_details, questionnaire_base.questionnaire_name, questionnaire_base.questionnaire_status
from [questionnaire_base]

left join [questionnaire_base] as table2
on [questionnaire_base].[questionnaire_id] = table2.[questionnaire_id]
and [questionnaire_base].dbt_valid_to < table2.dbt_valid_to

where table2.[questionnaire_id] is null


   
),

questionnaire_section_base as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_sections"

),

questionnaire_section as (

   



    

    

    

    

    



select
    questionnaire_section_base.questionnaire_section_id, questionnaire_section_base.questionnaire_section_external_code, questionnaire_section_base.questionnaire_section_name, questionnaire_section_base.questionnaire_section_status, questionnaire_section_base.questionnaire_id
from [questionnaire_section_base]

left join [questionnaire_section_base] as table2
on [questionnaire_section_base].[questionnaire_section_id] = table2.[questionnaire_section_id]
and [questionnaire_section_base].dbt_valid_to < table2.dbt_valid_to

where table2.[questionnaire_section_id] is null


),        

questionnaire_item_base as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_items"

),

questionnaire_item as (
    



    

    

    

    

    

    

    

    

    

    

    



select
    questionnaire_item_base.questionnaire_question_id, questionnaire_item_base.questionnaire_section_id, questionnaire_item_base.country_id, questionnaire_item_base.country_code, questionnaire_item_base.questionnaire_question_external_code, questionnaire_item_base.questionnaire_question, questionnaire_item_base.questionnaire_question_status, questionnaire_item_base.questionnaire_question_sort_order, questionnaire_item_base.questionnaire_question_weight, questionnaire_item_base.questionnaire_question_is_read_only, questionnaire_item_base.questionnaire_question_is_distribution
from [questionnaire_item_base]

left join [questionnaire_item_base] as table2
on [questionnaire_item_base].[questionnaire_question_id] = table2.[questionnaire_question_id]
and [questionnaire_item_base].dbt_valid_to < table2.dbt_valid_to

where table2.[questionnaire_question_id] is null


),

final as (
    select
        ----------  ids
        questionnaire_item.questionnaire_question_id as question_id,
        questionnaire_item.country_id as country_id,
        questionnaire_item.country_code as country_code,

        ----------  strings
        questionnaire.questionnaire_external_code as questionnaire_external_code,
        questionnaire_section.questionnaire_section_external_code as section_external_code,
        questionnaire_item.questionnaire_question_external_code as question_external_code,

        questionnaire.questionnaire_details as questionnaire_details,


        case
            when questionnaire.questionnaire_name like N''1 Druhotné vystavenie%''
            then N''1 Druhotné vystavenie''
            when questionnaire.questionnaire_name like N''2. Druhotné vystavení pro TT%''
            then N''2. Druhotné vystavení pro TT''
            when questionnaire.questionnaire_name like N''2. Druhotné vystavení pro MT%''
            then N''2. Druhotné vystavení pro MT''
            when questionnaire.questionnaire_name like ''2. On-top%''
            then ''2. On-top''
            when questionnaire.questionnaire_name like N''2. Pillér form MT%''
            then N''2. Pillér form MT''
            when questionnaire.questionnaire_name like N''2. Pillér form SF%''
            then N''2. Pillér form SF''
            when questionnaire.questionnaire_name like ''6. On-Top MT%''
            then ''6. On-Top MT''
            when questionnaire.questionnaire_name like ''6. On-Top TT%''
            then ''6. On-Top TT''
            else questionnaire.questionnaire_name
            
        end as questionnaire,

        questionnaire_section.questionnaire_section_name as section,
        questionnaire_item.questionnaire_question as question,

        ----------  numerics
        questionnaire.questionnaire_status as questionnaire_status,
        questionnaire_section.questionnaire_section_status as section_status,
        questionnaire_item.questionnaire_question_status as question_status,

        questionnaire_item.questionnaire_question_sort_order as question_sort_order,
        questionnaire_item.questionnaire_question_weight as weight,

        ----------  booleans
        questionnaire_item.questionnaire_question_is_read_only as is_read_only,
        questionnaire_item.questionnaire_question_is_distribution as is_distibution

        ----------  timestamps

        ----------  omited


    from questionnaire_item
    
    left join questionnaire_section
    on questionnaire_item.questionnaire_section_id = questionnaire_section.questionnaire_section_id

    left join questionnaire
    on questionnaire_section.questionnaire_id = questionnaire.questionnaire_id
)


--  -- questionnaire_item as (
--  --     select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_items"
--  -- 
--  -- ),
--  -- 
--  final as (
--      select 
--   
--      from questionnaire
--      
--      left join questionnaire_section
--      on questionnaire.questionnaire_id = questionnaire_section.questionnaire_id
--  
--  )

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."dim_questions__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."dim_questions__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_questions__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_questions__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_dim_questions__dbt_tmp_cci'
        AND object_id=object_id('sfa_dim_questions__dbt_tmp')
    )
  DROP index "sfa"."dim_questions__dbt_tmp".sfa_dim_questions__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_dim_questions__dbt_tmp_cci
    ON "sfa"."dim_questions__dbt_tmp"

  