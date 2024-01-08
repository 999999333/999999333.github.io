
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_visit_gps__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_visit_gps__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."dim_visit_gps__dbt_tmp_temp_view" as
    

with visit_gps as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__visit_gps"
),

final as (
    select

        ----------  ids
        visit_id,
        visit_key,
        
        country_id,
        country_code,

        ----------  strings

        ----------  numerics
        visit_start_latitude,
        visit_start_longtitude,
        visit_finish_latitude,
        visit_finish_longtitude,

        ----------  booleans
        is_fake_gps,

        ----------  timestamps
        dlm
        ----------  omited

    from
        visit_gps
)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."dim_visit_gps__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."dim_visit_gps__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_visit_gps__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_visit_gps__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_dim_visit_gps__dbt_tmp_cci'
        AND object_id=object_id('sfa_dim_visit_gps__dbt_tmp')
    )
  DROP index "sfa"."dim_visit_gps__dbt_tmp".sfa_dim_visit_gps__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_dim_visit_gps__dbt_tmp_cci
    ON "sfa"."dim_visit_gps__dbt_tmp"

  