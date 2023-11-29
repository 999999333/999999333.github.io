


with outlet as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__outlets"
),

custom_field as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__outlet_custom_fields_v"
),

organizational_structure as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__organization_structures_v"
),

final as (
    select
        outlet.outlet_name,
        outlet.outlet_id,
        outlet.organizational_structure_id,
        outlet.outlet_adress,
        outlet.outlet_email,
        outlet.country_id,
        outlet.outlet_sap_code,
        outlet.outlet_director,
        outlet.outlet_trading_name,
        outlet.outlet_delivery_adress,
        outlet.dlm,
        custom_field.sortiment_type,
        custom_field.visit_cycle,
        custom_field.visit_frequency,
        custom_field.visit_days,
        custom_field.pricelist_id,
        custom_field.additional_name,
        custom_field.payer,
        organizational_structure.structure_whole_node_tree,
        organizational_structure.structure_name_detail

    from 
        outlet
    left join
        custom_field
        on outlet.outlet_id = custom_field.outlet_id
    left join 
        organizational_structure
        on outlet.organizational_structure_id = organizational_structure.organizational_structure_id
    
    where

    
        outlet.dlm >= (select max(this.dlm) from "DWH_Fabric"."dbt"."dim_outlets" as this) 
        and

    

    outlet.dbt_valid_to >= cast('2299-12-31' as datetime2)
)

select * from final