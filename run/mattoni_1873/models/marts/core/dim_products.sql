
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_products__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_products__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."dim_products__dbt_tmp_temp_view" as
    


with product as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__products_v"
),

final as (
    select
                
        ----------  ids
        product_id,
        product_type_id,

        ----------  strings
        product_name,
        product_name_short,
        product_sap_code,
        unit_weight,

        ----------  numerics
        package_quantity,
        ean_code,
        status,

        ----------  booleans
        is_pos_material

        ----------  timestamps
    
        ----------  omited


    from
        product
)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."dim_products__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."dim_products__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_products__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_products__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_dim_products__dbt_tmp_cci'
        AND object_id=object_id('sfa_dim_products__dbt_tmp')
    )
  DROP index "sfa"."dim_products__dbt_tmp".sfa_dim_products__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_dim_products__dbt_tmp_cci
    ON "sfa"."dim_products__dbt_tmp"

  