
      
        
            delete from "L50_SB_Vitek"."sfa"."fact_outlet_distributions"
            where (
                distribution_id) in (
                select (distribution_id)
                from "L50_SB_Vitek"."sfa"."#fact_outlet_distributions__dbt_tmp"
            );
        
    

    insert into "L50_SB_Vitek"."sfa"."fact_outlet_distributions" ("distribution_id", "visit_id", "product_id", "visit_date", "outlet_id", "country_id", "product_name", "is_pos_material", "product_sap_code", "is_present", "price")
    (
        select "distribution_id", "visit_id", "product_id", "visit_date", "outlet_id", "country_id", "product_name", "is_pos_material", "product_sap_code", "is_present", "price"
        from "L50_SB_Vitek"."sfa"."#fact_outlet_distributions__dbt_tmp"
    )

  