

with kmv_open as (
    select * from "L50_SB_Vitek"."sfa"."int_kmv_documents_open_enhanced"
),

kmv_closed as (
    select * from "L50_SB_Vitek"."sfa"."int_kmv_documents_closed_enhanced"
),

pepsi_open as (
    select * from "L50_SB_Vitek"."sfa"."int_pepsi_documents_open_enhanced"
),

pepsi_closed as (
    select * from "L50_SB_Vitek"."sfa"."int_pepsi_documents_closed_enhanced"
),

final as (
    
    

        (
            select
                cast('"L50_SB_Vitek"."sfa"."int_kmv_documents_open_enhanced"' as VARCHAR(MAX)) as _dbt_source_relation,

                
                    cast("calendar_id" as int) as "calendar_id" ,
                    cast("country_id" as int) as "country_id" ,
                    cast("entity_id" as int) as "entity_id" ,
                    cast("sold_to_id" as int) as "sold_to_id" ,
                    cast("ship_to_id" as int) as "ship_to_id" ,
                    cast("payer_id" as int) as "payer_id" ,
                    cast("call_representative_id" as int) as "call_representative_id" ,
                    cast("local_sku_id" as int) as "local_sku_id" ,
                    cast("piece_quantity" as decimal(38,5)) as "piece_quantity" ,
                    cast("liter_quantity" as decimal(38,5)) as "liter_quantity" ,
                    cast("oz8_quantity" as decimal(38,5)) as "oz8_quantity" ,
                    cast("rrc_quantity" as decimal(38,5)) as "rrc_quantity" ,
                    cast("net_revenue_lc" as decimal(38,5)) as "net_revenue_lc" ,
                    cast("net_revenue_czk" as decimal(38,5)) as "net_revenue_czk" 

            from "L50_SB_Vitek"."sfa"."int_kmv_documents_open_enhanced"

            
        )

        union all
        

        (
            select
                cast('"L50_SB_Vitek"."sfa"."int_pepsi_documents_open_enhanced"' as VARCHAR(MAX)) as _dbt_source_relation,

                
                    cast("calendar_id" as int) as "calendar_id" ,
                    cast("country_id" as int) as "country_id" ,
                    cast("entity_id" as int) as "entity_id" ,
                    cast("sold_to_id" as int) as "sold_to_id" ,
                    cast("ship_to_id" as int) as "ship_to_id" ,
                    cast("payer_id" as int) as "payer_id" ,
                    cast("call_representative_id" as int) as "call_representative_id" ,
                    cast("local_sku_id" as int) as "local_sku_id" ,
                    cast("piece_quantity" as decimal(38,5)) as "piece_quantity" ,
                    cast("liter_quantity" as decimal(38,5)) as "liter_quantity" ,
                    cast("oz8_quantity" as decimal(38,5)) as "oz8_quantity" ,
                    cast("rrc_quantity" as decimal(38,5)) as "rrc_quantity" ,
                    cast("net_revenue_lc" as decimal(38,5)) as "net_revenue_lc" ,
                    cast("net_revenue_czk" as decimal(38,5)) as "net_revenue_czk" 

            from "L50_SB_Vitek"."sfa"."int_pepsi_documents_open_enhanced"

            
        )

        
    


)

select * from final