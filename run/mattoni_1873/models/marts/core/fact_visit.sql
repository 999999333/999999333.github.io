
      
        
            delete from "L50_SB_Vitek"."sfa"."fact_visit"
            where (
                visit_id) in (
                select (visit_id)
                from "L50_SB_Vitek"."sfa"."#fact_visit__dbt_tmp"
            );
        
    

    insert into "L50_SB_Vitek"."sfa"."fact_visit" ("visit_id", "visit_key", "country_id", "country_code", "inaccessibility_reason_id", "outlet_id", "route_id", "organizational_structure_id", "customer_id", "visit_comment", "visit_start_distance", "visit_end_distance", "visit_duration_sec", "is_quick_order", "visit_date", "visit_start_time", "visit_end_time")
    (
        select "visit_id", "visit_key", "country_id", "country_code", "inaccessibility_reason_id", "outlet_id", "route_id", "organizational_structure_id", "customer_id", "visit_comment", "visit_start_distance", "visit_end_distance", "visit_duration_sec", "is_quick_order", "visit_date", "visit_start_time", "visit_end_time"
        from "L50_SB_Vitek"."sfa"."#fact_visit__dbt_tmp"
    )

  