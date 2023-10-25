with
    source as (select * from "DWH_Fabric"."dbt"."dbo_ContentFiles"),
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
            "ReceivingResultDate",
            "Valid_From",
            "Valid_To"

        from source
    )
select *
from renamed