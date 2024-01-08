
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_dwh__currencies__dbt_tmp" as
        with source as (
      select * from "L10_Core"."dbo"."Currency_c"
),
renamed as (
    select
        "Currency_Id" as currency_id,
        "Currency_Code" as currency_code

    from source
)
select * from renamed
    ');

