
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."int_mobile_tracking_gps__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."int_mobile_tracking_gps__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."int_mobile_tracking_gps__dbt_tmp_temp_view" as
    

with mobile_tracking as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__mobile_day_tracking_v"
),

start_coordinates as (
    select
        mobile_user_id,
        day_date,
        day_start_time,
        day_end_time,
        start_latitude as latitude,
        start_longitude as longtitude,
        ''start'' as geotype,
        datediff(second, day_start_time, day_end_time) AS duration_seconds

    from 
        mobile_tracking
),

end_coordinates as (
    select
        mobile_user_id,
        day_date,
        day_start_time,
        day_end_time,
        end_latitude as latitude,
        end_longitude as longtitude,
        ''end'' as geotype,
        datediff(second, day_start_time, day_end_time) as duration_seconds

    from 
        mobile_tracking
),

final as (
    select *
    from start_coordinates

    union

    select *
    from end_coordinates

)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."int_mobile_tracking_gps__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."int_mobile_tracking_gps__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."int_mobile_tracking_gps__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."int_mobile_tracking_gps__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_int_mobile_tracking_gps__dbt_tmp_cci'
        AND object_id=object_id('sfa_int_mobile_tracking_gps__dbt_tmp')
    )
  DROP index "sfa"."int_mobile_tracking_gps__dbt_tmp".sfa_int_mobile_tracking_gps__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_int_mobile_tracking_gps__dbt_tmp_cci
    ON "sfa"."int_mobile_tracking_gps__dbt_tmp"

  