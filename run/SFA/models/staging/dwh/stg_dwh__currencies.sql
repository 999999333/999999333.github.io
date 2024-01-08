
    USE [L50_SB_Vitek];
    execute('create view "sfa"."stg_dwh__currencies__dbt_tmp" as
        with source as (
      select * from "L10_Core"."dbo"."Currency_c"
),
renamed as (
    select
        "Currency_Id",
        "Currency_Code",
        "Currency_Label",
        "Mattoni_Main_Currency_flag",
        "FXR_Calculation_flag"

    from source
)
select * from renamed
    ');

