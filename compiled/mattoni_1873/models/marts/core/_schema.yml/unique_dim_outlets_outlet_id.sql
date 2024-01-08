
    
    

select
    outlet_id as unique_field,
    count(*) as n_records

from "L50_SB_Vitek"."sfa"."dim_outlets"
where outlet_id is not null
group by outlet_id
having count(*) > 1


