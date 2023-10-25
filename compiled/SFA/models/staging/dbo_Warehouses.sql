with source as (

    select * from "SFA_Warehouse"."dbt"."dbo_Warehouses"

),

renamed as (

    select
        country_code,
        w_id,
        w_externalcode,
        wtype_id,
        cust_id,
        w_longname,
        w_shortname,
        stockaccounting,
        stockmanagement,
        stockorder,
        deliverydelay,
        lotaccounting,
        status,
        ulm,
        dlm,
        stocknegative,
        priority,
        address,
        startingstockdate,
        countholidaysfordelivery,
        email,
        valid_from,
        valid_to

    from source

)

select * from renamed