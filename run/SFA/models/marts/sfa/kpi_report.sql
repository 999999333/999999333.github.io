
    USE [L50_SB_Vitek];
    execute('create view "sfa"."kpi_report__dbt_tmp" as
        with
    final as (
        select
            ex.country_code,
            ex.visit_id,
            ex.fact_date,
            ex.period,
            ex.outlet_id,
            ex.fact_value,
            pl.plan_value,
            pl.outlet_id as plan_outlet_id,
            pl.kpi_outlet_id as plan_kpi_outlet_id,
            pl.period as plan_period,
            ex.last_modified,
            ex.status,
            ex.kpi_id,
            ex.org_id,
            ex.kpi_outlet_id,
            ex.kpi_country_id
        from "L50_SB_Vitek"."sfa"."fact_kpi_actual" as ex
        full outer join
            "L50_SB_Vitek"."sfa"."fact_kpi_plan" as pl
            on ex.kpi_outlet_id = pl.kpi_outlet_id
            and ex.period = pl.period
    )

select * from final
    ');

