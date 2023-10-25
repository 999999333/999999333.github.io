with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_OutletDistribution"

),

renamed as (

    select
        country_code,
        olcard_id,
        product_id,
        ispresent,
        price,
        issetup,
        outofstockreason,
        valid_from,
        valid_to

    from source

)

select * from renamed