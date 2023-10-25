
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_ContentFiles_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ContentFiles_v"
),
renamed as (
    select
        "Country_Code",
        "ContentFileID",
        "ContentID",
        "ContentFileName",
        "ContentFileUniqueName",
        "Hash",
        "Status",
        "DLM",
        "ULM",
        "Comment",
        "PhotoTypeId",
        "Size",
        "Activity_ID",
        "CreationDate",
        "IsEdited",
        "ReceivingResultDate"

    from source
)
select * from renamed;');


