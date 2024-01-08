
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_images__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_images__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."dim_images__dbt_tmp_temp_view" as
    

with sfa_file as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__files_v"
),

response_image as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__questionnaire_response_images_v"
),

first_image as (
    select
    questionnaire_response_id,
    sfa_file_id,
    image_id
    from (
        select
            questionnaire_response_id,
            sfa_file_id,
            step,
            image_id,
            row_number() over (partition by sfa_file_id order by step) as rown 
        from response_image
    ) as subquery
    where rown = 1
),

final as (
    select 
        

        ----------  ids
        sfa_file.sfa_file_id,
        sfa_file.content_file_key,
        first_image.questionnaire_response_id,
        sfa_file.country_code,
        sfa_file.sfa_file_key,

        ----------  strings
        sfa_file.sfa_file_name,    
        sfa_file.sfa_file_name_unique,
        sfa_file.comment,

        ----------  numerics

        ----------  booleans
        sfa_file.is_edited

        ----------  timestamps
    
        ----------  omited


    from 
    first_image
    left join sfa_file
    on first_image.sfa_file_id = sfa_file.sfa_file_id
)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."dim_images__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."dim_images__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_images__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_images__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_dim_images__dbt_tmp_cci'
        AND object_id=object_id('sfa_dim_images__dbt_tmp')
    )
  DROP index "sfa"."dim_images__dbt_tmp".sfa_dim_images__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_dim_images__dbt_tmp_cci
    ON "sfa"."dim_images__dbt_tmp"

  