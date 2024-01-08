
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."fact_day_tracking__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."fact_day_tracking__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."fact_day_tracking__dbt_tmp_temp_view" as
    

with mobile_user as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__mobile_users_v"
),

mobile_tracking as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__mobile_day_tracking_v"
),

final as (
    select 
        mobile_user.organizational_structure_id,
        mobile_user.mobile_user_id,
        mobile_user.country_id,
        mobile_user.country_code,
        mobile_tracking.day_date,
        mobile_tracking.day_start_time,
        mobile_tracking.day_end_time,
        mobile_tracking.start_latitude,
        mobile_tracking.start_longitude,
        mobile_tracking.end_latitude,
        mobile_tracking.end_longitude


    from mobile_user

    left join mobile_tracking
        on mobile_user.mobile_user_id = mobile_tracking.mobile_user_id

)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."fact_day_tracking__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."fact_day_tracking__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."fact_day_tracking__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."fact_day_tracking__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_fact_day_tracking__dbt_tmp_cci'
        AND object_id=object_id('sfa_fact_day_tracking__dbt_tmp')
    )
  DROP index "sfa"."fact_day_tracking__dbt_tmp".sfa_fact_day_tracking__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_fact_day_tracking__dbt_tmp_cci
    ON "sfa"."fact_day_tracking__dbt_tmp"

  