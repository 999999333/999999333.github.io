
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_dwh__dim_countries__dbt_tmp" as
        with source as (
      select * from "L30_DM_Sales"."pbi"."dim_Country"
),
renamed as (
    select
        "Country_Id" as country_id,
        "Currency_Id" as currency_id

    from source
)
select * from renamed
    ');

