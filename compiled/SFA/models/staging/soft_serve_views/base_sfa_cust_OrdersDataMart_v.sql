with source as (
      select * from "DWH_Fabric"."dbt"."cust_OrdersDataMart_v"
),
renamed as (
    select
        

    from source
)
select * from renamed