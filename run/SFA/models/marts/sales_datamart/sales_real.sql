
    USE [L50_SB_Vitek];
    execute('create view "sfa"."sales_real__dbt_tmp" as
        

with kmv_open as (
    select * from "L50_SB_Vitek"."sfa"."int_kmv_documents_open_enhanced"
),

kmv_closed as (
    select * from "L50_SB_Vitek"."sfa"."int_kmv_documents_closed_enhanced"
),

final as (

    select * from kmv_open

    union all

    select * from kmv_closed
)

select * from final
    ');

