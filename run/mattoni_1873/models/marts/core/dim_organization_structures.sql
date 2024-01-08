
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_organization_structures__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_organization_structures__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."dim_organization_structures__dbt_tmp_temp_view" as
    

with org_structure as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__organization_structures_v"
),

final as (
    select
    
        ----------  ids
        org_structure.organizational_structure_id,
        org_structure.structure_node_key,

        org_structure.country_id,
        org_structure.country_code,

        ----------  strings
        org_structure.structure_name,
        org_structure.structure_telephone,
        org_structure.structure_email,
        org_structure.structure_name_detail,
        org_structure.structure_whole_node_tree,
        org_structure.structure_node_level,
        org_structure.structure_node_tree_hierarchy

        ----------  numerics

        ----------  booleans

        ----------  timestamps
    
        ----------  omited

    from
        org_structure
)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."dim_organization_structures__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."dim_organization_structures__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_organization_structures__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_organization_structures__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_dim_organization_structures__dbt_tmp_cci'
        AND object_id=object_id('sfa_dim_organization_structures__dbt_tmp')
    )
  DROP index "sfa"."dim_organization_structures__dbt_tmp".sfa_dim_organization_structures__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_dim_organization_structures__dbt_tmp_cci
    ON "sfa"."dim_organization_structures__dbt_tmp"

  