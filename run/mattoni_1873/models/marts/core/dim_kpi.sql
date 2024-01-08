
  
    -- drop previous temp view
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_kpi__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_kpi__dbt_tmp_temp_view"
        end


    -- create temp view
   USE [L50_SB_Vitek];
   EXEC('create view "sfa"."dim_kpi__dbt_tmp_temp_view" as
    


with kpi as (
    select * from "L50_SB_Vitek"."sfa"."stg_sfa__kpis"
),


final as (
    select
        country_code = isnull(
            kpi.country_code,
            ''n/a''
        ),
        kpi_name = isnull(
            kpi.name,
            ''n/a''
        ),
        kpi_level_1 = isnull(
            level1.name,
            ''n/a''
        ),
        kpi_level_2 = isnull(
            level2.name,
            ''n/a''
        ),
        kpi_level_3 = isnull(
            level3.name,
            ''n/a''
        ),
        kpi_level_4 = isnull(
            level4.name,
            ''n/a''
        ),
        kpi_level_5 = isnull(
            level5.name,
            ''n/a''
        ),
        kpi_level_6 = isnull(
            level6.name,
            ''n/a''
        ),
        kpi_external_code = isnull(
            kpi.externalcode,
            ''n/a''
        ),
        kpi_description = isnull(
            kpi.comment,
            ''n/a''
        ),
        TYPE = isnull(
            kpi.type,
            -1
        ),
        number_of_levels = isnull(
            kpi.level,
            -1
        ),
        status = isnull(
            kpi.status,
            -1
        ),
        activity = isnull(
            kpi.activitytype,
            -1
        ),
        last_modified = kpi.dlm,
        kpi_id = kpi.kpiid,
        parent_id = isnull(
            kpi.kpiid,
            ''n/a''
        ),
        parent_id_1 = isnull(
            level1.parentid,
            ''n/a''
        ),
        parent_id_2 = isnull(
            level2.parentid,
            ''n/a''
        ),
        parent_id_3 = isnull(
            level3.parentid,
            ''n/a''
        ),
        parent_id_4 = isnull(
            level4.parentid,
            ''n/a''
        ),
        parent_id_5 = isnull(
            level5.parentid,
            ''n/a''
        ),
        parent_id_6 = isnull(
            level6.parentid,
            ''n/a''
        ),
        kpi_country_id = CONCAT(
            kpi.kpiid,
            '':'',
            kpi.country_code
        )
    FROM
        kpi as kpi
        left join kpi as level1
        on kpi.parentid = level1.kpiid
        AND kpi.country_code = level1.country_code
        left join kpi as level2
        on level1.parentid = level2.kpiid
        AND kpi.country_code = level2.country_code
        left join kpi as level3
        on level2.parentid = level3.kpiid
        AND kpi.country_code = level3.country_code
        left join kpi as level4
        on level3.parentid = level4.kpiid
        AND kpi.country_code = level4.country_code
        left join kpi as level5
        on level4.parentid = level5.kpiid
        AND kpi.country_code = level5.country_code
        left join kpi as level6
        on level5.parentid = level6.kpiid
        AND kpi.country_code = level6.country_code
)

select * from final
    ');

   -- select into the table and create it that way
   
   SELECT *
   INTO "sfa"."dim_kpi__dbt_tmp"
   FROM "L50_SB_Vitek"."sfa"."dim_kpi__dbt_tmp_temp_view"

   -- drop temp view
   
    
    
    
    
    USE [L50_SB_Vitek];
    if object_id ('"sfa"."dim_kpi__dbt_tmp_temp_view"','V') is not null
        begin
            drop view "sfa"."dim_kpi__dbt_tmp_temp_view"
        end
-- add columnstore index
        use [L50_SB_Vitek];
  if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'sfa_dim_kpi__dbt_tmp_cci'
        AND object_id=object_id('sfa_dim_kpi__dbt_tmp')
    )
  DROP index "sfa"."dim_kpi__dbt_tmp".sfa_dim_kpi__dbt_tmp_cci
  CREATE CLUSTERED COLUMNSTORE INDEX sfa_dim_kpi__dbt_tmp_cci
    ON "sfa"."dim_kpi__dbt_tmp"

  