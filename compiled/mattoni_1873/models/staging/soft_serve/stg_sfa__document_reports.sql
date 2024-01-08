with source as (
      select * from "L01_Stage"."sfa"."dbo_HReports"
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
        "Url",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed