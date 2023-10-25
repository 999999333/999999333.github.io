with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_OutletOrderD"

),

renamed as (

    select
        country_code,
        orderno,
        product_id,
        price,
        product_qty,
        discount,
        isreturnable,
        vat,
        recommend_qty,
        baseprice,
        consumerunitid,
        initialproductid,
        promoactivities_id,
        returnreasonid,
        valid_from,
        valid_to

    from source

)

select * from renamed