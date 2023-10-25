with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OutletCardStartEndImages"
),
renamed as (
    select
        "Country_Code",
        "OLCard_ID",
        "ImageID",
        "ImageName",
        "Image",
        "IsStartImage",
        "DLM",
        "PhotoTypeId",
        "Comment",
        "IsChecked",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed