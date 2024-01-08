
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_dwh__dim_entities__dbt_tmp" as
        with source as (
      select * from "L30_DM_Sales"."pbi"."dim_Entity"
),
renamed as (
    select
        "Entity_Id" as entity_id,
        "Country_Id" as country_id,
        "Entity_SAP_Code" as entity_sap_code

    from source
)
select * from renamed
    ');

