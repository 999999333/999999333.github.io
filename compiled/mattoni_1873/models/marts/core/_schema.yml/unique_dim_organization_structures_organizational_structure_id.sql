
    
    

select
    organizational_structure_id as unique_field,
    count(*) as n_records

from "L50_SB_Vitek"."sfa"."dim_organization_structures"
where organizational_structure_id is not null
group by organizational_structure_id
having count(*) > 1


