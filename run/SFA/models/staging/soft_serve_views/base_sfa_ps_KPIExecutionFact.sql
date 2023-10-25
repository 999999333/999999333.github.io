
    


    
    

    EXEC('create view "dbt"."base_sfa_ps_KPIExecutionFact__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."ps_KPIExecutionFact"
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
select * from renamed;');


