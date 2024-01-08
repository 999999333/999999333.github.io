
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_customers__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_customers__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."dim_customers__dbt_tmp_temp_view" as
    

with customer as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__customers"
),

final as (

    select
        ----------  ids
        customer_id,
        country_id,
        country_code,

        ----------  strings
        customer_name,
        customer_trading_name

        ----------  numerics

        ----------  booleans

        ----------  timestamps   

        ----------  omited

    from customer
    
    where
        dbt_valid_to >= cast(''2299-12-31'' as datetime2)
)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."dim_customers__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."dim_customers__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_customers__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_customers__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_dim_customers__dbt_tmp_cci'
        AND object_id=object_id('sfa_dim_customers__dbt_tmp')
    )
  DROP index "sfa"."dim_customers__dbt_tmp".sfa_dim_customers__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_dim_customers__dbt_tmp_cci
    ON "sfa"."dim_customers__dbt_tmp"

  