
    
    

select
    visit_id as unique_field,
    count(*) as n_records

from "DWH_Fabric"."dbt"."dim_visit_gps"
where visit_id is not null
group by visit_id
having count(*) > 1


