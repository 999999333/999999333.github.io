
    
    

select
    _dbt_source_relation as unique_field,
    count(*) as n_records

from "L50_SB_Vitek"."sfa"."sales_real"
where _dbt_source_relation is not null
group by _dbt_source_relation
having count(*) > 1


