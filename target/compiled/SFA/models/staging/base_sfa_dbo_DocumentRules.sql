WITH source AS (
    SELECT
        *
    FROM
        "DWH_Fabric"."dbt"."dbo_DocumentRules"
),
renamed AS (
    SELECT
        "Country_Code",
        "Rule_ID",
        "Type",
        "Object_ID",
        "RuleName",
        "RuleOperation",
        "SortOrder",
        "ULM",
        "DLM",
        "Status",
        "ExternalCode",
        "StandartDocumentItemId",
        "CycleItem",
        "AllowBreakCycle",
        "Valid_From",
        "Valid_To"
    FROM
        source
)
SELECT
    *
FROM
    renamed