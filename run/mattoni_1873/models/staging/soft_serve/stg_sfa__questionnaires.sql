
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__questionnaires__dbt_tmp" as
        with source as (
    select * from "L50_SB_Vitek"."snapshots"."sfa__documents_snapshot"
),

renamed as (
    select

        ----------  ids
        "dbt_scd_id" as dbt_scd_id,

        
    lower(convert(varchar(50), hashbytes(''md5'', coalesce(convert(varchar(max), concat(coalesce(cast(Country_Code as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''), ''-'', coalesce(cast(Document_ID as VARCHAR(MAX)), ''_dbt_utils_surrogate_key_null_''))), '''')), 2))
 as questionnaire_id,
        "Document_ID" as questionnaire_key,

        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings
        "Name" as questionnaire_name,
        "Details" as questionnaire_details,
        "Country_Code" as country_code,
        "ExternalCode" as questionnaire_external_code,

        ----------  numerics
        "PassScore" as questionnaire_pass_score,
        "Status" as questionnaire_status,

        ----------  booleans

        ----------  timestamps
        "DLM" as dlm,
        "dbt_valid_from" as dbt_valid_from,
        coalesce("dbt_valid_to", cast(''2299-12-31'' as datetime)) as dbt_valid_to
        
        ----------  omited
        -- "HighlightColor",
        -- "ClearPreFilledResponses",
        -- "ResetPreFieldResponses",
        -- "UseContentMDB",
        -- "UseContentCDB",
        -- "ULM" as document_ulm,
        -- "DocumentClassificationId" as document_classification_id,
        -- "DocumentLinkStandartDocumentItemId" as document_link_standard_document_id,
        -- "StandartDocumentItemId" as document_standard_document_id,
        -- "DisplayLastResponseDate" as is_display_last_response_date,
        -- "PromoActivities_ID" as promo_activities_key,
        -- "ActivityId" as activity_id,

    from source
)
select * from renamed
    ');

