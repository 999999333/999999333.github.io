
    
    

select
    inaccessibility_reason_id as unique_field,
    count(*) as n_records

from "L50_SB_Vitek"."sfa"."dim_inaccessibility_reasons"
where inaccessibility_reason_id is not null
group by inaccessibility_reason_id
having count(*) > 1


