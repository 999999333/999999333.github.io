
    


    
    

    EXEC('create view "dbt"."stg_sfa__kpi_execution_plans__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."ps_KPIExecutionPlan"
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
select * from renamed;');


