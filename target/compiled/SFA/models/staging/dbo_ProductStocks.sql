with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_ProductStocks"

),

renamed as (

    select
        country_code,
        w_id,
        product_id,
        stock,
        required,
        dlm,
        stockeditadd,
        stockedittotal,
        valid_from,
        valid_to

    from source

)

select * from renamed