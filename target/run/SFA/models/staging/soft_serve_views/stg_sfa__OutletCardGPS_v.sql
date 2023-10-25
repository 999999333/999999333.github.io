
    


    
    

    EXEC('create view "dbt"."stg_sfa__OutletCardGPS_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_OutletCardGPS_v"
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
        "isFake"

    from source
)
select * from renamed;');


