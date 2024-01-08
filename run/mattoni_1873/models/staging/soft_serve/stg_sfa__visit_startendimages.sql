
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_sfa__visit_startendimages__dbt_tmp" as
        with source as (
      select * from "L01_Stage"."sfa"."dbo_OutletCardStartEndImages"
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
    ');

