
    


    
    

    EXEC('create view "dbt"."stg_sfa__visit_activity_datamart__dbt_tmp" as with source as (
    select * from "DWH_Fabric"."dbt"."cust_VisitActivityDataMart"
),

renamed as (
    select
        "Country_Code",
        "ORGName1",
        "ORGCode1",
        "ORGName2",
        "ORGCode2",
        "ORGName3",
        "ORGCode3",
        "ORGName4",
        "ORGCode4",
        "ORGName5",
        "ORGCode5",
        "ORGName6",
        "ORGCode6",
        "ORGName7",
        "ORGCode7",
        "SR_Staff",
        "Outlet_SW_code",
        "Outlet_ERP_Code",
        "Outlet_Legal_Name",
        "Outlet_Legal_Address",
        "Outlet_Trading_Name",
        "Outlet_Delivery_Address",
        "Outlet_Status",
        "Outlet_Network",
        "Outlet_Sub_Type",
        "Outlet_Type",
        "Outlet_Group",
        "Start_WD_time",
        "Start_WD_GPS",
        "End_WD_time",
        "End_WD_GPS",
        "Route_Name",
        "Route_Start_date",
        "Route_End_date",
        "Visit_ID",
        "Visit_commentary",
        "Visit_date",
        "Visit_week",
        "Visit_month",
        "Visit_type",
        "Visit_quick_order",
        "Visit_reason_of_unavailability",
        "Visit_Plan",
        "Visit_Fact_in_route",
        "Visit_Fact",
        "Productive_visit",
        "Visit_start_time",
        "Visit_end_time",
        "Visit_duration_min",
        "Visit_travel_time_min",
        "POS_Equipment_activity_time",
        "Inventoryzation_activity_time",
        "Surveys_activity_time",
        "GPS_coordinates_of_the_visit_start",
        "GPS_deviation_of_coordinates_of_the_visit_start_m",
        "GPS_coordinates_of_the_visit_end",
        "GPS_deviation_of_coordinates_of_the_visit_end_m",
        "OrgStructureID",
        "Cust_id",
        "MonthID",
        "Valid_From",
        "Valid_To"

    from source
)

select * from renamed;');


