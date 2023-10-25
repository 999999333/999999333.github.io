select
      
      count(*) as failures,
      case when count(*) != 0
        then 'true' else 'false' end as should_warn,
      case when count(*) != 0
        then 'true' else 'false' end as should_error
    from (
      
      select *
      from "SFA_Warehouse"."dbt_dbt_test__audit"."not_null_my_first_dbt_model_id"
  
    ) dbt_internal_test