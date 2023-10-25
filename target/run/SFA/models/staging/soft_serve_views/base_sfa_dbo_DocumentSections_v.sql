
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_DocumentSections_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_DocumentSections_v"
),
renamed as (
    select
        "Country_Code",
        "Section_ID",
        "ParentSection_ID",
        "Document_ID",
        "Name",
        "SortOrder",
        "GroupingType",
        "BO_ID",
        "ULM",
        "DLM",
        "Status",
        "Level",
        "ExternalCode",
        "RandomQuestionsNumber",
        "HReport_ID",
        "IsCallButton",
        "EnableCopy",
        "IsPhotoReport",
        "ShootingAngle"

    from source
)
select * from renamed;');


