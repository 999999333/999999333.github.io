
    


    
    

    EXEC('create view "dbt"."stg_sfa__responses_single_content_d__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ResponsesSingleContentD"
),
renamed as (
    select
        "Country_Code",
        "Response_ID",
        "Object_ID",
        "StepNumber",
        "ContentID",
        "EntityTypeID",
        "Valid_From",
        "Valid_To"

    from source
)
select * from renamed;');


