with source as (
      select * from "L01_Stage"."sap"."customer_now_dvt_c_hv"
),
renamed as (
    select
        "customer_id" as customer_id,
        "customer_code" as customer_code

    from source
)
select * from renamed