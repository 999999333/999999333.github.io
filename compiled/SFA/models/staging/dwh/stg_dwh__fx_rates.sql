with source as (
      select * from "L10_Core"."dbo"."FXR_AVG_vs_BGT_Main_Currency_v"
),
renamed as (
    select
        "Calendar_Id" as calendar_id,
        "Currency_Id_Buy" as from_currency_id,
        "Currency_Id_Sell" as to_currency_id,
        "Rate" as fx_rate

    from source
)
select * from renamed