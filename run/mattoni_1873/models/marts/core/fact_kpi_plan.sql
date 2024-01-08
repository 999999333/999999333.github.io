
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."fact_kpi_plan__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."fact_kpi_plan__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."fact_kpi_plan__dbt_tmp_temp_view" as
    

with kpi_plan as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__kpi_execution_plans_v"
),

final as (
    select
        country_code,
        period = format(date_to, ''yyyyMMdd''), 
        date_to,
        plan_value,
        outlet_id,
        kpi_id,
        kpi_outlet_id,
        dlm
    from kpi_plan
)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."fact_kpi_plan__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."fact_kpi_plan__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."fact_kpi_plan__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."fact_kpi_plan__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_fact_kpi_plan__dbt_tmp_cci'
        AND object_id=object_id('sfa_fact_kpi_plan__dbt_tmp')
    )
  DROP index "sfa"."fact_kpi_plan__dbt_tmp".sfa_fact_kpi_plan__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_fact_kpi_plan__dbt_tmp_cci
    ON "sfa"."fact_kpi_plan__dbt_tmp"

  