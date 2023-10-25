with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OutletCardGPS"
),
renamed as (
    select
        "Country_Code",
        "OLCard_id",
        "Latitude",
        "Longitude",
        "DLM",
        "FinishLatitude",
        "FinishLongitude",
        "isFake",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed