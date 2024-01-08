with source as (
      select * from "L10_Core"."dbo"."FXR_AVG_vs_BGT_Main_Currency_v"
),
renamed as (
    select
        "Calendar_Id",
        "Data_Source",
        "FXR_Type_Id",
        "FXR_Type_Label",
        "Currency_Id_Buy",
        "Currency_Code_Buy",
        "Currency_Id_Sell",
        "Currency_Code_Sell",
        "Rate"

    from source
)
select * from renamed