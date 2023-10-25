with source as (
      select * from "DWH_Fabric"."dbt"."dbo_Documents"
),
renamed as (
    select
        "Country_Code",
        "Document_ID",
        "Name",
        "Details",
        "ULM",
        "DLM",
        "Status",
        "UseContentCDB",
        "UseContentMDB",
        "ExternalCode",
        "PassScore",
        "HighlightColor",
        "StandartDocumentItemId",
        "DocumentClassificationId",
        "DisplayLastResponseDate",
        "DocumentLinkStandartDocumentItemId",
        "PromoActivities_ID",
        "ClearPreFilledResponses",
        "ActivityId",
        "ResetPreFieldResponses",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed