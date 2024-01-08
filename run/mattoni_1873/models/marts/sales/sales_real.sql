
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."sales_real__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."sales_real__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."sales_real__dbt_tmp_temp_view" as
    

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
                cast(''"L50_SB_Vitek"."sfa"."int_kmv_documents_open_enhanced"'' as VARCHAR(MAX)) as _dbt_source_relation,

                
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
                cast(''"L50_SB_Vitek"."sfa"."int_pepsi_documents_open_enhanced"'' as VARCHAR(MAX)) as _dbt_source_relation,

                
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
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."sales_real__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."sales_real__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."sales_real__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."sales_real__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_sales_real__dbt_tmp_cci'
        AND object_id=object_id('sfa_sales_real__dbt_tmp')
    )
  DROP index "sfa"."sales_real__dbt_tmp".sfa_sales_real__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_sales_real__dbt_tmp_cci
    ON "sfa"."sales_real__dbt_tmp"

  