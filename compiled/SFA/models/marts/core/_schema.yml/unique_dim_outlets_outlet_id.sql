
    
    

select
    outlet_id as unique_field,
    count(*) as n_records

from "DWH_Fabric"."dbt"."dim_outlets"
where outlet_id is not null
group by outlet_id
having count(*) > 1


