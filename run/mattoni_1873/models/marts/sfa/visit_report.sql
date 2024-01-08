
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."visit_report__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."visit_report__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."visit_report__dbt_tmp_temp_view" as
    


with visit as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__visits"

),

visit_with_db_ids as (
    select * from "L50_SB_Vitek"."sfa"."fact_visit"

),

organizational_structure as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__organization_structures"
),

inaccessibility_reason as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__visit_inaccessibility_reasons"

),

outlet as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__outlets"

),

final as (
    select
        visit.country_id,
        visit.visit_id,
        visit.visit_key,
        visit.route_id,
        visit.inaccessibility_reason_id,
        visit.visit_date,
        -- organizational_structure.structure_whole_node_tree,
        -- organizational_structure.structure_name_detail,
        -- outlet.outlet_name,
        -- outlet.outlet_sap_code,
        visit.visit_start_time,
        visit.visit_end_time,
        visit.visit_start_distance,
        visit.visit_end_distance,
        visit.is_quick_order,
        inaccessibility_reason.inaccessibility_reason
        


        -- visit_with_db_ids.organizational_structure_key as org_struct_key,      
        -- visit.visit_key,
        -- organizational_structure.dbt_scd_id as organizational_structure_key,
        -- outlet.dbt_scd_id as outlet_key,
        -- inaccessibility_reason.dbt_scd_id as inaccessibility_reason_key,
        -- organizational_structure.structure_name,
        -- visit.outlet_id,



    from

    visit
    left join inaccessibility_reason
    on visit.inaccessibility_reason_id = inaccessibility_reason.inaccessibility_reason_id
    -- left join organizational_structure
    -- on visit_with_db_ids.organizational_structure_key = organizational_structure.dbt_scd_id
    
    -- left join outlet
    -- on visit_with_db_ids.outlet_key = outlet.dbt_scd_id

)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."visit_report__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."visit_report__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."visit_report__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."visit_report__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_visit_report__dbt_tmp_cci'
        AND object_id=object_id('sfa_visit_report__dbt_tmp')
    )
  DROP index "sfa"."visit_report__dbt_tmp".sfa_visit_report__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_visit_report__dbt_tmp_cci
    ON "sfa"."visit_report__dbt_tmp"

  