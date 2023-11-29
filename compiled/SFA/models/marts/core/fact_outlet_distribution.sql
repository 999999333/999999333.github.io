



with outlet_distribution as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__outlet_distributions_v"
),

product as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__products_v"
),

visit as (
    select * from "DWH_Fabric"."dbt"."stg_sfa__visits"
),

final as (
    select 
        outlet_distribution.distribution_id,
        outlet_distribution.visit_id,
        outlet_distribution.product_id,
        visit.visit_date,
        visit.outlet_id,
        outlet_distribution.country_id,
        product.product_name,
        product.is_pos_material,
        product.product_sap_code,
        outlet_distribution.is_present,
        outlet_distribution.price

    from
        outlet_distribution
    left outer join
        product
        on outlet_distribution.product_id = product.product_id
    left outer join
        visit
        on outlet_distribution.visit_id = visit.visit_id

    where

    
        visit.visit_date >= (select max(this.visit_date)from "DWH_Fabric"."dbt"."fact_outlet_distribution" as this) 
        and

    

    visit.dbt_valid_to >= cast('2299-12-31' as datetime2)
   
)

select * from final