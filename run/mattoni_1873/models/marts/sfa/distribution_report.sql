
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."distribution_report__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."distribution_report__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."distribution_report__dbt_tmp_temp_view" as
    

with outlet_distribution as (
    select
        visit_id,
        visit_date,
        outlet_id,
        product_id,
        country_id,
        product_name,
        is_pos_material,
        product_sap_code,
        is_present,
        price,
        rank() over (partition by (outlet_id + product_id) order by visit_date desc) as visit_rank
    from
        "L50_SB_Vitek"."sfa"."fact_outlet_distributions"
    where
        visit_date >= dateadd(month, -2, getdate())
),

final as(
    select
        outlet_id,
        product_id,
        case
            when max(case when visit_rank <= 2 then is_present end) = ''1'' then 1
            else 0
        end as is_distributed
    from
        outlet_distribution
    group by
        outlet_id,
        product_id

)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."distribution_report__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."distribution_report__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."distribution_report__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."distribution_report__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_distribution_report__dbt_tmp_cci'
        AND object_id=object_id('sfa_distribution_report__dbt_tmp')
    )
  DROP index "sfa"."distribution_report__dbt_tmp".sfa_distribution_report__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_distribution_report__dbt_tmp_cci
    ON "sfa"."distribution_report__dbt_tmp"

  