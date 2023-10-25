
    


    
    

    EXEC('create view "dbt"."stg_sfa__InaccessibilityReasons_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_InaccessibilityReasons_v"
),
renamed as (
    select
        "Country_Code",
        "Reason_id",
        "Reason",
        "DLM",
        "Status",
        "ULM",
        "ExternalCode",
        "IsLegal"

    from source
)
select * from renamed;');


