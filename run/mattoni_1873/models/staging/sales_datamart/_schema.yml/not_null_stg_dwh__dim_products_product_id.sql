select
      
      count(*) as failures,
      case when count(*) != 0
        then 'true' else 'false' end as should_warn,
      case when count(*) != 0
        then 'true' else 'false' end as should_error
    from (
      
      select *
      from "L50_SB_Vitek"."sfa_dbt_test__audit"."not_null_stg_dwh__dim_products_product_id"
  
    ) dbt_internal_test