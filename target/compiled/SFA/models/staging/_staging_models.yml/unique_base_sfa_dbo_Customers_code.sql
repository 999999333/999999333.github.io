
    
    

select
    code as unique_field,
    count(*) as n_records

from "SFA_Warehouse"."dbt"."base_sfa_dbo_Customers"
where code is not null
group by code
having count(*) > 1


