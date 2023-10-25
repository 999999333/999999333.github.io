
    


    
    

    EXEC('create view "dbt"."base_sfa_dbo_ResponsesH_v__dbt_tmp" as with source as (
      select * from "DWH_Fabric"."dbt"."dbo_ResponsesH_v"
),
renamed as (
    select
        "Country_Code",
        "Response_ID",
        "Document_ID",
        "DLM",
        "Status",
        "IsProcessed",
        "SourceResponse_ID"

    from source
)
select * from renamed;');


