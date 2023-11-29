select
      
      count(*) as failures,
      case when count(*) != 0
        then 'true' else 'false' end as should_warn,
      case when count(*) != 0
        then 'true' else 'false' end as should_error
    from (
      
      select *
      from "DWH_Fabric"."dbt_dbt_test__audit"."unique_dim_visit_gps_visit_id"
  
    ) dbt_internal_test