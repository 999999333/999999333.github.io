
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__questionnaire_responses__dbt_tmp" as
        with source as (
    select * from "L50_SB_Vitek"."snapshots"."sfa__questionnare_responses_snapshot"
),

renamed as (
    select

        ----------  ids
        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Response_ID as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as link_id,
        "Response_ID" as questionnaire_response_id,
        "Document_ID" as questionnaire_id,
        "SourceResponse_ID" as questionnaire_source_response_id,
        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings

        ----------  numerics

        ----------  booleans

        ----------  timestamps
        dbt_valid_from as valid_from,
        dbt_valid_to as valid_to

        ----------  omited
        -- "Status",
        -- "IsProcessed",
        -- "DLM",

    from source
)

select * from renamed
    ');

