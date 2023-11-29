

with visit as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__visits"

),

organizational_structure as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__organization_structures"
),

staff as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__staff"
),

outlet as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__outlets"
),

customer as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__customers"
),

inaccessibility_reason as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__visit_inaccessibility_reasons"

),



final as (
    select
        visit.visit_id, -- PRIDAT LOGIKU AT VYBERY JEN NEJNOVEJSI
        visit.visit_key,
        visit.visit_date,
        visit.country_id,
        organizational_structure.dbt_scd_id as organizational_structure_id,
        organizational_structure.organizational_structure_id as orgstructureid,
        visit.organizational_structure_id as visitorgstrucutreid,
        outlet.dbt_scd_id as outlet_id,
        organizational_structure.organizational_structure_key,
        -- inaccessibility_reason.inaccessibility_reason_key
        -- inaccessibility_reason.dbt_scd_id as inaccessibility_reason_id
        -- customer.dbt_scd_id as customer_id

        organizational_structure.structure_name,
        organizational_structure.structure_whole_node_tree,
        organizational_structure.structure_name_detail,
        -- visit.outlet_id,
        -- outlet.outlet_name,
        -- outlet.outlet_sap_code,
        visit.visit_start_time,
        visit.visit_end_time,
        visit.visit_start_distance,
        visit.visit_end_distance,
        visit.is_quick_order
        -- inaccessibility_reason.inaccessibility_reason,
        -- visit.route_id



    from
        visit
        

left join organizational_structure

    on visit.organizational_structure_id = organizational_structure.organizational_structure_id
and
    visit.visit_date between organizational_structure.dbt_valid_from and organizational_structure.dbt_valid_to
and 
    visit.country_id = organizational_structure.country_id
    


        

left join outlet

    on visit.outlet_id = outlet.outlet_id
and
    visit.visit_date between outlet.dbt_valid_from and outlet.dbt_valid_to
and 
    visit.country_id = outlet.country_id
    


    where visit.valid_to = cast('2299-12-31' as datetime)


)

select * from final