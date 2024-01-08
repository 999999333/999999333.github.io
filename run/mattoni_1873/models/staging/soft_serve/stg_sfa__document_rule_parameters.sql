
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__document_rule_parameters__dbt_tmp" as
        with source as (
    select * from "L01_Stage"."sfa"."dbo_DocumentRuleParams"
),

renamed as (
    select
        "Country_Code",
        "Param_ID",
        "Rule_ID",
        "ValidationItem_ID",
        "TableRow_ID",
        "DisplayValue",
        "ValidationValue",
        "ReplacementType",
        "SortOrder",
        "ParamOperation",
        "ULM",
        "DLM",
        "Status",
        "DisplayValueId",
        "ValidationValueId",


        ----------  ids

        ----------  strings

        ----------  numerics

        ----------  booleans

        ----------  timestamps
        "Valid_From",
        "Valid_To"
        
        ----------  omited

    from source
)

select * from renamed
    ');

