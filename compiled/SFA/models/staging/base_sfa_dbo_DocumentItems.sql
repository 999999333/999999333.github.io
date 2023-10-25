with source as (
      select * from "DWH_Fabric"."dbt"."dbo_DocumentItems"
),
renamed as (
    select
        "Country_Code",
        "Item_ID",
        "Section_ID",
        "DisplayValue",
        "ValueType",
        "ControlType",
        "TotalType",
        "SortOrder",
        "ULM",
        "DLM",
        "Status",
        "UseContentCDB",
        "UseContentMDB",
        "ResponseFormat",
        "HasRestrictionRules",
        "HasValidationRules",
        "HasMobileContentRules",
        "TargetValue",
        "QuestionWeight",
        "ExternalCode",
        "HighlightInColor",
        "UseResponseFromPreviousQuestionnaire",
        "StandartDocumentItemId",
        "Hint",
        "IsReadOnly",
        "BO_ID",
        "IsProhibitEditingPreviousAnswer",
        "UsePreviousVisitContent",
        "Distribution",
        "MDBContentCountLimit",
        "BarCodeScanning",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed