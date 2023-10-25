
    


    
    

    EXEC('create view "dbt"."stg_sfa__visit_gps__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."dbo_OutletCardGPS"
),

renamed as (
    select

        ----------  ids
        
CONCAT(
        ISNULL(CAST(OLCard_id AS NVARCHAR(MAX)), ''-1''),
        ISNULL(CAST(Valid_To AS NVARCHAR(MAX)), ''-1'')
    )
    as _surrogate_key

,
        "OLCard_id" as visit_id,
        
case
  when Country_Code = ''CZ'' then 422
  when Country_Code = ''SK'' then 423
  when Country_Code = ''HU'' then 424
  when Country_Code is null then -1
  else -2
end
 as country_id,

        ----------  strings

        ----------  numerics
        "Latitude" as visit_start_latitude,
        "Longitude" as visit_start_longtitude,
        "FinishLatitude" as visit_finish_latitude,
        "FinishLongitude" as visit_finish_longtitude,

        ----------  booleans
        "isFake" as is_fake_gps,

        ----------  timestamps
        "Valid_From",
        "Valid_To"

        ----------  omited
        --"DLM",

    from source
)

select * from renamed;');


