
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_DocumentItems_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_DocumentItems_v"
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
        "BarCodeScanning"

    from source
)
select * from renamed;');


