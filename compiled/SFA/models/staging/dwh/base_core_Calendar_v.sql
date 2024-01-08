with source as (
      select * from "L10_Core"."dbo"."Calendar_v"
),
renamed as (
    select
        "Calendar_Id",
        "Calendar_Date",
        "Calendar_Day",
        "Calendar_Year",
        "Calendar_Quarter",
        "Calendar_Month",
        "Calendar_Week",
        "Day_Suffix",
        "Day_Label",
        "Day_Of_Week",
        "Day_Of_Week_In_Month",
        "Day_Of_Year",
        "Is_Weekend",
        "ISO_week",
        "First_Of_Week",
        "Last_Of_Week",
        "Week_Of_Month",
        "Month_Label",
        "First_Of_Month",
        "Last_Of_Month",
        "First_Of_Next_Month",
        "Last_Of_Next_Month",
        "First_Of_Quarter",
        "Last_Of_Quarter",
        "ISO_Year",
        "First_Of_Year",
        "Last_Of_Year",
        "Is_Leap_Year",
        "Has_53_Weeks",
        "Has_53_ISO_Weeks",
        "MMYYYY",
        "Style_101",
        "Style_103",
        "Style_112",
        "Style_120",
        "YYYYMM",
        "Is_Last_Day_Of_Month"

    from source
)
select * from renamed