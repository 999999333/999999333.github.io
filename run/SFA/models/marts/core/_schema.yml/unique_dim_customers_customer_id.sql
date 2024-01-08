select
      
      count(*) as failures,
      case when count(*) != 0
        then 'true' else 'false' end as should_warn,
      case when count(*) != 0
        then 'true' else 'false' end as should_error
    from (
      
      select *
      from "L50_SB_Vitek"."sfa_dbt_test__audit"."unique_dim_customers_customer_id"
  
    ) dbt_internal_test