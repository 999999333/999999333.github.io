
      
        
            delete from "DWH_Fabric"."dbt"."fact_outlet_distribution"
            where (
                distribution_id) in (
                select (distribution_id)
                from "DWH_Fabric"."dbt"."fact_outlet_distribution__dbt_tmp"
            );
        
    

    insert into "DWH_Fabric"."dbt"."fact_outlet_distribution" ("distribution_id", "visit_id", "product_id", "visit_date", "outlet_id", "country_id", "product_name", "is_pos_material", "product_sap_code", "is_present", "price")
    (
        select "distribution_id", "visit_id", "product_id", "visit_date", "outlet_id", "country_id", "product_name", "is_pos_material", "product_sap_code", "is_present", "price"
        from "DWH_Fabric"."dbt"."fact_outlet_distribution__dbt_tmp"
    )

  