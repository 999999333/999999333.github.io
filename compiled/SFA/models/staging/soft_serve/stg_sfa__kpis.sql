with source as (
      select * from "DWH_Fabric"."dbt"."ps_KPI"
),

renamed as (
    select
        "Country_Code" as country_code,
        "KpiId" as kpiid,
        "ParentId" as parentid,
        "ActivityType" as activitytype,
        "Name" as name,
        "Comment" as comment,
        "ExternalCode" as externalcode,
        "Type" as type,
        "Level" as level,
        "Status" as status,
        "DLM" as dlm,
        "ULM",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed