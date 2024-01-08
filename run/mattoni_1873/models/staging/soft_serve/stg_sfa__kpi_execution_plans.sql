
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__kpi_execution_plans__dbt_tmp" as
        with source as (
      select * from "L01_Stage"."sfa"."ps_KPIExecutionPlan"
),
renamed as (
    select
        "Country_Code",
        "KpiId",
        "DateFrom",
        "DateTo",
        "OL_ID",
        "PlanValue",
        "DLM",
        "Status",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed
    ');

