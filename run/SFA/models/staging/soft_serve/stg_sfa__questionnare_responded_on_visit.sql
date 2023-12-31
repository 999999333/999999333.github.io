
    


    
    

    EXEC('create view "dbt"."stg_sfa__questionnare_responded_on_visit__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."dbo_QuestionnaireResponseOnVisit_v"
),

renamed as (
    select

        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(8000), concat(coalesce(cast(Response_ID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Visit_ID as VARCHAR(8000)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as primary_id,
        "Visit_ID" as visit_id,
        "Response_ID" as questionnaire_response_id,
        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id

        ----------  strings

        ----------  numerics

        ----------  booleans

        ----------  timestamps

        ----------  omited
        -- "Valid_From",
        -- "Valid_To"
        
    from source
)

select * from renamed;');


