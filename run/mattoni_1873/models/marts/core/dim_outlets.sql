
      
        
            delete from "L50_SB_Vitek"."sfa"."dim_outlets"
            where (
                outlet_id) in (
                select (outlet_id)
                from "L50_SB_Vitek"."sfa"."#dim_outlets__dbt_tmp"
            );
        
    

    insert into "L50_SB_Vitek"."sfa"."dim_outlets" ("outlet_name", "outlet_id", "organizational_structure_id", "outlet_adress", "outlet_email", "country_id", "outlet_sap_code", "outlet_director", "outlet_trading_name", "outlet_delivery_adress", "dlm", "sortiment_type", "visit_cycle", "visit_frequency", "visit_days", "pricelist_id", "additional_name", "payer", "structure_whole_node_tree", "structure_name_detail")
    (
        select "outlet_name", "outlet_id", "organizational_structure_id", "outlet_adress", "outlet_email", "country_id", "outlet_sap_code", "outlet_director", "outlet_trading_name", "outlet_delivery_adress", "dlm", "sortiment_type", "visit_cycle", "visit_frequency", "visit_days", "pricelist_id", "additional_name", "payer", "structure_whole_node_tree", "structure_name_detail"
        from "L50_SB_Vitek"."sfa"."#dim_outlets__dbt_tmp"
    )

  