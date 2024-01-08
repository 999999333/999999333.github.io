
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__questionnaire_responded_on_visit__dbt_tmp" as
        with source as (
    select * from "L01_Stage"."sfa"."dbo_QuestionnaireResponseOnVisit_v"
),

renamed as (
    select

        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Visit_ID as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as visit_id,
        "Visit_ID" as visit_key,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Response_ID as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as questionnaire_response_id,
        "Response_ID" as questionnaire_response_key,
    
        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,
        "Country_Code" as country_key

        ----------  strings

        ----------  numerics

        ----------  booleans

        ----------  timestamps

        ----------  omited
        -- "Valid_From",
        -- "Valid_To"
        
    from source
)

select * from renamed
    ');

