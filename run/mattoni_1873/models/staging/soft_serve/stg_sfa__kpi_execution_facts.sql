
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__kpi_execution_facts__dbt_tmp" as
        with source as (
      select * from "L01_Stage"."sfa"."ps_KPIExecutionFact"
),
renamed as (
    select
        "Country_Code",
        "KpiId",
        "VersionId",
        "OlCard_id",
        "Date",
        "OL_ID",
        "OrgStructureID",
        "Fact",
        "DLM",
        "Status",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed
    ');

