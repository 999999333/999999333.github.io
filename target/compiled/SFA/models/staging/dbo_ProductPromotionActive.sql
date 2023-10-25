with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_ProductPromotionActive"

),

renamed as (

    select
        country_code,
        product_id,
        componentid,
        dlm,
        valid_from,
        valid_to

    from source

)

select * from renamed