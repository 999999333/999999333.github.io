
    
    

select
    visit_id as unique_field,
    count(*) as n_records

from "L50_SB_Vitek"."sfa"."fact_visit"
where visit_id is not null
group by visit_id
having count(*) > 1


