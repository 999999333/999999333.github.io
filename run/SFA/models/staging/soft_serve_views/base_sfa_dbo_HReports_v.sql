
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_HReports_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_HReports_v"
),
renamed as (
    select
        "Country_Code",
        "HReport_ID",
        "Name",
        "Comment",
        "DLM",
        "Status",
        "ULM",
        "IsPrintForm",
        "IsRecalculated",
        "Segment",
        "ReportType",
        "StoredProcText",
        "DepthCalculation",
        "ReportScript",
        "IsWebPage",
        "Url"

    from source
)
select * from renamed;');


