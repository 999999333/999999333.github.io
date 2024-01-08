
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_staff__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_staff__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."dim_staff__dbt_tmp_temp_view" as
    

with staff as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__staff"
    where
    dbt_valid_to >= cast(''2299-12-31'' as datetime2)
),

staff_link_org_structure as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__staff_link_org_structures_v"
),

org_structure as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__organization_structures_v"
),

final as (
    select


        staff.staff_position,
        staff.staff_comment,
        staff.staff_sap_code,



        ----------  ids
        staff.staff_id,
        staff.staff_key,

        staff.country_id,
        staff.country_code,

        staff_link_org_structure.organizational_structure_id,

        ----------  strings
        staff.staff_name_whole,
        staff.staff_name_first,
        staff.staff_name_last,
        staff.staff_email,
        staff.staff_telephone        

        ----------  numerics

        ----------  booleans

        ----------  timestamps
    
        ----------  omited



    from
    staff
    left join
    staff_link_org_structure
    on staff.staff_id = staff_link_org_structure.staff_id
)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."dim_staff__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."dim_staff__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_staff__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_staff__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_dim_staff__dbt_tmp_cci'
        AND object_id=object_id('sfa_dim_staff__dbt_tmp')
    )
  DROP index "sfa"."dim_staff__dbt_tmp".sfa_dim_staff__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_dim_staff__dbt_tmp_cci
    ON "sfa"."dim_staff__dbt_tmp"

  