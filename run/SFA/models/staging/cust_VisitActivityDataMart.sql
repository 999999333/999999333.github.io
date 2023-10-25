
    


    
    

    EXEC('create view "dbt"."cust_VisitActivityDataMart__dbt_tmp" as with source as (

    select * from "SFA_Warehouse"."dbt"."cust_VisitActivityDataMart"

),

renamed as (

    select
        country_code,
        orgname1,
        orgcode1,
        orgname2,
        orgcode2,
        orgname3,
        orgcode3,
        orgname4,
        orgcode4,
        orgname5,
        orgcode5,
        orgname6,
        orgcode6,
        orgname7,
        orgcode7,
        sr_staff,
        outlet_sw_code,
        outlet_erp_code,
        outlet_legal_name,
        outlet_legal_address,
        outlet_trading_name,
        outlet_delivery_address,
        outlet_status,
        outlet_network,
        outlet_sub_type,
        outlet_type,
        outlet_group,
        start_wd_time,
        start_wd_gps,
        end_wd_time,
        end_wd_gps,
        route_name,
        route_start_date,
        route_end_date,
        visit_id,
        visit_commentary,
        visit_date,
        visit_week,
        visit_month,
        visit_type,
        visit_quick_order,
        visit_reason_of_unavailability,
        visit_plan,
        visit_fact_in_route,
        visit_fact,
        productive_visit,
        visit_start_time,
        visit_end_time,
        visit_duration_min,
        visit_travel_time_min,
        pos_equipment_activity_time,
        inventoryzation_activity_time,
        surveys_activity_time,
        gps_coordinates_of_the_visit_start,
        gps_deviation_of_coordinates_of_the_visit_start_m,
        gps_coordinates_of_the_visit_end,
        gps_deviation_of_coordinates_of_the_visit_end_m,
        orgstructureid,
        cust_id,
        monthid,
        valid_from,
        valid_to

    from source

)

select * from renamed;');


